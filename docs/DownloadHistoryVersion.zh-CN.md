# 如何下载Steam游戏历史版本
*以 Windows 上《ENDER LILIES》为例*

## 获取信息

> [!NOTE]
> 未登录的 steamdb 部分游戏的内容可能不全，有时需要在 steamdb 网站上登陆你自己的账号。

### App ID

Steam库里右键游戏打开属性面板，获取 App ID

《ENDER LILIES》的 App ID 是 1369630

![app_id](/docs/images/app_id.png)  

### Depot ID

用如下格式 url 查看对应游戏的 Depot ID 有哪些
```
https://steamdb.info/app/{AppID}/depots
```

《ENDER LILIES》的 URL 如下：
https://steamdb.info/app/1369630/depots

![depot_id](/docs/images/depot_id.png)

如图，《ENDER LILIES》 Windows 版本的 depot id 是 1369631

### Manifest ID

用如下格式 url 查看对应该 Depot ID 的 Manifest ID 有哪些
```
https://steamdb.info/depot/{Depot ID}/manifests # 精简表格
https://steamdb.info/depot/{Depot ID}/history # 详细信息
```

有多少个 Manifest ID 基本代表有多少个小版本。
查看 Steam 库页面的游戏公告，根据公告内容和对应的日期锁定你要的版本，通过日期确定你的目标版本的 Manifest ID。

《ENDER LILIES》的 URL 如下：
https://steamdb.info/depot/1369631/manifests
https://steamdb.info/depot/1369631/history

---

## 下载

Win+R 打开运行窗口，输入：

```
steam://open/console
```

打开控制台
在 Steam 控制台内，按如下格式输入指令并回车执行即可

```
download_depot <AppID> <DepotID> <ManifestID>

# 下载《ENDER LILIES》 v1.0.6 版本
download_depot 1369630 1369631 2363071559785156567
```

等待下载完成，会输出下载保存路径，一般为

```
...\Steam\steamapps\content\app_{APP ID}\depot_{DepotID}

# Windows 上《ENDER LILIES》的下载保存路径为：
...\Steam\steamapps\content\app_1369630\depot_1369631 
```

进入路径文件夹，找到对应可执行文件即可运行游戏

> [!IMPORTANT]
> 由于上述下载流的保存逻辑不会自动区分不同版本的游戏，重复下载同一个游戏的不同版本，默认会将内容下载到同一个文件夹，导致内部文件混乱，所以单个版本下载完成后，推荐将下载的游戏文件如 `depot_1369631` 重命名为 `depot_1369631_v1.0.6` ，以便隔离。

