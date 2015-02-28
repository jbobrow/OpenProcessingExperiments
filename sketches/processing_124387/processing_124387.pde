
void setup() {
    size(500, 500);
    rx = 450;//rx,ry=□の初期位置
    ry = 70;
    ex = 100;//ex,eyは丸の初期位置
    ey = 400;
    h = ey - ry;
        d = ex - rx;
    dh = h/10;
    dd = d/10;
    rectMode(CENTER);
    frameRate(2);
}
//四角が円まで２０回動かす、移動履歴消す
void draw() {
        rect(rx, ry, 20, 20);
        ellipse(ex, ey,20,20);
    rx = rx + dd;
        ry = ry + dh;
}

