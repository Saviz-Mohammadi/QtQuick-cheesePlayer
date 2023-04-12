import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts

Pane {

    // This javaScript function is used to determine the color of the main background of a TabButton.
    function determineBackgroundColor(checked, hovered) {

        if (checked) {

            return theme.button_Background_C;
        }

        else if (hovered) {

            return theme.button_Background_H;
        }

        else {

            return theme.button_Background_N;
        }
    }

    // This javaScript function is used to determine the color of the bar(The bar at the left side) of a TabButton.
    function determineBarColor(checked, hovered) {

        if (checked) {

            return theme.button_Background_B;
        }

        else if (hovered) {

            return theme.button_Background_H;
        }

        else {

            return theme.button_Background_N;
        }
    }

    readonly property real customeLeftPadding: 30

    signal tabButton_Clicked_PageAbout()
    signal tabButton_Clicked_PageMediaPlayer()

    id: pane_SideBar
    width: pane_SideBar.contentWidth

    anchors.left: parent.left
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    verticalPadding: 0
    horizontalPadding: 0

    anchors.leftMargin: 0
    anchors.bottomMargin: 0
    anchors.topMargin: 0

    topPadding: 0
    bottomPadding: 0

    ColumnLayout {

        id: columnLayout_container
        anchors.fill: parent
        spacing: 0

        TabButton {

            id: tabButton_MediaPlayer
            text: qsTr("Media Player")

            Layout.minimumHeight: 40

            Layout.fillHeight: false
            Layout.fillWidth: true

            icon.source: ":/icons/feather-light/svg/activity.svg"

            onClicked: {

                tabButton_Clicked_PageMediaPlayer()
            }

            background : RowLayout {

                anchors.fill: parent

                spacing: 0

                // The bar at the left side
                Rectangle {

                    color: determineBarColor(

                               tabButton_MediaPlayer.checked,
                               tabButton_MediaPlayer.hovered
                               )

                    Layout.fillWidth: false
                    Layout.fillHeight: true

                    width: 5
                }

                // The actual background
                Rectangle {

                    color: determineBackgroundColor(

                               tabButton_MediaPlayer.checked,
                               tabButton_MediaPlayer.hovered
                               )

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }

            contentItem: Text {

                text: tabButton_MediaPlayer.text

                font {

                    family: tabButton_MediaPlayer.font.family
                    pointSize: tabButton_MediaPlayer.font.pointSize * 1.1
                }


                color: theme.button_foreground_1

                leftPadding: customeLeftPadding
                horizontalAlignment: Text.AlignHLeft
                verticalAlignment: Text.AlignVCenter

                elide: Text.ElideRight

                smooth: true
            }
        }

        TabButton {

            id: tabButton_SnippingTool
            text: qsTr("Snipping tool")
            Layout.minimumHeight: 40

            Layout.fillHeight: false
            Layout.fillWidth: true

            background : RowLayout {

                anchors.fill: parent

                spacing: 0

                // The bar at the left side
                Rectangle {

                    color: determineBarColor(

                               tabButton_SnippingTool.checked,
                               tabButton_SnippingTool.hovered
                               )

                    Layout.fillWidth: false
                    Layout.fillHeight: true

                    width: 5
                }

                // The actual background
                Rectangle {

                    color: determineBackgroundColor(

                               tabButton_SnippingTool.checked,
                               tabButton_SnippingTool.hovered
                               )

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }

            contentItem: Text {

                text: tabButton_SnippingTool.text

                font {

                    family: tabButton_SnippingTool.font.family
                    pointSize: tabButton_SnippingTool.font.pointSize * 1.1
                }

                color: theme.button_foreground_1

                leftPadding: customeLeftPadding
                horizontalAlignment: Text.AlignHLeft
                verticalAlignment: Text.AlignVCenter

                elide: Text.ElideRight

                smooth: true
            }
        }

        TabButton {

            id: tabButton_MediaCapture
            text: qsTr("Media Capture")

            Layout.minimumHeight: 40

            Layout.fillHeight: false
            Layout.fillWidth: true

            background : RowLayout {

                anchors.fill: parent

                spacing: 0

                // The bar at the left side
                Rectangle {

                    color: determineBarColor(

                               tabButton_MediaCapture.checked,
                               tabButton_MediaCapture.hovered
                               )

                    Layout.fillWidth: false
                    Layout.fillHeight: true

                    width: 5
                }

                // The actual background
                Rectangle {

                    color: determineBackgroundColor(

                               tabButton_MediaCapture.checked,
                               tabButton_MediaCapture.hovered
                               )

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }

            contentItem: Text {

                text: tabButton_MediaCapture.text

                font {

                    family: tabButton_MediaCapture.font.family
                    pointSize: tabButton_MediaCapture.font.pointSize * 1.1
                }


                color: theme.button_foreground_1

                leftPadding: customeLeftPadding
                horizontalAlignment: Text.AlignHLeft
                verticalAlignment: Text.AlignVCenter

                elide: Text.ElideRight

                smooth: true
            }
        }

        Rectangle {

            id: item_Spacer

            Layout.fillHeight: true
            Layout.fillWidth: true

            color: theme.background_2

            Layout.preferredWidth: 250
        }

        TabButton {

            id: tabButton_Settings
            text: qsTr("Settings")

            Layout.minimumHeight: 40

            Layout.fillHeight: false
            Layout.fillWidth: true

            background : RowLayout {

                anchors.fill: parent

                spacing: 0

                // The bar at the left side
                Rectangle {

                    color: determineBarColor(

                               tabButton_Settings.checked,
                               tabButton_Settings.hovered
                               )

                    Layout.fillWidth: false
                    Layout.fillHeight: true

                    width: 5
                }

                // The actual background
                Rectangle {

                    color: determineBackgroundColor(

                               tabButton_Settings.checked,
                               tabButton_Settings.hovered
                               )

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }

            contentItem: Text {

                text: tabButton_Settings.text

                font {

                    family: tabButton_Settings.font.family
                    pointSize: tabButton_Settings.font.pointSize * 1.1
                }


                color: theme.button_foreground_1

                leftPadding: customeLeftPadding
                horizontalAlignment: Text.AlignHLeft
                verticalAlignment: Text.AlignVCenter

                elide: Text.ElideRight

                smooth: true
            }
        }

        TabButton {

            id: tabButton_About
            text: qsTr("About")

            Layout.minimumHeight: 40

            Layout.fillHeight: false
            Layout.fillWidth: true

            onClicked: {

                tabButton_Clicked_PageAbout()
            }

            background : RowLayout {

                anchors.fill: parent

                spacing: 0

                // The bar at the left side
                Rectangle {

                    id: rectangle_bar

                    color: determineBarColor(

                               tabButton_About.checked,
                               tabButton_About.hovered
                               )

                    Layout.fillWidth: false
                    Layout.fillHeight: true

                    width: 5
                }

                // The actual background
                Rectangle {

                    color: determineBackgroundColor(

                               tabButton_About.checked,
                               tabButton_About.hovered
                               )

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }

            contentItem: Text {

                text: tabButton_About.text

                font {

                    family: tabButton_About.font.family
                    pointSize: tabButton_About.font.pointSize * 1.1
                }


                color: theme.button_foreground_1

                leftPadding: customeLeftPadding
                horizontalAlignment: Text.AlignHLeft
                verticalAlignment: Text.AlignVCenter

                elide: Text.ElideRight

                smooth: true
            }
        }
    }
}
