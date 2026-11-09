# Glasswave V4.1 — Tauri desktop music player

This ZIP contains the Glasswave V4.1 source project and a GitHub Actions workflow that can build the Windows installer on a GitHub-hosted Windows machine.

## Easiest route: build the EXE with GitHub Actions

You need a GitHub account and a Windows installer build will be produced by GitHub. You do **not** need to install Rust, Node.js or Visual Studio Build Tools on your own PC for this route.

1. Go to https://github.com/ and sign in (create an account if needed).
2. Create a new repository. Give it a name such as `glasswave-v4-1`. A private repository is fine. Do not initialise it with a README, `.gitignore` or licence.
3. Download and extract this ZIP on your PC.
4. Open the new GitHub repository and choose **Add file → Upload files**.
5. Open the extracted `Glasswave-V4.1-Tauri` folder and upload **all its contents**, including the hidden `.github` folder. The `.github/workflows/build-windows.yml` file is what tells GitHub how to build the installer.
   - If the `.github` folder is hidden in File Explorer, enable **View → Show → Hidden items**.
   - Make sure `package.json`, `index.html`, `src`, `src-tauri`, `vite.config.js`, and `.github` appear at the repository's top level—not inside an extra nested project folder.
6. Commit the uploaded files to the `main` branch.
7. In the repository, open the **Actions** tab. Select **Build Glasswave for Windows** and click **Run workflow → Run workflow** if it has not already started from the upload.
8. Wait for the workflow to finish with a green tick. Open that completed run and scroll to **Artifacts**.
9. Download **Glasswave-V4.1-Windows-Installer**. Extract the downloaded artifact ZIP and run the `.exe` inside it.

GitHub's Actions interface may vary slightly. The build can take several minutes, especially the first time. The artifact is retained for 14 days by this workflow.

## Alternative: build locally on Windows

Requirements: Windows 10/11, Node.js LTS, Rust stable, and Microsoft C++ Build Tools with **Desktop development with C++** and a Windows SDK.

1. Extract this ZIP to a normal folder.
2. Double-click `Build-Windows-Installer.bat`.
3. When the build completes, open `src-tauri\target\release\bundle\nsis\`.
4. Run the `.exe` installer in that folder.

## Run the development version

Double-click `Run-Glasswave-Dev.bat`.

## Features

- Local audio file playback, playlist queue, seek, previous/next.
- Optional Web Audio visualiser for local audio.
- Compact mode, reduce animations, artwork glow and accent colour.
- Official Spotify and SoundCloud embeds.

## Notes and limitations

- This is a **source project**, not a precompiled EXE. The GitHub Actions workflow builds the EXE for you.
- Local file selections are temporary and are not saved after closing the app.
- The visualiser analyses local audio only. Spotify/SoundCloud embeds are isolated by browser security and have their own playback controls; the app's local transport controls do not control embedded players.
- Spotify/SoundCloud may require sign-in and are subject to their own account, region and playback restrictions.
- Internet access is required for dependency downloads and embedded streaming services.
