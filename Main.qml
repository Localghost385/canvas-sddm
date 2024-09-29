import QtQuick 2.11
import QtQuick.Controls 2.4
import "Components"

Pane {
    id: root

    height: config.ScreenHeight
    width: config.ScreenWidth
    padding: config.ScreenPadding || root.padding

    LayoutMirroring.enabled: config.ForceRightToLeft == "true" ? true : Qt.application.layoutDirection === Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    palette.button: "transparent"
    palette.highlight: config.ThemeColor
    palette.text: config.ThemeColor
    palette.buttonText: config.ThemeColor

    font.family: config.Font
    font.pointSize: config.FontSize !== "" ? config.FontSize : parseInt(height /75)
    focus: true

    // Fullscreen background image
    Image {
        id: backgroundImage
        source: config.background || config.Background
        anchors.fill: parent
        asynchronous: true
        cache: true
        fillMode: config.ScaleImageCropped == "true" ? Image.PreserveAspectCrop : Image.PreserveAspectFit
        clip: true
        mipmap: true
    }

    Item {
        id: formContainer
        width: parent.width / 3 
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        Menu {
            anchors.fill: parent
        }
    }

}
