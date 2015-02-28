
void setup() {
    frameRate(20);
    mag=1;    //追跡速度の変更
    size(500, 500);
    predatorP = [30, 30];
    preyP = [150, 150];
    rectMode(CENTER);
 　 predator = rect(predatorP[0], predatorP[1], 20, 20);
    prey = ellipse(preyP[0],preyP[1],20,20);
}

void draw() {
    background(204); //背景色を設定することで画面をクリアする
　 //追跡
   if (predatorP[0] > preyP[0])
        predatorP[0]-=mag;
    else if(predatorP[0] < preyP[0])
        predatorP[0]+=mag;

    slant = (preyP[1]-predatorP[1])/ (preyP[0]-predatorP[0]);
    //println(slant);
    if (predatorP[1] > preyP[1])
        predatorP[1]-=slant*mag;
        //predatorP[1]=predatorP[1]-slant*mag;
    else if(predatorP[1] < preyP[1])
        predatorP[1]+=slant*mag;
        
   //逃避
　 if (preyP[0] > predatorP[0])
        preyP[0]++;
    else if(preyP[0] < predatorP[0])
        preyP[0]--;

    /*if (preyP[1] > predatorP[1])
        preyP[1]++;
    else if(preyP[1] < predatorP[1])
        preyP[1]--;
   */
        
 　predator = rect(predatorP[0]%width, predatorP[1]%height, 20, 20);
    prey = ellipse(preyP[0]%width,preyP[1]%height,20,20);
}
