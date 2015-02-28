
void setup() {
    frameRate(20);
    size(500, 500);
    predatorP = {30, 30};
    preyP = {150, 350};
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
 //逃避
　 if (preyP[0] > predatorP[0])
        preyP[0]++;
    else if(preyP[0] < predatorP[0])
        preyP[0]--;

    if (preyP[1] > predatorP[1])
        preyP[1]++;
    else if(preyP[1] < predatorP[1])
        preyP[1]--;

 　predator = rect(predatorP[0], predatorP[1], 20, 20);
    prey = ellipse(preyP[0],preyP[1],20,20);
}
