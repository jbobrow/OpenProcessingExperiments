
void setup() {
    size(500, 500);
        frameRate(5);//10で一秒間、数が多いほど早い
}
 
void draw() {//一秒間の元
    background(204);//背景色を設定することで画面をクリアする,204は灰色のこと、灰色をかぶせている
　 x=random(0,500);
    y=random(0,500);
    ellipse(x,y,20,20);
}

