import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import Ubuntu.Layouts 0.1

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'interval-trainer.lkristensen'
    automaticOrientation: true

    width: units.gu(75)
    height: units.gu(45)

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
            color: "yellow"
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
                right: parent.right
            }
            border.width: 1
            border.color: "white"
            Text {
                text: "01:10"
                color: "white"
                font.pointSize: 24
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        Rectangle {
            id: currentExercise
            Layouts.item: "current"
            color: "yellow"
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
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        Rectangle {
            id: nextExercise
            color: "blue"
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
                text: "Snatch"
                color: "white"
                font.pointSize: 24
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
        Button {
            id: pauseButton
            text: "P"
            color: "yellow"
            Layouts.item: "play"
            anchors {
                left: parent.left
                top: timer.bottom
                bottom: parent.bottom
                right: timer.right
            }
        }
        Button {
            id: musicButton
            text: "M"
            color: "yellow"
            Layouts.item: "music"
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
                right: parent.right
            }
        }
    }
}
