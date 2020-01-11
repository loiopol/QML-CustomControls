import QtQuick 2.13
import QtGraphicalEffects 1.0

Item {
    id: root
    property bool checked: false
    onCheckedChanged: pillId.x = root.checked ? (root.width - pillId.width) : 0

    function onClicked(checked) {
        root.checked = checked
    }

    property string offColor: "indianred"
    property string onColor: "seagreen"

    width: 60; height: 35;

    Rectangle {
        id: bgId

        y: root.height * (1 - 0.5) / 2
        width: root.width; height: root.height*.5;
        radius: height*.5

        color: root.checked ? Qt.lighter(root.onColor, 1.45) : Qt.lighter(root.offColor, 1.45)
        Behavior on color { ColorAnimation { duration: 200 } }
    }

    Rectangle {
        id: pillId

        x: 0
        height: root.height; width: height;
        radius: height*.5;

        color: root.checked ? root.onColor : root.offColor

        Behavior on x { NumberAnimation { duration: 200; easing.type: Easing.OutQuad } }
        Behavior on color { ColorAnimation { duration: 200 } }
    }

    DropShadow { // Shadow: remove this for better performance
        id: pillShadowId
        enabled: false

        anchors.fill: pillId
        source: pillId

        verticalOffset: 5
        radius: 10
        samples: 15
        color: "#77000000"
    }

    MouseArea {
        id: mouseAreaId

        anchors.fill: parent

        drag {
            target: pillId
            axis: Drag.XAxis
            minimumX: 0
            maximumX: root.width - pillId.width
        }

        onReleased: {
            if(!root.checked && pillId.x === 0)
                root.onClicked(!root.checked)
            else if(root.checked && pillId.x === root.width - pillId.width)
                root.onClicked(!root.checked)
            else if(!root.checked && (pillId.x + pillId.width*.5) > root.width*.5)
                root.onClicked(!root.checked)
            else if(root.checked && (pillId.x + pillId.width*.5) < root.width*.5)
                root.onClicked(!root.checked)
            else
               pillId.x = root.checked ? (root.width - pillId.width) : 0
        }
    }

    onWidthChanged: pillId.x = root.checked ? (root.width - pillId.width) : 0
}
