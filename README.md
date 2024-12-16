**Portall汉化**

当前汉化文件对应的版本`1.0.8`

# 使用方法

下载本仓库,替换掉原Portall中`templates`目录

具体步骤

- 点击 `下载 ZIP` 下载文件
- 解压得到文件夹`portall-zh-cn`
- 上传这个目录到NAS的自定义位置
- 在Docker部署时,把这个目录映射到容器的`/app/templates`

# Docker Compose示例

```yml
services:
  portall:
    container_name: portall
    image: need4swede/portall:1.0.8
    network_mode: bridge
    restart: unless-stopped
    #restart: always
    # 下面两行限制CPU和内存,可不加,如个报错和删除
    cpus: 1
    mem_limit: 512m
    # 下面5行,限制日志大小,个按需调整
    logging:
      driver: "json-file"
      options:
        max-size: "1m"
        max-file: "3"
    environment:
      TZ: Asia/Shanghai
      TIME_ZONE: Asia/Shanghai
      SECRET_KEY: 自定义秘钥
    volumes:
      - 数据位置:/app/instance
      - 汉化目录portall-zh-cn的位置:/app/templates
    ports:
      - 自定义访问端口:8080
```
