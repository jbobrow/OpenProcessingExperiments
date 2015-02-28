
http://www.openprocessing.org/user/21764//配列の数を指定
int num = 8;

//x座標のためのint型の配列x
int[] x = new int[num];

void setup() {
    size(400,400);
    noStroke();
    //箱のx座標を計算
    for (int i = 0; i < num; i++) {
    x[i] = int(width/num*i);
    }
}

void draw() {
    background(255);
    for (int i = 0; i < num; i++) {
    fill(0);
    ellipse(x[i],200,15,15);
    }
}
