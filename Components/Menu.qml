import QtQuick 2.11
import QtQuick.Layouts 1.11
import SddmComponents 2.0 as SDDM

ColumnLayout {
    id: formContainer
    SDDM.TextConstants { id: textConstants }

    Item {
        // spacer item
        Layout.fillWidth: true
        Layout.preferredHeight: root.height / 4
        Rectangle { anchors.fill: parent; color: "#00000000" } // to visualize the spacer
    }

    Clock {
        id: clock
        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
        Layout.preferredHeight: root.height / 4
    }

    Item {
        // spacer item
        Layout.fillWidth: true
        Layout.preferredHeight: root.height / 12
        Rectangle { anchors.fill: parent; color: "#00000000" } // to visualize the spacer
    }

    Input {
        id: input
        Layout.alignment: Qt.AlignTop
        Layout.preferredHeight: root.height / 3
    }

    SystemButtons {
        id: systemButtons
        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
        Layout.preferredHeight: root.height / 4
        exposedLogin: input.exposeLogin
    }

}
