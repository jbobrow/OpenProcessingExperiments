
void setup() {
     frameRate(20);
     size(500, 500);
     predatorP = [30, 30];
     preyP = [350, 150];
     rectMode(CENTER);
　 predator = rect(predatorP[0], predatorP[1], 20, 20);
     prey = ellipse(preyP[0],preyP[1],20,20);
 }

 void draw() {
     background(204); //背景色を設定することで画面をクリアする
　 //追跡
  if (predatorP[0] > preyP[0])
         predatorP[0]--;
     else if(predatorP[0] < preyP[0])
         predatorP[0]++;

     //slant();
     slant = (preyP[1]-predatorP[1])/ (preyP[0]-predatorP[0]);
     println(slant);
     if (predatorP[1] > preyP[1])
         predatorP[1]=predatorP[1]-slant;
     else if(predatorP[1] < preyP[1])
         predatorP[1]=predatorP[1]+slant;
         
　 predator = rect(predatorP[0], predatorP[1], 20, 20);
     prey = ellipse(preyP[0],preyP[1],20,20);
 }

 /*
 void slant(){
     slant = (preyP[1]-predatorP[1])/ (preyP[0]-predatorP[0]);
     //retrun slant;
 }
 */
