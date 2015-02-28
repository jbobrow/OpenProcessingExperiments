
void setup() {
    frameRate(50);
    size(500, 500);
    predatorP = {150, random(1,500)};
    preyP = {150, 250};
    rectMode(CENTER);
}
 
void draw() {
    background(150);
    if(predatorP[0] > preyP[0]){
       predatorP[0]--;
    }
    else if(predatorP[0] < preyP[0]){
       predatorP[0]++;
    }
    if(predatorP[0] == preyP[0]){
        if(predatorP[1] > preyP[1])
           predatorP[1]--;
        else if(predator[1] < preyP[1])
           predatorP[1]++;
    }
    else {
        slant = (preyP[1] - predatorP[1]) / (preyP[0] - predatorP[0]);
        if(predatorP[1] > preyP[1])
           predatorP[1] -= abs(slant);
        else if(predatorP[1] < preyP[1])
           predatorP[1] += abs(slant);
    }
    predator = rect(predatorP[0], predatorP[1], 20, 20);
    prey = ellipse(preyP[0], preyP[1], 20, 20);
}

// predatorPがpreyPのy座標より下の位置に出現するパターンでないと実行できない
// 更に位置が被るとpredatorP,prayP共に消える
