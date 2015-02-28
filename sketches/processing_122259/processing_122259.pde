
void setup() {
    frameRate(20);
    size(500, 500);
    predatorP = {30, 30};
    predatorPP = {50, 50};
    preyP = {350, 350};
    rectMode(CENTER);
}

void draw() {
    background(204); //背景色を設定することで画面をクリアする
    preyP     = {random(0,500),random(0,500)};

　 if (predatorP[0] > preyP[0])
        predatorP[0]--;
    else if(predatorP[0] < preyP[0])
        predatorP[0]+=3;
        predatorPP[0]+=3;

    if (predatorP[1] > preyP[1])
        predatorP[1]--;
    else if(predatorP[1] < preyP[1])
        predatorP[1]+=3;
        predatorPP[1]+=3;
 　predator = rect(predatorP[0], predatorP[1], 20, 20);
   predator = rect(predatorPP[0], predatorPP[1], 20, 20);
    prey = ellipse(preyP[0],preyP[1],20,20);
}
