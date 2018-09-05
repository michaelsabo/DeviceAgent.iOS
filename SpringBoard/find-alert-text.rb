#!/usr/bin/env ruby

require "run_loop"

DIR="/Xcode/10.0/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator"

Dir.glob("#{DIR}/**/*.strings") do |file|
  if !file[/InfoPlist/]
    args = ["/usr/libexec/PlistBuddy", "-c", "Print", file]
    hash = RunLoop::Shell.run_shell_command(args)

    out = hash[:out]

    if hash[:exit_status] != 0
      puts out
      break
    end

    if out[/#{ARGV[0]}/]
      puts file
    end
  end
end

FRAMEWORK = [
  "CoreLocation.framework",
  "TCC.framework",
  "CoreTelephony.framework",               #*.lproj/CBMessage.strings
  "NetworkExtension.framework",
  "SpringBoard.app",                       #*.lproj/SpringBoard.strings
  "TextInput.framework",                   #*.lproj/?.strings
  "MobileSafari.app",
  "AuthKit.framework",
  "UserNotificationsServer.framework"
]

LOCATION_KEYS = [
  "LOCATION_CLIENT_PERMISSION_WHENINUSE_BUTTON",
  "LOCATION_CLIENT_PERMISSION_NEVER_BUTTON",
  "DONT_ALLOW",
  "LOCATION_CLIENT_PERMISSION_OK",
  "LOCATION_CLIENT_PERMISSION_CANCEL",
  "LOCATION_CLIENT_PERMISSION_ALWAYS_BUTTON",

  "LOCATION_CLIENT_PERMISSION",
  "LOCATION_CLIENT_PERMISSION_ALWAYS",
  "LOCATION_CLIENT_PERMISSION_WHENINUSE",
  "LOCATION_CLIENT_PERMISSION_UPGRADE_WHENINUSE_ALWAYS"
]

TCC_KEYS = [
  "REQUEST_ACCESS_DENY",
  "REQUEST_ACCESS_ALLOW",
  "REQUEST_ACCESS_INFO_SERVICE_kTCCServiceSiri",
  "REQUEST_ACCESS_SERVICE_kTCCServiceMicrophone",
  "REQUEST_ACCESS_SERVICE_kTCCServicePhotosAdd",
  "REQUEST_ACCESS_SERVICE_kTCCServiceCalendar",
  "REQUEST_ACCESS_INFO_SERVICE_kTCCServiceSpeechRecognition",
  "REQUEST_ACCESS_SERVICE_kTCCServiceMotion",
  "REQUEST_ACCESS_SERVICE_kTCCServiceCamera",
  "REQUEST_ACCESS_SERVICE_kTCCServiceReminders",
  "REQUEST_ACCESS_SERVICE_kTCCServiceSiri",
  "REQUEST_ACCESS_SERVICE_kTCCServiceMediaLibrary",
  "REQUEST_ACCESS_SERVICE_kTCCServiceAddressBook",
  "REQUEST_ACCESS_SERVICE_kTCCServicePhotos",
  "REQUEST_ACCESS_SERVICE_kTCCServiceWillow",
  "REQUEST_ACCESS_SERVICE_kTCCServiceCalls",
  "REQUEST_ACCESS_SERVICE_kTCCServiceBluetoothPeripheral",
  "REQUEST_ACCESS_SERVICE_kTCCServiceSpeechRecognition"
]

CORE_TELEPHONY_KEYS = [
  "CANCEL",
  "CTFU_LABEL_ACTION_DISMISS",
  "CONTINUE",
  "CBMessageDeclineButton",
  "OK",
  "DONE",
  "CONTACT_CARRIER_FOR_DETAILS",
  "NO_SIM_CARD_INSTALLED",
  "CBMessageTitle"
]

NETWORK_EXTENSION_KEYS = [
  "DONT_ALLOW_BUTTON",
  "ALLOW_BUTTON",
  "APP_WARNING_HEADER_VPN"
]

SPRINGBOARD_KEYS = [
   "OK",
   "ACTIVATION_FAILED_IGNORE_BUTTON",
   "ACTIVATION_FAILED_TITLE"
]

TEXT_INPUT_KEYS = [
  "DICTATION_OPT_IN_NOT_NOW",
  "DICTATION_OPT_IN_TITLE",
  "DICTATION_OPT_IN_ENABLE",
]

MOBILE_SAFARI_KEYS = [
  "Open",
  "OK",
  "Cancel",
  "Open in “%@”",
  "Open in “%@”?",
  "Open in the %@ app"
]

AUTH_KIT_KEYS = [
  # DeviceAgent only 'Cancel's these alerts
  "INLINE_PASSWORD_ALERT_CANCEL_BUTTON",
  "INLINE_PASSWORD_ALERT_TITLE_SERVICE_APP_STORE",
  "INLINE_PASSWORD_ALERT_TITLE_SERVICE_GAME_CENTER",
  "INLINE_PASSWORD_ALERT_TITLE_SERVICE_APP_STORE"
]

USER_NOTIFICATIONS_SERVER_KEYS = [
  "USER_NOTIFICATION_PERMISSION_ALERT_ALLOW",
  "USER_NOTIFICATION_PERMISSION_ALERT_DENY",
  "USER_NOTIFICATION_PERMISSION_ALERT_TITLE",
  "CRITICAL_ALERT_PERMISSION_ALERT_TITLE"
]
