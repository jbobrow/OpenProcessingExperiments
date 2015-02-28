
Particle particles = new Particle[20];

// setup は window.onload のようなもの
void setup() {
    size(400, 400);
    for (int i = 0; i < particles.length; i ++)
        particles[i] = new Particle();
}

// draw はタイムラインが更新されるために呼ばれる
void draw() {
    for (int i = 0; i < particles.length; i ++)
        particles[i].update();
}

// 線を管理するクラスを作る
class Particle {
    // フィールドの定義
    float x, y, xvel, yvel, r, g, b, a;

    // コンストラクタで、フィールドの初期化
    Particle () {
        x = random(width);
        y = random(height);
        r = random(255);
        g = random(255);
        b = random(255);
        a = 0;
        xvel = random(1) * 10 - 5;
        yvel = random(1) * 10 - 5;
    }

    // draw から呼び出す
    // フィールドを更新して描画する
    void update() {
        if (a > 2 * 3.14) return;
        float px = x, py = y;
        x += xvel, y += yvel;
        yvel += 0.1;
        if (x < 0 || width < x) xvel *= -1;
        if (y < 0 || height < y) yvel *= -1;
        stroke(r, g, b, sin(a += 0.01) * 255);
        line(px, py, x, y);
    }
}
