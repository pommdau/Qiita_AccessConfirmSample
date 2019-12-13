//
//  AppDelegate.swift
//  AccessConfirmSample

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var windowPopupButton: NSPopUpButton!
    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        window.level = NSWindow.Level(rawValue: NSWindow.Level.RawValue(kCGNormalWindowLevel))
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func windowLevelChanged(_ sender: NSPopUpButton) {
        switch sender.selectedTag() {
        case 0:
            window.level = NSWindow.Level(rawValue: NSWindow.Level.RawValue(kCGNormalWindowLevel))
        case 1:
            window.level = NSWindow.Level(rawValue: NSWindow.Level.RawValue(kCGModalPanelWindowLevel))
        case 2:
            window.level = NSWindow.Level(rawValue: NSWindow.Level.RawValue(kCGScreenSaverWindowLevel))
        default:
            window.level = NSWindow.Level(rawValue: NSWindow.Level.RawValue(kCGNormalWindowLevel))
        }
    }
    
    @IBAction func openButtonClicked(_ sender: Any) {
        let fileData: Data?
        do {
            let fileUrl = URL(fileURLWithPath: "/Users/ikeh/Desktop/sample.txt")
            fileData = try Data(contentsOf:fileUrl)
        } catch {
            // ファイルデータの取得でエラーの場合
            fileData = nil
        }
        print("\(String(describing: fileData))")
    }
}

