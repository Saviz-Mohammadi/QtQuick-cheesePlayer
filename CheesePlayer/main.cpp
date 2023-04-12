#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>

// Custom classes
#include <other/network/network.h>


void function_ApplyApplicationSettings(

        QGuiApplication* application
        );

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    function_ApplyApplicationSettings(&app);

    QQuickStyle::setStyle("Basic");

    QQmlApplicationEngine engine;

    // Registering types
    qmlRegisterType<other::Network>("QObject_Network", 1, 0, "Network");

    const QUrl url(u"qrc:/CheesePlayer/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}


void function_ApplyApplicationSettings(

        QGuiApplication* application
        )
{
    application->setOrganizationName(

                "Saviz Mohammadi"
                );
    application->setOrganizationDomain(

                "https://github.com/Saviz-Mohammadi"
                );
    application->setApplicationName(

                "Multimedia Application"
                );
    application->setApplicationVersion(

                "0.0.1 Beta"
                );
}
