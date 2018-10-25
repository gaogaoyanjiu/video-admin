package com.tdtk.web.util;

import java.util.Map;

import org.apache.curator.framework.CuratorFramework;
import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.ZooDefs.Ids;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tdtk.utils.JsonUtils;


/**
 * ZKCurator客户端工具类
 */
public class ZKCurator {

	// zk客户端
	private CuratorFramework client = null;	
	final static Logger log = LoggerFactory.getLogger(ZKCurator.class);
	
    // 通过spring的xml配置文件的属性注入赋值
	public ZKCurator(CuratorFramework client) {
		this.client = client;
	}
	
	public void init() {
		//使用命名空间，没有会自动创建
		client = client.usingNamespace("admin");
		
		try {
			// 判断在admin命名空间下是否有bgm节点  /admin/bmg
			if (client.checkExists().forPath("/bgm") == null) {
				/**
				 * 对于zk来讲，有两种类型的节点:
				 * 持久节点: 当你创建一个节点的时候，这个节点就永远存在，除非你手动删除
				 * 临时节点: 你创建一个节点之后，会话断开，会自动删除，当然也可以手动删除
				 */
				client.create().creatingParentsIfNeeded()   // 递归创建节点
					.withMode(CreateMode.PERSISTENT)		// 节点类型：持久节点
					.withACL(Ids.OPEN_ACL_UNSAFE)			// acl：匿名权限
					.forPath("/bgm");						// 找到对应的节点,默认保存的是客户端IP地址,如：192.168.200.1
				log.info("zookeeper初始化成功...");
				
				log.info("zookeeper服务器状态：{}", client.isStarted());
			}
		} catch (Exception e) {
			log.error("zookeeper客户端连接、初始化错误...");
			e.printStackTrace();
		}
	}
	
	/**
	 * 向节点添加数据(admin工程创建节点和添加数据，springboot项目监听节点和删除子节点)
	 * @Description: 增加或者删除bgm，向zk-server创建子节点，供小程序后端监听
	 */
	public void sendBgmOperator(String bgmId, String operObj) {
		try {
			
			client.create().creatingParentsIfNeeded()
				.withMode(CreateMode.PERSISTENT)		// 节点类型：持久节点
				.withACL(Ids.OPEN_ACL_UNSAFE)			// acl：匿名权限
				.forPath("/bgm/" + bgmId, operObj.getBytes());
			
			
			
			Map<String, String> map = JsonUtils.jsonToPojo(operObj, Map.class);
			String operatorType = map.get("operType");
			String songPath = map.get("path");
			
			log.info("向zookeeper服务器添加节点：{},数据为：({}),状态为：{}",songPath,operatorType, "1".equals(operatorType) ? "新增(1)" : "删除(2)");
		} catch (Exception e) { 
			e.printStackTrace();
		}
	}
	
}
