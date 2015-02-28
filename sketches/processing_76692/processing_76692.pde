
int num = 10;
 
//x座標のためのint型の配列x
int[] x = new int[num];
int[] w = new int[num];
 
void setup() {
    size(400,400);
    noStroke();
    //箱のx座標を計算
    for (int i = 0; i < num; i++) {
    x[i] = int(width/num*i);
    w[i] = 5+i*10;
    }
}
 
void draw() {
    background(255);
    for (int i = 0; i < num; i++) {
    fill(0);
    ellipse(x[i],200,w[i],w[i]);
    }
}
