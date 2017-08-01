import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import "Lists" 0.1

MainView {
    applicationName: 'interval-trainer.lkristensen'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    PageStack {
        id: pageStack

        PageWithBottomEdge {
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

            header: PageHeader {
                id: header
                title: i18n.tr("Programs")
            }

            ListView {
                id: programListView
    
                anchors {
                    fill: parent
                    topMargin: header.height
                    bottomMargin: programList.bottomEdgeHeight
                }

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
                        color: "black"
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
            bottomEdgeTitle: i18n.tr("New Program")
            bottomEdgePageComponent: Page {
                header: PageHeader {
                    id: header
                    title: i18n.tr("New Program")
                    leadingActionBar.actions: Action {
                        id: backAction

                         name: "cancel"
                         text: i18n.tr("Cancel")
                         iconName: "down"
                         onTriggered: { 
                             programList.close()
                         }
                     }
                     trailingActionBar.actions: Action {
                         iconName: "ok"
                         objectName: "save"
                         text: i18n.tr("Save")
                         onTriggered: { 
                             testModel.append({
                                 title: programTitle.text
                             })
                             programList.close()
                         }
                     }
                }
                anchors.fill: parent
            Column {
                width: parent.width
                spacing: units.gu(1)
                anchors {
                    fill: parent
                    topMargin: header.height
                    bottomMargin: parent.bottomEdgeHeight
                }

                TextField {
                    id: programTitle
                    objectName: "newProgramTitle"

                    anchors {
                        left: parent.left
                        right: parent.right
                        margins: units.gu(2)
                    }

                    placeholderText: i18n.tr("Title")
                    onFocusChanged: {
                        if(programTitle.focus) {
                            flickable.makeMeVisible(programTitle);
                        }
                    }
                }

                TextArea{
                    id: programDescription
                    objectName: "newProgramDescription"

                    anchors {
                        left: parent.left
                        right: parent.right
                        margins: units.gu(2)
                    }

                    placeholderText: i18n.tr("Description")
                    onFocusChanged: {
                        if(programDescription.focus) {
                            flickable.makeMeVisible(programDescription);
                        }
                    }
                }
            }
            }
        }
    }
}

