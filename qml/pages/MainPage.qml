import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    property string noteText: ""
    property var noteModel: ListModel {
        ListElement {note: "String 1"}
        ListElement {note: "String 2"}
        ListElement {note: "String 3"}
    }

    function addNote() {
        if (noteText !== "") {
            noteModel.append({"note": noteText})
            noteText = ""
        }
    }

    function deleteNote(index) {
        noteModel.remove(index)
    }

    SilicaFlickable {
        anchors.fill: parent

        Column {
            spacing:  Theme.paddingLarge

            TextField {
                id: noteTextField
                placeholderText: "Введите заметку"
                onTextChanged: noteText = text
            }
            Button {
                id: addButton
                text: "Добавить заметку"
                onClicked: addNote()
            }

            ListView {
                id: noteListView
                width: parent.width
                height: parent.height / 2
                model: noteModel
                delegate: Item {
                    width: parent.width
                    height: Theme.itemSizeMedium
                    Row {
                        spacing: Theme.paddingSmall
                        Label {
                            text: model.note
                            width: parent.width/2
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Button {
                            id: deleteButton
                            text: "Удалить"
                            onClicked: deleteNote(index)
                        }
                    }
                }
            }
        }

        function createDB() {
            var db = LocalStorage.openDatabaseSync("notesDB", "1.0", "DB", 10000000)
            db.transaction(function(tx) {
                tx.executeSql('CREATE TABLE IF NOT EXISTS notes(note TEXT)')
                console.log("Table create")
            })
        }
    }
    Component.onCompleted: createDB()
}
