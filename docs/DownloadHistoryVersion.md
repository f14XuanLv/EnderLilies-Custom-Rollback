# How to Download Historical Versions of Steam Games
*Using ENDER LILIES on Windows as an example*

## Obtaining Information

> [!NOTE]
> Some game content on SteamDB may be incomplete without logging in. Sometimes you need to log in to the SteamDB website with your own account.

### App ID

Right-click the game in your Steam Library and open the properties panel to get the App ID.

The App ID for ENDER LILIES is 1369630

![app_id](/docs/images/app_id.png)  

### Depot ID

Use the following URL format to view the Depot IDs for the corresponding game:
```
https://steamdb.info/app/{AppID}/depots
```

The URL for ENDER LILIES is:
https://steamdb.info/app/1369630/depots

![depot_id](/docs/images/depot_id.png)

As shown, the depot ID for the Windows version of ENDER LILIES is 1369631

### Manifest ID

Use the following URL format to view the Manifest IDs for the corresponding Depot ID:
```
https://steamdb.info/depot/{Depot ID}/manifests # Simplified table
https://steamdb.info/depot/{Depot ID}/history # Detailed information
```

The number of Manifest IDs roughly represents the number of minor versions available.
Check the game announcements on the Steam Library page, and based on the announcement content and corresponding dates, identify the version you want. Use the date to determine the Manifest ID of your target version.

The URLs for ENDER LILIES are:
https://steamdb.info/depot/1369631/manifests
https://steamdb.info/depot/1369631/history

---

## Download

Press Win+R to open the Run dialog, and enter:

```
steam://open/console
```

This will open the console.
In the Steam console, enter the command in the following format and press Enter to execute:

```
download_depot <AppID> <DepotID> <ManifestID>

# Download ENDER LILIES v1.0.6
download_depot 1369630 1369631 2363071559785156567
```

Wait for the download to complete. The output will show the download save path, which is typically:

```
...\Steam\steamapps\content\app_{APP ID}\depot_{DepotID}

# The download save path for ENDER LILIES on Windows is:
...\Steam\steamapps\content\app_1369630\depot_1369631 
```

Navigate to the path folder, find the corresponding executable file, and you can run the game.

> [!IMPORTANT]
> Due to the save logic of the download process, different versions of the same game are not automatically separated. Repeatedly downloading different versions of the same game will default to downloading content to the same folder, causing file conflicts. Therefore, after completing a single version download, it is recommended to rename the downloaded game files, such as renaming `depot_1369631` to `depot_1369631_v1.0.6`, to keep them isolated.