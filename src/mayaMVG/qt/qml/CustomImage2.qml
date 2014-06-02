import QtQuick 1.1
import QtDesktop 0.1


Rectangle {
    id: customImage

    property color leftBorderColor: "grey"
    property color rightBorderColor: "grey"
    property string source: "img/Folder.png"
    property bool leftChecked: false
    property bool rightChecked: false

    property color selectedColor: "#fec04c"
    property color hoverColor: "white"
    property color normalColor: "transparent"

    Image {
        id: image
        anchors.fill: parent

        sourceSize.width: 400
        source: customImage.source
        asynchronous: true
    }

    Rectangle {
        id: leftRectangle

        width: parent.width/2
        height: parent.height
        color: leftBorderColor
        state: leftStateGroup.state
        opacity: 0.5

        StateGroup {
            id: leftStateGroup

            states:[
                State {
                    name: "LEFT_HOVER"
                    when: (leftMouseArea.containsMouse)
                    PropertyChanges {target: thumbnail; leftBorderColor: hoverColor}
                },
                State {
                    name: "LEFT_NORMAL"
                    when: (!leftChecked)
                    PropertyChanges{target: thumbnail; leftBorderColor: normalColor}
                },
                State {
                    name: "LEFT_SELECTED"
                    when: (leftChecked == true)
                    PropertyChanges{target: thumbnail; leftBorderColor: selectedColor}
                }

           ]
        }

        MouseArea {
            id: leftMouseArea

            anchors.fill: parent
            hoverEnabled: true

            onClicked: _project.getCameraAtIndex(index).onLeftButtonClicked()
        }

    }

    Rectangle {
        id: rightRectangle

        anchors.right: parent.right
        width: parent.width/2
        height: parent.height
        color: rightBorderColor
        state: rightStateGroup.state
        opacity: 0.5

        StateGroup {
            id: rightStateGroup

            states:[
                State {
                    name: "RIGHT_HOVER"
                    when: (rightMouseArea.containsMouse)
                    PropertyChanges {target: thumbnail; rightBorderColor: hoverColor}
                },
                State {
                    name: "RIGHT_NORMAL"
                    when: (!rightChecked)
                    PropertyChanges{target: thumbnail; rightBorderColor: normalColor}
                },
                State {
                    name: "RIGHT_SELECTED"
                    when: (rightChecked == true)
                    PropertyChanges{target: thumbnail; rightBorderColor: selectedColor}
                }
           ]
        }

        MouseArea {
            id: rightMouseArea

            anchors.fill: parent
            hoverEnabled: true

            onClicked: _project.getCameraAtIndex(index).onRightButtonClicked()
        }


    }

}