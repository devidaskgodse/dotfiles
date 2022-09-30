sudo apt install adb
adb devices -l
# when in doubt, prefer to disable the apps first. if it causes problem, you can revert back and enable it
adb shell pm uninstall -k --user 0 com.miui.cloudservice
adb shell pm uninstall -k --user 0 com.miui.micloudsync
adb shell pm uninstall -k --user 0 com.xiaomi.mipicks
adb shell pm uninstall -k --user 0 com.android.browser
shell pm uninstall -k --user 0 com.google.android.apps.inputmethod.hindi
adb shell pm uninstall -k --user 0 com.xiaomi.payment
adb shell pm uninstall -k --user 0 com.miui.weather2
adb shell pm uninstall -k --user 0 com.android.thememanager
adb shell pm uninstall -k --user 0 com.miui.msa.global
adb shell pm uninstall -k --user 0 com.mipay.wallet.in
adb shell pm uninstall -k --user 0 com.mfashiongallery.emag
adb shell pm uninstall -k --user 0 com.xiaomi.glgm
adb shell pm uninstall -k --user 0 com.miui.notes
adb shell pm uninstall -k --user 0 com.android.calendar
adb shell pm uninstall -k --user 0 com.google.android.music
adb shell pm uninstall -k --user 0 com.miui.cloudservice.sysbase
adb shell pm uninstall -k --user 0 com.miui.cloudbackup
adb shell pm uninstall -k --user 0 com.google.android.youtube
adb shell pm uninstall -k --user 0 com.mint.keyboard
adb shell pm uninstall -k --user 0 com.miui.player


#----
adb shell pm uninstall -k --user 0 com.miui.touchassistant
adb shell pm uninstall -k --user 0 com.google.ar.lens
adb shell pm uninstall -k --user 0 com.google.android.apps.tachyon
adb shell pm disable-user --user 0 com.google.android.apps.wellbeing
adb shell pm disable-user --user 0 com.android.bookmarkprovider


## failed recently
adb shell pm uninstall -k --user 0 com.miui.cloudservice
adb shell pm uninstall -k --user 0 com.tencent.soter.soterserver
adb shell pm uninstall -k --user 0 com.miui.android.fashiongallery
adb shell pm uninstall -k --user 0 com.xiaomi.miplay_client
adb shell pm uninstall -k --user 0 com.netflix.partner.activation
adb shell pm uninstall -k --user 0 com.mi.globalbrowser


# do not remove list
# adb shell pm uninstall -k --user 0 com.android.providers.calendar