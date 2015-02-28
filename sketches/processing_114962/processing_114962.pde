
void setup() {
    frameRate(20);//捕食者の速度
    size(500, 500);
    predatorP = {30, 30};捕食者のx軸y軸
    preyP = {150, 350};餌のx軸y軸
    rectMode(CENTER);捕食者は四角
}

void draw() {
    background(204); //背景色を設定することで画面をクリアする
　 if (predatorP[0] > preyP[0])
        predatorP[0]--;//捕食者が獲物のx座標よりも小さい
    else if(predatorP[0] < preyP[0])
        predatorP[0]++;//捕食者の座標を１つ移動

    if (predatorP[1] > preyP[1])
        predatorP[1]--;//捕食者が獲物のy座標よりも小さい
    else if(predatorP[1] < preyP[1])
        predatorP[1]++;//捕食者の座標を１つ移動
 　predator = rect(predatorP[0], predatorP[1], 20, 20);
    prey = ellipse(preyP[0],preyP[1],20,20);
}
