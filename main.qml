import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Layouts 1.13

import "./Components" as MyComp

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("QML-CustomControls by Lorenzo Aldrighetti")

    Text {
        id: pageTitleId
        text: qsTr("QML-CustomControls by Lorenzo Aldrighetti")
        anchors.horizontalCenter: parent.horizontalCenter
        topPadding: 20; bottomPadding: 20
        font.pointSize: 15
    }

    GridLayout {
        anchors.left: parent.left; anchors.top: pageTitleId.bottom; anchors.right: parent.right;
        anchors.margins: 20

        columns: 2
        columnSpacing: 20; rowSpacing: 20

        // FIRST Control
        Text {
            id: switchTextId
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft

            text: "<b>Switch.qml</b><br>" + qsTr("Original switch. Enabled: ") + switchId.checked
        }

        MyComp.Switch {
            id: switchId
            Layout.alignment: Qt.AlignHCenter
        }

        // SECOND Control
        Text {
            id: longSwitchTextId
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft

            text: "<b>Switch.qml</b><br>" + qsTr("Customized switch. Enabled: ") + swipeSwitchId.checked
        }

        MyComp.Switch {
            id: swipeSwitchId
            Layout.alignment: Qt.AlignHCenter

            offColor: "#8e8e93"
            onColor: "#147efb"

            width: 175;
        }
    }
}
