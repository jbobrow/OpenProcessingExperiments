
void setup() {
    frameRate(20);
    size(500, 500);
    predatorP = {random(0,350),random(0,350)};//350が画面内の座標だわ
    preyP = {random(0,350), random(0,350)};
    rectMode(CENTER);
}

void draw() {
    background(204); //背景色を設定することで画面をクリアする
　 if (predatorP[0] > preyP[0])
        predatorP[0]--;
    else if(predatorP[0] < preyP[0])
        predatorP[0]++;

    if (predatorP[1] > preyP[1])
        predatorP[1]--;
    else if(predatorP[1] < preyP[1])
        predatorP[1]++;
 　predator = rect(predatorP[0], predatorP[1], random(20), random(20));//これサイズだわ
    prey = ellipse(preyP[0],preyP[1],20,20);
}

