// Config created by Skignes https://github.com/skignes/Dotfiles
// Copyright (C) 2022-2025 Skignes
// Distributed under the GPLv3+ License https://www.gnu.org/licenses/gpl-3.0.html

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.folderlistmodel 2.1

Rectangle {
    id: root
    width: 1280
    height: 720
    color: "black"

    // All property
    property int fontSize: 18
    property bool showSession: false
    property bool showPassword: false

    // Add F1 help text
    Text {
        id: helpText
        text: "Press F1 to change session"
        color: "white"
        font.pixelSize: fontSize - 4
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        opacity: 0.7
    }

    // Add key handler for F1
    Item {
        focus: true
        anchors.fill: parent
        Keys.onPressed: {
            if (event.key === Qt.Key_F1) {
                showSession = !showSession
                event.accepted = true
            }
        }
    }

    // Username prompt
    Text {
        id: usernamePrompt
        text: "login: "
        color: "white"
        font.pixelSize: fontSize
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 50
        anchors.topMargin: 50
    }

    // Username input
    TextField {
        id: usernameField
        placeholderText: ""
        width: 300
        font.pixelSize: fontSize
        color: "white"
        anchors.left: usernamePrompt.right
        anchors.verticalCenter: usernamePrompt.verticalCenter
        background: Rectangle {
            color: "black"
        }
        onTextChanged: {
            sddm.setLastUser(usernameField.text)
        }
        Component.onCompleted: {
            usernameField.text = sddm.lastUser
        }
        // Add Enter key handling
        Keys.onReturnPressed: {
            showPassword = true
            passwordField.focus = true
        }
        Keys.onEnterPressed: {
            showPassword = true
            passwordField.focus = true
        }
    }

    // Password prompt
    Text {
        id: passwordLabel
        text: "Password: "
        color: "white"
        font.pixelSize: fontSize
        anchors.left: parent.left
        anchors.top: usernamePrompt.bottom
        anchors.leftMargin: 50
        anchors.topMargin: 20
        visible: showPassword
    }

    // Password Input
    TextField {
        id: passwordField
        placeholderText: ""
        width: 300
        font.pixelSize: fontSize
        color: "white"
        background: Rectangle {
            color: "black"
        }
        echoMode: TextInput.Password
        anchors.left: passwordLabel.right
        anchors.verticalCenter: passwordLabel.verticalCenter
        visible: showPassword
        // Add Enter key handling
        Keys.onReturnPressed: {
            sddm.login(usernameField.text, passwordField.text, sessionComboBox.currentIndex)
        }
        Keys.onEnterPressed: {
            sddm.login(usernameField.text, passwordField.text, sessionComboBox.currentIndex)
        }
    }

    // Session label
    Text {
        id: sessionLabel
        text: "Session: "
        color: "white"
        font.pixelSize: fontSize
        anchors.left: parent.left
        anchors.top: passwordField.bottom
        anchors.leftMargin: 50
        anchors.topMargin: 20
        visible: showSession
    }

    // Session ComboBox
    ComboBox {
        id: sessionComboBox
        width: 300
        font.pixelSize: fontSize
        anchors.left: sessionLabel.right
        anchors.verticalCenter: sessionLabel.verticalCenter
        visible: showSession

        model: sessionModel
        textRole: "name"
        
        Component.onCompleted: {
            // Try to use last session first
            var lastSession = sessionModel.lastIndex
            if (lastSession > -1 && lastSession < sessionModel.count) {
                currentIndex = lastSession
                return
            }

            // Fallback to i3 if no last session
            var foundI3 = false
            for (var i = 0; i < sessionModel.count; i++) {
                var session = sessionModel.data(sessionModel.index(i, 0), "fileName")
                if (session.toLowerCase().includes("i3")) {
                    currentIndex = i
                    foundI3 = true
                    break
                }
            }
            
            // If i3 wasn't found, try looking for i3-wm or similar
            if (!foundI3) {
                for (var j = 0; j < sessionModel.count; j++) {
                    var altSession = sessionModel.data(sessionModel.index(j, 0), "fileName")
                    if (altSession.toLowerCase().includes("i3-wm")) {
                        currentIndex = j
                        break
                    }
                }
            }
        }

        // Save the selected session when changed
        onCurrentIndexChanged: {
            sessionModel.lastIndex = currentIndex
        }
    }
}
