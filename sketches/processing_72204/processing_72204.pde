
int BallOn;
float Vx;
float Vy;
float Px;
float Py;
float Mu;
float G;
int BallX;
int BallY;
float St;
Float Squ;

void setup (){
size (600, 600);
St=2;
smooth();
Squ=.5;
}

void draw (){
background (0);
Mu=-.8;
G=1;
  if (mousePressed){
    BallOn=1;
    BallX=20;
    BallY=20;
    Px=mouseX;
    Py=mouseY;
    Vx=mouseX-pmouseX;
    Vy=mouseY-pmouseY;
    }
  if(BallOn==1){
   fill(Py/5,100,100);
   Vy=Vy+G;
   Px=Px+Vx;
   Py=Py+Vy;
   ellipse (Px,Py,BallX,BallY);
     if(Px>width-(BallX/2)){
       Px=width-BallX/2;
       Vx=Vx*Mu;
     }
     if(Px<0+(BallX/2)){
       Px=BallX/2;
       Vx=Vx*Mu;
     }
     }
     if(Py>height-(BallY/2)){
       Py=height-BallY/2;
       Vy=Vy*Mu;
     }
     if(Py<0+(BallY/2)){
       Py=BallY/2;
       Vy=Vy*Mu;
     }
     if (Py<BallY){
       Vx=Vx*Mu*.5;
     }
     if(BallX<20){
       BallX++;
     }
     if (BallY<20){
       BallY++;
     }
     if (BallX>20){
       BallX--;
     }
     if (BallY>20){
       BallY--;
     }

  }


