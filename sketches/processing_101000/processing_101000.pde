
int timer=10;  //number of objects
int level=1;    //starting level
int score=0;    //starting score
float fX=220;
float fY=220;
float eX=250;
float eY=250;
float pX=310;
float pY=310;
float easing =.05;
color pColor=color(#0BFF00);

void setup(){
  size(500, 500);
  frameRate(30);
  background(0); 
}  
  
void draw(){
  player1();
  collisions();
}

void player1() {
 //background(0);
  
  textSize(20);
  fill(#FFFFFF);
  
  text("Level=" + level ,55,30);
  text("Score=" + score ,350,30);  
 
  float targetX=mouseX;
  float targetY=mouseY;
  pX +=(targetX - pX)*easing;
  pY +=(targetY - pY)*easing;
  fill(pColor);
  ellipse(pX, pY, 25, 25);
  
 if (timer > 0) {
    fX=random(width);
    fY=random(height);
     fill(#EDFF03);
     rect(fX, fY, 20, 20);
     
    // to detect where the object is
    //  float distC = dist(pX,pY,fX,fY);
    //        if(distC <= 10)
           // score ++;
      timer --;
    }
}

void collisions() {
  float pDist=dist(pX, pY, fX, fY);
  if (pDist <=25) 
    pColor=color(#3ABF9C);
    pColor=color(#6ABF3A);
    
}
 
//void bGround(){
//for(int i = 0; i <= width; i += 50){
//   for(int j = 0; j <= height; j += 50){
   //fill(#0BFF00);
   //rect(i,j,20,20);
