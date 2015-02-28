
void setup() {
    frameRate(20);
    size(500, 500);
    predatorP = {random(0,500),random(0,500)};
    preyP = {random(0,500),random(0,500)};
    rectMode(CENTER);
}

void draw() {
    background(204); //背景色を設定することで画面をクリアする
　slant = (preyP[1]-predatorP[1])/ (preyP[0]-predatorP[0]);if (predatorP[1] > preyP[1])
            predatorP[1]-=abs(slant);
else if (predatorP[1] < preyP[1])
            predatorP[1]+=abs(slant);

 　predator = rect(predatorP[0], predatorP[1], 20, 20);
    prey = ellipse(preyP[0],preyP[1],20,20);
}
