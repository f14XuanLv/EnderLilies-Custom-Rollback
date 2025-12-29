**简体中文** | [English](README.md)

# EnderLilies 自定义回滚

用该项目可生成回滚 《EnderLilies》 角色部分技能至部分历史版本的补丁包

目前该项目内置了一个批处理脚本 [pak.bat](pak.bat) 和 [UnrealReZen](https://github.com/rm-NoobInCoding/UnrealReZen) 的 Release 可执行文件，演示如何生成 `技能回滚 MOD/补丁包` (`.pak` `.ucas` `.utoc`)

> [!NOTE]
> 目前这个项目展示的工作流只能回滚资产结构未改变的角色，如果角色资产结构有较大变化，按照该项目目前工作流进行回滚产生的补丁包可能导致游戏崩溃。
> 
> 后续将考虑利用 [UAssetAPI](https://github.com/atenfyr/UAssetAPI) 等工具对这类问题进行解决。

## 使用步骤

### 1. 下载你期望回滚的游戏版本

阅读 [如何下载Steam游戏历史版本](/docs/DownloadHistoryVersion.zh-CN.md) 以获得指导

### 2. 使用 [FModel](https://github.com/4sval/FModel) 导出游戏历史版本的相关资产

《EnderLilies》的角色技能数据基本集中在 `EnderLilies/Content/_Zenith/Gameplay/Abilities/` 路径下

你只需要导出你期望回滚的角色的资产即可

下图以 `黑色魔女伊莱恩` 为例，你只需要点击 `Export Folder's Packages Raw Data (.uasset)` 这一个选项

![export_uasset_by_fmodel](/docs/images/export_uasset_by_fmodel.png)

导出完毕后，将导出的内容保持项目原有路径移动到本项目下，本项目提供了 `黑色魔女伊莱恩` 和 `堕落的弓兵` 的技能回滚案例，务必参考本项目 [Exports](Exports) 文件夹的内部结构以确保文件结构正确。

### 3. 修改 [pak.bat](pak.bat) 的 `GAME_DIR` 为你自己实际的游戏路径

```bat
@echo off
rem Set your actual directory
set GAME_DIR=C:\Game\Steam\steamapps\common\ENDER LILIES\EnderLilies\Content\Paks
```

该路径需要指向 `Paks` 文件夹，且对应的游戏是你希望注入补丁包的那个版本的游戏

> [!NOTE]
> 注意 `Paks` 文件夹内不要包含其余非官方原始的文件和Mod，如果有，请先将这些文件转移到其他位置

### 4. 生成补丁文件

双击 `pak.bat` 或者通过终端在项目路径下输入 `.\pak.bat` 以执行生成补丁包

生成的补丁包默认路径在本项目的 `dist` 文件夹下，默认名字为 `EnderLilies_CustomRollback`

### 5. 安装补丁文件

将 `EnderLilies_CustomRollback` 文件夹放置到 `Paks` 文件夹下，例如：

```
...\Steam\steamapps\common\ENDER LILIES\EnderLilies\Content\Paks\
```

接下来运行游戏即可验证效果

