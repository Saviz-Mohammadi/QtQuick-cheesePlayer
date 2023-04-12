import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {

    id: window;

    width: 900;
    height: 600;

    // Screen center
    x: (Screen.width - width) / 2;
    y: (Screen.height - height) / 2;

    visible: true;
    title: qsTr("Cheese Player");

    // Creating the "Theme" object
    Theme {

       id: theme
    }

    Popup {

         id: popup
         x: 100
         y: 100
         width: 200
         height: 300
         modal: true
         focus: true
         closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
     }

    // MenuBar
    menuBar: AppMenuBar {

    }

    footer: RowLayout {

        height: 35

        Rectangle {

            Layout.fillWidth: true
            Layout.fillHeight: true
            color: theme.background_3

            Label {

                text: "Status bar message"

                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter

                leftPadding: 10
            }
        }
    }

    SplitView {

        anchors.fill: parent
        orientation: Qt.Horizontal

        AppSideBar {

            id: sidebar

            onTabButton_Clicked_PageAbout: {

                stackView.replace(page_About)
            }

            onTabButton_Clicked_PageMediaPlayer: {

                stackView.replace(page_MediaPlayer)
            }
        }

        // It turns out that the stackview actually manages to change the size of it's contents to take the full size.
        // For this reason you don't have to set anchors.fill for elements
        StackView {

            id: stackView

            width: window.width - sidebar.width
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            initialItem: page_MediaPlayer

            PageAbout {

                id: page_About

                //anchors.fill: parent
            }

            PageMediaPlayer {

                id: page_MediaPlayer

                //anchors.fill: parent
            }

        }
    }
}
