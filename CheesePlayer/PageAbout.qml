import QtQuick 2.9
import QtQuick.Controls
import QtQuick.Layouts
import QObject_Network

Page {

    function determineButtonBackgroundColor(pressed, hovered) {

        if (pressed) {

            return theme.button_Background_C;
        }

        else if (hovered) {

            return theme.button_Background_H;
        }

        else {

            return theme.button_Background_N;
        }
    }

    Network {

        id: object_Network
    }

//    anchors.fill : parent

    topPadding: 30
    leftPadding: 50

    background: Rectangle {

        color: theme.background_1
    }

    // Using a "Flickable" to make the page content scrollable.(Both horizontal and vertical)
    Flickable {

        width: parent.width
        height: parent.height

        contentHeight: columnLayout_Content.implicitHeight
        contentWidth: columnLayout_Content.implicitWidth

        ScrollBar.vertical: ScrollBar {}
        ScrollBar.horizontal: ScrollBar {}

        clip: true

        ColumnLayout {

            id: columnLayout_Content

            anchors.fill: parent

            spacing: 30

            Label {

                Layout.maximumWidth: 600

                font.pointSize: Qt.application.font.pointSize * 2.2

                text: "About page"

                color: "#414749"

                smooth: true
            }

            Text {

                text: "SPlayer is a free and open-source media player software and recording utility developed by Saviz for playing video and audio as well as recording both. This project is availabel on the official GitHub repository of SPlayer. This project is licensed under \"License\" and free to be used on non-commercial products."

                // The "Qt.application.font.pointSize" obtains the font size set by your operating system (usually found under accessibility settings section)
                font.pointSize: Qt.application.font.pointSize * 1.04

                color: "#414749"
                wrapMode: Text.Wrap

                Layout.maximumWidth: 600

                horizontalAlignment: Text.AlignJustify
                lineHeight: 1.2

                smooth: true
            }

            GroupBox
            {
                label: Label {

                    text: "Application information"

                    font.pointSize: Qt.application.font.pointSize * 1.75

                    color: "#414749"
                    smooth: true

                    bottomPadding: 5
                }

                font.pointSize: Qt.application.font.pointSize * 1.04

                Layout.maximumWidth: 600
                Layout.minimumWidth: 600

                ColumnLayout
                {
                    anchors.fill : parent

                    spacing: 10

                    RowLayout
                    {
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        Layout.topMargin: 10

                        Label
                        {
                            width: 150

                            text: "Application name:"
                            Layout.alignment: Qt.AlignLeft

                            color: "#414749"
                            smooth: true
                        }

                        Item
                        {
                            Layout.fillWidth: true
                        }

                        Label
                        {
                            width: 150

                            text: `${Qt.application.name}`
                            Layout.alignment: Qt.AlignRight

                            color: "#414749"
                            smooth: true
                        }
                    }

                    RowLayout
                    {
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10

                        Label
                        {
                            width: 150

                            text: "Application version:"
                            Layout.alignment: Qt.AlignLeft

                            color: "#414749"
                            smooth: true
                        }

                        Item
                        {
                            Layout.fillWidth: true
                        }

                        Label
                        {
                            width: 150

                            text: `${Qt.application.version}`
                            Layout.alignment: Qt.AlignRight

                            color: "#414749"
                            smooth: true
                        }
                    }

                    RowLayout
                    {
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10

                        Label
                        {
                            width: 150

                            text: "Application company:"
                            Layout.alignment: Qt.AlignLeft

                            color: "#414749"
                            smooth: true
                        }

                        Item
                        {
                            Layout.fillWidth: true
                        }

                        Label
                        {
                            width: 150

                            text: `${Qt.application.organization}`
                            Layout.alignment: Qt.AlignRight

                            color: "#414749"
                            smooth: true
                        }
                    }

                    RowLayout
                    {
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10

                        Label
                        {
                            width: 150

                            text: "Application URL:"
                            Layout.alignment: Qt.AlignLeft

                            color: "#414749"
                            smooth: true
                        }

                        Item
                        {
                            Layout.fillWidth: true
                        }

                        Label
                        {
                            width: 150

                            text: `${Qt.application.domain}`
                            Layout.alignment: Qt.AlignRight

                            color: "#414749"
                            smooth: true
                        }
                    }

                    RowLayout
                    {
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        Layout.bottomMargin: 10
                        Label
                        {
                            width: 150

                            text: "Operating system:"
                            Layout.alignment: Qt.AlignLeft

                            color: "#414749"
                            smooth: true
                        }

                        Item
                        {
                            Layout.fillWidth: true
                        }

                        Label
                        {
                            width: 150

                            text: `${Qt.platform.os}`
                            Layout.alignment: Qt.AlignRight

                            color: "#414749"
                            smooth: true
                        }
                    }
                }
            }

            Text
            {
                text: "Join the GitHub project and help us improve this product"

                font.pointSize: Qt.application.font.pointSize * 1.04

                color: "#414749"
                smooth: true
            }

            Button
            {
                id: button_OpenPage

                text: "Open GitHub"

                // signal
                onClicked: {

                    object_Network.slot_OpenURL("www.google.com")
                }

                padding: 12

                background: Rectangle {

                    color: determineButtonBackgroundColor(

                               parent.pressed,
                               parent.hovered
                               )
                    radius: 2
                }

                contentItem: Text {

                    text: parent.text

                    font {

                        family: parent.font.family
                        pointSize: parent.font.pointSize * 1.03
                    }


                    color: theme.button_foreground_1

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    smooth: true
                }
            }

            Text
            {
                text: "GNU GENERAL PUBLIC LICENSE\nVersion 3, 29 June 2007\n\nCopyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>\nEveryone is permitted to copy and distribute verbatim copies of this license document, but changing it is not allowed.

The GNU General Public License (GPL) is a widely-used open source software license that was first published by the Free Software Foundation (FSF) in 1989. The GPL is a copyleft license, which means that it requires any modified or derived versions of the software to be released under the same license terms as the original software.


The main goal of the GPL is to ensure that users of the software have the freedom to use, modify, and distribute the software as they wish, while also ensuring that these same freedoms are preserved for future users. The GPL includes several important provisions, including:


The requirement that the source code for the software be made available to users.
The requirement that any modified versions of the software be released under the same GPL license.
The requirement that any software that is linked to the GPL-licensed software (in a way that creates a derivative work) must also be released under the GPL.
In addition to the GPL, there are several other licenses published by the FSF that are designed to promote the same principles of free software. These include the Lesser General Public License (LGPL) and the Affero General Public License (AGPL).


The GPL has been widely adopted by the open source community and is used by many well-known software projects, including the Linux kernel and the GNU Compiler Collection."

                font.pointSize: Qt.application.font.pointSize * 1.04

                color: "#414749"

                wrapMode: Text.Wrap

                Layout.maximumWidth: 600

                horizontalAlignment: Text.AlignJustify
                lineHeight: 1.2

                smooth: true
            }
        }
    }
}
