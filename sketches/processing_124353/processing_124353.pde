
void setup() {
    size(500, 500);
    x = 50
    y = 250
}
 
void draw() {
    background(225);//setbackfround grey要するに一回一回グレーで消す
 //   ellipse((x++/*xが１つづつ呼ばれる*/)%width/*xを幅で割る５００になったら０に戻る５００＝０*/, y,20,20);
    ellipse(x,(y++)%height,20,20);
}

