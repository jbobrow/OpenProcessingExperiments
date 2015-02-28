
float X = 0;
float Y =0;
float xSpeed=3;
float ySpeed=2;
int lefty=0;
int righty=0;
float leftySpeed=-1;
float rightySpeed=1;

void setup() {
  size(400,400);

}
void draw(){
  background(0);
  
  if(X>width){
    xSpeed*=-1;
  }
  if(X<0){
    xSpeed*=-1;
  }
  if (Y>height){
    ySpeed*=-1;
  }
  if(Y<0){
    ySpeed*=-1;
  }
  fill(250);
  smooth();
  ellipse(X,Y, 40,40);


X+=xSpeed;
Y+=ySpeed;


 fill(250,250,50);
 
 lefty+=leftySpeed;
 righty+=rightySpeed;
 
 quad(0,righty+200,0,righty+0,50,righty+16,20,righty+50); //right MIT
 
 
quad(400,lefty,400,lefty+200,380,lefty+330,380,lefty+235);
if(lefty>height){
  leftySpeed*=-1;
}
if (lefty<0){
  leftySpeed*=-1;
}// point R (a,b),(c,d) (e,f) (g,h)

if(righty>height){
  rightySpeed*=-1;
}
if(righty<0){
  rightySpeed*=-1;
}
  

}
