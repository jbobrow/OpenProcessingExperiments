
int timer=0;
float fX=200;
float fY=200;
float eX=250;
float eY=250;
float pX=300;
float pY=300;
float speed =10;

void setup(){
  size(500,500);
  frameRate(24);
}
void draw(){
  background(0);
  food();
  player1();
}
void food(){
  //respawn
  timer++;
  if(timer >= 48){
    fX=random(width);
    fY=random(height);
    timer=0;
}
ellipse(fX,fY,30,30);

}
void player1(){
  if(keyPressed){
  if(key=='a'){
      pX -= speed;
  }
}if(key=='a'){
      pX -= speed;
}
 if(key=='d'){
      pX += speed;      
  }
   if(key=='s'){
      pY += speed; 
   }
   if(key=='w'){
      pY -= speed; 
  }

ellipse(pX,pY,30,30);
}
