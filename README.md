# shadowsocks-libv with net-speeder
这是一个Shadowsocks Docker


## 启动方式

```
docker run -d --name ss-with-net-speeder -p 8989:8989 -p 22:22 hikaruchang/ss-with-net-speeder -s 0.0.0.0 -p 8989 -k hahahaha -m chacha20-ietf-poly1305
```

## Docker 启动

```
镜像 ：hikaruchang/ss-with-net-speeder
启动命令(CMD) ：-s 0.0.0.0 -p 8989 -k hahahaha -m chacha20-ietf-poly1305
```

## 支持SSH
用户名：root
密  码：password

## SSR镜像
https://github.com/hikaruchang/ssr-with-net-speeder

## 感谢
lowid/ss-with-net-speeder </br>
malaohu/ss-with-net-speeder
