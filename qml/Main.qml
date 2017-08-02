import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import "Lists" 0.1

MainView {
    id: mainView
    applicationName: 'interval-trainer.lkristensen'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)
            function launchEdit(id) {
                console.log(testModel.get(id).title);
            }

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


            EmptyState {
                id: showEmpty
                iconName: "alarm-clock"
                title: i18n.tr("No Training Programs")
                subTitle: i18n.tr("Swipe from bottom to create a new program")
                anchors.centerIn: parent
                visible: false
            }

            states: [
                State {
                    name: "EMPTY"
                    when: (testModel.count == 0)  
                    PropertyChanges { 
                        target: showEmpty
                        visible: true
                    }
                }
            ]

            ListView {
                id: programListView

                anchors {
                    fill: parent
                    topMargin: header.height
                    bottomMargin: programList.bottomEdgeHeight
                }

                model: testModel
                delegate: ListItemWithActions {
                    property int delegateIndex: index
                    height: units.gu(9)
                    width: parent.width
                    color: "white"
    
                    leftSideAction: Action {
                        iconName: "delete"
                        text: i18n.tr("Delete")
                        onTriggered: {
                            testModel.remove(delegateIndex)
                        }
                    }
                    rightSideActions: Action {
                        iconName: "edit"
                        text: i18n.tr("Edit")
                        onTriggered: {
                            launchEdit(delegateIndex)
                        }
                    }
                    contents: Label {
                        text: title
                        color: "black"
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    onItemClicked: {
                        pageStack.push(Qt.resolvedUrl("Timer.qml"))
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
                        topMargin: header.height + units.gu(1)
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

