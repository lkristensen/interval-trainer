import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import "Lists" 0.1


    Page {
        id: programList

        ListModel {
            id: testModel
            ListElement { 
                title: "Program 1"
                program: [
                    ListElement {
                        action: "Warmup"
                        color: "yellow"
                        time: 10
                    },
                    ListElement {
                        action: "Swing"
                        color: "yellow"
                        time: 5
                    },
                    ListElement {
                        action: "Breath"
                        color: "yellow"
                        time: 5
                    },
                    ListElement {
                        action: "Swing"
                        color: "yellow"
                        time: 5
                    },
                    ListElement {
                        action: "Breath"
                        color: "yellow"
                        time: 5
                    },
                    ListElement {
                        action: "Swing"
                        color: "yellow"
                        time: 5
                    },
                    ListElement {
                        action: "Breath"
                        color: "yellow"
                        time: 5
                    },
                    ListElement {
                        action: "Swing"
                        color: "yellow"
                        time: 5
                    },
                    ListElement {
                        action: "Breath"
                        color: "yellow"
                        time: 5
                    },
                    ListElement {
                        action: "Swing"
                        color: "yellow"
                        time: 5
                    },
                    ListElement {
                        action: "Cool down"
                        color: "yellow"
                        time: 10
                    }
                ]
            }
            ListElement { title: "Program 2" }
        }

        ListView {
            id: programListView

            anchors.fill: parent

            model: testModel
            delegate: ListItemWithActions {
                height: units.gu(9)
                width: parent.width
                color: "white"

                leftSideAction: Action {
                    iconName: "delete"
                    text: i18n.tr("Delete")
                    onTriggered: {
                        testModel.remove(programListView.index)
                    }
                }
                contents: Label {
                    text: title
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }

