cmake_minimum_required(VERSION 3.16)

project(CheesePlayer VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick QuickControls2 Svg Multimedia REQUIRED)

set(
    INCLUDE_DIR

    # Path to includes
    "${CMAKE_SOURCE_DIR}/code/include/"
)

set(
    SOURCE_DIR

    # Path to sources
    "${CMAKE_SOURCE_DIR}/code/src/"
)

include_directories(

    ${INCLUDE_DIR}
)

include_directories(

    ${SOURCE_DIR}
)

file(
    GLOB_RECURSE

    FILES

    # Searching for all files
    "${INCLUDE_DIR}/*.h"
    "${SOURCE_DIR}/*.cpp"
)

qt_add_executable(appCheesePlayer
    main.cpp

    ${FILES}
)

qt_add_qml_module(appCheesePlayer
    URI CheesePlayer
    VERSION 1.0
    QML_FILES

    main.qml
    Theme.qml

    AppMenuBar.qml
    AppSideBar.qml
    AppFunctions.qml

    PageAbout.qml
    PageMediaPlayer.qml

    resources.qrc
)

set_target_properties(appCheesePlayer PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appCheesePlayer
    PRIVATE Qt6::Quick Qt6::QuickControls2 Qt6::Svg Qt6::Multimedia)

install(TARGETS appCheesePlayer
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
