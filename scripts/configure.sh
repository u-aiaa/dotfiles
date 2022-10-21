#!/usr/bin/env bash

set -e

# https://macos-defaults.com/

if ! command -v defaults > /dev/null 2>&1; then
    echo "\`defaults\` not found. Nothing to do."
    exit 0
fi

echo "Configuring..."
chflags nohidden ~/Library # ~/Library ディレクトリを見えるようにする
sudo chflags nohidden /Volumes # /Volumes ディレクトリを見えるようにする
sudo nvram SystemAudioVolume=" " # ブート時のサウンドを無効化する

defaults write -g NSAutomaticWindowAnimationsEnabled -bool false # ファイルを開くときのアニメーションを無効にする
defaults write -g NSInitialToolTipDelay -integer 0 # ツールチップ表示までのタイムラグをなくす
defaults write -g NSWindowResizeTime 0.1 # ダイアログ表示やウィンドウリサイズ速度を高速化する

defaults write NSGlobalDomain AppleShowAllExtensions -bool true # 全ての拡張子のファイルを表示する
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001 # コンソールアプリケーションの画面サイズ変更を高速にする
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true # Safari のコンテキストメニューに Web インスペクタを追加する

defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40 # Bluetooth ヘッドフォン・ヘッドセットの音質を向上させる

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true    # USB やネットワークストレージに .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

defaults write com.apple.screencapture disable-shadow -bool true # スクリーンキャプチャの影をなくす
defaults write com.apple.screencapture type -string "png" # スクリーンショットの保存形式を PNG にする

defaults write -g AppleShowScrollBars -string "WhenScrolling"
# defaults write -g AppleShowScrollBars -string "Always"    # スクロールバーを常時表示する
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>49</integer><integer>262144</integer></array><key>type</key><string>standard</string></dict></dict>"

echo "Configuring Keyboard..."
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2

echo "Configuring Trackpad..."
defaults write -g com.apple.trackpad.scaling 5

echo "Mission Control..."
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-delay" -float "0.1"
killall Dock

echo "Configuring Finder..."
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowStatusBar -bool true
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
# Remove items from the Trash after 30 days
defaults write com.apple.finder FXRemoveOldTrashItems -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true # Finder のタイトルバーにフルパスを表示する
defaults write com.apple.finder _FXSortFoldersFirst -bool true # 名前で並べ替えを選択時にディレクトリを前に置くようにする
defaults write com.apple.finder AnimateWindowZoom -bool false # フォルダを開くときのアニメーションを無効にする
defaults write com.apple.finder AppleShowAllFiles YES # 不可視ファイルを表示する
# defaults write com.apple.finder FXDefaultSearchScope -string "SCcf" # 検索時にデフォルトでカレントディレクトリを検索する
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false # 拡張子変更時の警告を無効化する
defaults write com.apple.finder QLEnableTextSelection -bool true # クイックルックでテキストを選択可能にする
defaults write com.apple.Finder QuitMenuItem -bool true # Finder を終了させる項目を追加する
defaults write com.apple.finder ShowPathbar -bool true # パスバーを表示する
defaults write com.apple.finder ShowStatusBar -bool true # ステータスバーを表示する
defaults write com.apple.finder ShowTabView -bool true # タブバーを表示する
# defaults write com.apple.finder WarnOnEmptyTrash -bool false # ゴミ箱を空にする前の警告を無効化する
killall Finder

echo "Configring Directory..."
mkdir -p ~/Documents/sources

echo "Configure etc..."
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist # Musicアプリを勝手に起動させない

echo ""
echo "Configuration Complete!"
echo "Please restart Mac to make sure settings are reflected."
