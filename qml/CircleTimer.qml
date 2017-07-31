import QtQuick 2.4

Item {
    id: container

    property var percent: 0.75
    property var text: "01:23"
    property color color: "red"

    Text {
        text: container.text
        color: container.color
        font.pointSize: 24
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Canvas {
        width: container.width
        height: container.height
        onPaint: {
            var ctx = getContext("2d");
            var diameter = width < height ? width : height;
            var centerX = width / 2;
            var centerY = height / 2;
            var lWidth = diameter * 0.1;
            ctx.strokeStyle = container.color;

            ctx.beginPath();
            ctx.lineWidth = 1;
            ctx.arc(centerX, centerY, diameter / 2 * 0.9 - lWidth /2, 0, 2 * Math.PI, false);
            ctx.stroke();

            ctx.beginPath();
            ctx.lineWidth = lWidth;
            ctx.arc(centerX, centerY, diameter / 2 - lWidth / 2, - Math.PI * 0.5, 2 * Math.PI * container.percent - Math.PI * 0.5, false);
            ctx.stroke();
        }
    }
}
