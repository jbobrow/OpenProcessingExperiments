
void setup() {
    frameRate(20);
    size(500, 500);
    predatorP = [30, 30];
    preyP = [350, 150];
    rectMode(CENTER);
　  predator = rect(predatorP[0], predatorP[1], 20, 20);
    prey = ellipse(preyP[0],preyP[1],20,20);
    vel=5;    //追跡速度
}

//追跡プログラム
void chase() {
    if(abs(preyP[0]-predatorP[0]) > 0.1) {
        //傾き計算
        slant = (preyP[1]-predatorP[1])/ (preyP[0]-predatorP[0]);
        println("s="+slant);
        a=sqrt(vel^2/(1+slant^2));
        println("a="+a);
    
    　  //追跡　x方向
        if (predatorP[0] > preyP[0])
            predatorP[0]-=a;
        else if(predatorP[0] < preyP[0])
            predatorP[0]+=a;
    
    　  //追跡　y方向
        if (predatorP[1] > preyP[1])
            predatorP[1]-=a*abs(slant);
        else if (predatorP[1] < preyP[1])
            predatorP[1]+=a*abs(slant);
    }else{
        predatorP[0] = preyP[0];
        if(abs(preyP[1]-predatorP[1]) >= vel) {
          println(abs(preyP[1]-predatorP[1]));
          if (predatorP[1] > preyP[1])
                predatorP[1]-=vel;
            else if(predatorP[1] < preyP[1])
                predatorP[1]+=vel;
        }else{
            predatorP[1] = preyP[1];
            println("p1");
        }
    }
}

void draw() {
    background(204); //背景色を設定することで画面をクリアする
    chase();           
　  predator = rect(predatorP[0], predatorP[1], 20, 20);
    prey = ellipse(preyP[0],preyP[1],20,20);
}
