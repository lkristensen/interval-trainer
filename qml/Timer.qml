import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import Ubuntu.Layouts 0.1
import "Lists" 0.1

Page {
    id: root
    objectName: 'mainView'

    Layouts {
        id:layouts
        anchors.fill: parent
        layouts: [
            ConditionalLayout {
                name: "column"
                when: layouts.width < units.gu(50)
                Column {
                    anchors.fill: parent
                    ItemLayout {
                        item: "timer"
                        height: parent.height / 3 - units.gu(6)
                        anchors {
                            left: parent.left
                            right: parent.right
                        }
                    }
                    Row {
			anchors {
                            left: parent.left
                            right: parent.right
                        }
                        ItemLayout {
                            item: "music"
                            height: units.gu(6)
                            width: parent.width / 2
                        }                       
                        ItemLayout {
                            item: "play"
                            height: units.gu(6)
                            width: parent.width / 2
                        }
                    }
                    ItemLayout {
                        item: "current"
                        height: parent.height / 3 - units.gu(3)
                        anchors {
                            left: parent.left
                            right: parent.right
                        }
                    }
                    ItemLayout {
                        item: "next"
                        height: parent.height / 3 - units.gu(3)
                        anchors {
                            left: parent.left
                            right: parent.right
                        }
                    }
                    ItemLayout {
                        item: "fullProgram"
                        height: units.gu(6)
                        anchors {
                            left: parent.left
                            right: parent.right
                        }
                    }
                }
            },
            ConditionalLayout {
                name: "column"
                when: layouts.width >= units.gu(50)
                Column {
                    anchors.fill: parent
                    ItemLayout {
                        item: "timer"
                        height: parent.height - units.gu(12)
                        anchors {
                            left: parent.left
                            right: parent.right
                        }
                    }
                    Row {
			anchors {
                            left: parent.left
                            right: parent.right
                        }
                        ItemLayout {
                            item: "music"
                            height: units.gu(6)
                            width: parent.width / 12
                        }                       
                        ItemLayout {
                            item: "current"
                            width: parent.width / 12 * 5
                            anchors {
                                top: parent.top
                                bottom: parent.bottom
                            }
                        }
                        ItemLayout {
                            item: "next"
                            width: parent.width / 12 * 5
                            anchors {
                                top: parent.top
                                bottom: parent.bottom
                            }
                        }
                        ItemLayout {
                            item: "play"
                            height: units.gu(6)
                            width: parent.width / 12
                        }
                    }
                    ItemLayout {
                        item: "fullProgram"
                        height: units.gu(6)
                        anchors {
                            left: parent.left
                            right: parent.right
                        }
                    }
                }
            }
        ]
   
	Rectangle {
            id: timer
            Layouts.item: "timer"
            color: Colors.yellow
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
                right: parent.right
            }
            border.width: 1
            border.color: "white"
            PageHeader {
                visible: true
                StyleHints {
                    backgroundColor: "transparent"
                    dividerColor: "transparent"
                }

                leadingActionBar {
                    actions: [
                        Action {
                            id: backIcon
                            objectName: "backIcon"
                            iconName: "back"
                            onTriggered: {
                                pageStack.pop()
                            }
                        }
                    ]
                }
            }
            CircleTimer {
                percent: 0.66
                color: "white"
		text: "20:13"
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                    right: parent.right
                }
            }
        }
        Rectangle {
            id: currentExercise
            Layouts.item: "current"
            color: Colors.yellow
            border.width: 1
            border.color: "white"
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
                right: parent.right
            }
            Text {
                text: "Snatch"
                color: "white"
                font.pointSize: 24
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        Rectangle {
            id: nextExercise
            color: Colors.lightblue
            Layouts.item: "next"
            border.width: 1
            border.color: "white"
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
                right: parent.right
            }
            Text {
                text: "Swing"
                color: "white"
                font.pointSize: 24
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        Rectangle {
            id: program
            color: "white"
            Layouts.item: "fullProgram"
            border.width: 1
            border.color: "white"
            anchors {
                left: timer.left
                top: timer.bottom
                bottom: parent.bottom
                right: parent.right
            }
            Text {
                text: "program"
                color: "black"
            }
        }
        Rectangle {
            id: pauseButton
            border.width: 1
            border.color: "white"
            Icon {
                name: "media-playback-start"
                color: "white"
                width: 36
                height: 36
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
            color: Colors.yellow
            Layouts.item: "play"
            anchors {
                left: parent.left
                top: timer.bottom
                bottom: parent.bottom
                right: timer.right
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Haptics.play()
                    console.log("Start / stop clicked");
                }
            }
        }
        Rectangle {
            id: musicButton
            border.width: 1
            border.color: "white"
            Icon {
                name: "close"
                width: 36
                height: 36
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
            color: Colors.yellow
            Layouts.item: "music"
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
                right: parent.right
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Haptics.play()
                    console.log("Music clicked");
                }
            }
        }
    }
}
