import QtQuick 2.11
import QtQuick.Controls 2.4

Column {
    id: clock
    spacing: 0
    width: parent.width / 2

    Label {
        id: timeLabel
        anchors.left: parent.left
        font.pointSize: root.font.pointSize * 3
        color: root.palette.text
        renderType: Text.QtRendering
        function updateTime() {
            text = new Date().toLocaleTimeString(Qt.locale(config.Locale), config.HourFormat == "long" ? Locale.LongFormat : config.HourFormat !== "" ? config.HourFormat : Locale.ShortFormat)
        }
    }

    Label {
        id: dateLabel
        anchors.left: parent.left
        font.pointSize: root.font.pointSize * 1
        color: root.palette.text
        renderType: Text.QtRendering
    
        function updateTime() {
            var dateString = new Date().toLocaleDateString(Qt.locale(config.Locale), config.DateFormat == "short" ? Locale.ShortFormat : config.DateFormat !== "" ? config.DateFormat : Locale.LongFormat);
            text = dateString.slice(0, -5); // Remove the last 4 characters and the space before the year
        }
    }


    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            dateLabel.updateTime()
            timeLabel.updateTime()
        }
    }

    Component.onCompleted: {
        dateLabel.updateTime()
        timeLabel.updateTime()
    }
}
