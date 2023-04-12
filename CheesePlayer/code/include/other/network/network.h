#ifndef OTHER_NETWORK_H
#define OTHER_NETWORK_H

#include <QObject>
#include <QUrl>
#include <QDesktopServices>

namespace other
{

class Network : public QObject
{
    Q_OBJECT

public:
    explicit Network(

            QObject *parent = nullptr
            );

public:
    ~Network(

            );

public slots:
    void slot_OpenURL(

            const QString& url
            );

};

} // namespace end

#endif
