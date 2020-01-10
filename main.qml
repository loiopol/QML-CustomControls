import QtQuick 2.13
import QtQuick.Window 2.13

import "./Components" as MyComp

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("QML-Controls by Lorenzo Aldrighetti")

    Column {
        anchors.centerIn: parent

        MyComp.Switch {
            id: switchId
        }
    }
}
