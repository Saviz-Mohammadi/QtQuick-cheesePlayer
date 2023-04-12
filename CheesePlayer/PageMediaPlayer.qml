import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import QtMultimedia

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

    FileDialog {

        id: fileDialog;

        onAccepted: {

            mediaplayer_video.source = selectedFile
            mediaplayer_video.play()
            button_PlayAndPause.buttonText = "Pause"
        }
    }

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

        clip: true

        // Creating Scrollbars
        ScrollBar.vertical: ScrollBar {


        }

        ScrollBar.horizontal: ScrollBar {


        }

        ColumnLayout {

            id: columnLayout_Content

            anchors.fill: parent

            spacing: 30

            Label {

                Layout.maximumWidth: 600

                font.pointSize: Qt.application.font.pointSize * 2.2

                text: "Media Player page"

                color: "#414749"

                smooth: true
            }

            Text {

                text: "To open a video or audio file in the media player press the button below. A file dialog will open and allow you to choose the media you desire. You can also set filters to search for specific files."

                // The "Qt.application.font.pointSize" obtains the font size set by your operating system (usually found under accessibility settings section)
                font.pointSize: Qt.application.font.pointSize * 1.04

                color: "#414749"
                wrapMode: Text.Wrap

                Layout.maximumWidth: 600

                horizontalAlignment: Text.AlignJustify
                lineHeight: 1.2

                smooth: true
            }

            Button {

                id: button_OpenPage

                text: "Open File"

                // signal
                onClicked: {

                    fileDialog.title = "Choose File";

                    fileDialog.nameFilters =
                            [
                                "Video Files (*.mp4 *.mkv)",
                                "Audio Files (*.mp3)"
                            ]

                    fileDialog.open();
                }

                padding: 12
                leftPadding: 25
                rightPadding: 25

                background: Rectangle {

                    color: determineButtonBackgroundColor(

                               parent.pressed,
                               parent.hovered
                               )
                    radius: 2
                }

                contentItem: Text {

                    id: text_Content

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

            // The media player
            Rectangle {

                id: rectangle_Background

                Layout.minimumWidth: 1500
                Layout.maximumWidth: 1500

                Layout.minimumHeight: 650

                color: "black"

                MediaPlayer {

                    id: mediaplayer_video

                    audioOutput: AudioOutput {

                    }

                    videoOutput: videoOutput

                    onDurationChanged: {

                        slider_video.to = mediaplayer_video.duration
                    }

                    onPositionChanged: {

                        slider_video.value = mediaplayer_video.position
                    }
                }

                VideoOutput {
                    id: videoOutput
                    anchors.fill: parent
                }

                MouseArea {

                    hoverEnabled: true
                    anchors.fill: parent

                    onClicked: {

                        // The playbackState represents the curent state of the media player and needs to be checked against other states and enums. (Or even directyl by numbers and values)
                        if(mediaplayer_video.source == "") {

                            return;
                        }

                        if(mediaplayer_video.playbackState === MediaPlayer.PlayingState) {

                            mediaplayer_video.pause()
                            button_PlayAndPause.buttonText = "Play"
                            return;
                        }

                        mediaplayer_video.play()
                        button_PlayAndPause.buttonText = "Pause"
                    }

                    onEntered: {

                        button_ToolBar.visible = true
                    }

                    onExited: {

                        button_ToolBar.visible = false
                    }

                    onDoubleClicked: {

                        // add logic to make the video full screen.
                    }
                }

                Rectangle {

                    id: button_ToolBar

                    visible : false

                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right

                    height: 120

                    color: theme.background_3

                    ColumnLayout {

                        anchors.fill: parent

                        anchors.topMargin: 15
                        anchors.bottomMargin: 15

                        anchors.leftMargin: 20
                        anchors.rightMargin: 20

                        spacing: 15

                        RowLayout {

                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            spacing: 7

                            Slider {

                                Layout.fillWidth: true
                                Layout.fillHeight: true

                                hoverEnabled: false

                                id: slider_video
                                from: 0
                                to: 100
                                value: 0

                                onMoved: {

                                    mediaplayer_video.position = value
                                }
                            }

                            Slider {

                                Layout.fillHeight: true

                                width: 200

                                hoverEnabled: false

                                id: slider_audio
                                from: 0
                                to: 100
                                value: 0
                            }
                        }

                        RowLayout {

                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            Layout.leftMargin: 7
                            Layout.rightMargin: 7

                            spacing: 7

                            Button {

                                id: button_Backward

                                Layout.minimumWidth: 100

                                property alias buttonText: content.text

                                hoverEnabled: false

                                onClicked: {

                                    mediaplayer_video.position -= 10000
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

                                    id: contentBackward

                                    text: "Backward"

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

                            Button {

                                id: button_PlayAndPause

                                Layout.minimumWidth: 100

                                property alias buttonText: content.text

                                hoverEnabled: false

                                onClicked: {

                                    if(mediaplayer_video.source == "") {

                                        return;
                                    }

                                    if(mediaplayer_video.playbackState === MediaPlayer.PlayingState) {

                                        mediaplayer_video.pause()
                                        content.text = "Play"
                                        return;
                                    }

                                    mediaplayer_video.play()
                                    content.text = "Pause"
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

                                    id: content

                                    text: "Play"

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

                            Button {

                                id: button_Forward

                                Layout.minimumWidth: 100

                                hoverEnabled: false

                                property alias buttonText: content.text

                                onClicked: {

                                    mediaplayer_video.position += 10000
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

                                    id: contentForward

                                    text: "Forward"

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

                            Item {

                                Layout.fillWidth: true
                                Layout.fillHeight: true
                            }

                            Button {

                                id: button_Loop

                                Layout.minimumWidth: 100

                                hoverEnabled: false

                                checkable: true

                                property alias buttonText: content.text

                                onCheckedChanged: {

                                    if(checked) {

                                        mediaplayer_video.loops = -1

                                        popup.open()

                                        return;
                                    }

                                    mediaplayer_video.loops = 1

                                    popup.open()
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

                                    id: contentLoop

                                    text: "Loop"

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

                            Button {

                                id: button_FullScreen

                                Layout.minimumWidth: 100

                                hoverEnabled: false

                                property alias buttonText: content.text

                                onClicked: {

                                    mediaplayer_video.position += 10000
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

                                    id: contentFullScreen

                                    text: "FullScreen"

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
                        }
                    }
                }
            }

            Item {

                Layout.fillHeight: true
            }
        }
    }
}
