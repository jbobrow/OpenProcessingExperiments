
void setup() {
    frameRate(20);
    size(500, 500);
    predatorP = [30, 30];
    preyP = [350, 150];
    rectMode(CENTER);
ã��  predator = rect(predatorP[0], predatorP[1], 20, 20);
    prey = ellipse(preyP[0],preyP[1],20,20);
    vel=3;    //è¿½è·¡é��åº¦
}

//è¿½è·¡ã��ã�­ã�°ã�©ã� 
void chase() {
    if(abs(preyP[0]-predatorP[0]) > 0.1) {
        //å�¾ã��è¨�ç®�
        slant = (preyP[1]-predatorP[1])/ (preyP[0]-predatorP[0]);
        println("s="+slant);
        a=sqrt(vel^2/(1+slant^2));
        println("a="+a);
    
    ã��  //è¿½è·¡ã��xæ�¹å��
        if (predatorP[0] > preyP[0])
            predatorP[0]-=a;
        else if(predatorP[0] < preyP[0])
            predatorP[0]+=a;
    
    ã��  //è¿½è·¡ã��yæ�¹å��
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

void runout(){
   //é��é�¿
ã�� if (preyP[0] > predatorP[0])
        preyP[0]++;
    else if(preyP[0] < predatorP[0])
        preyP[0]--;

    if (preyP[1] > predatorP[1])
        preyP[1]++;
    else if(preyP[1] < predatorP[1])
        preyP[1]--;
}

void draw() {
    background(204); //è��æ�¯è�²ã��è¨­å®�ã��ã��ã��ã�¨ã�§ç�»é�¢ã��ã�¯ã�ªã�¢ã��ã��
    chase();     
    runout();      
ã��  predator = rect(predatorP[0]%width, predatorP[1]%height, 20, 20);
    prey = ellipse(preyP[0]%width,preyP[1]%height,20,20);
}
