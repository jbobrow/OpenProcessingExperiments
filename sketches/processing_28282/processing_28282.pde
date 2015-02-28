
PImage level;
PImage [] robo;
int x = 0;
int y = 250;
int frame = 0;
int x2 = 3;
int b = 100;
int a = 75;

float rot=0;
float desiredRot = 0;


void setup(){
  size (500,500);
 
  robo = new PImage[3];
  for(int i = 0; i< robo.length; i ++) {
  robo[i]= loadImage("robotsuit" + (i+1) + ".png");  
  }
  level= loadImage("mariolevel.jpeg");  
}



void draw(){
  
 if(frame > 2) frame = 0;
  
 
 image(level, 0,0, 500, 500);
  
  
  
  pushMatrix();
  translate(x,y);
  rotate(rot);
  image(robo[frame], -50,-50, a,b);
  popMatrix();
  
  x+=x2;
  frame++;
 // y+=y2;
 
 if (x>=500 || x<=0)
   {
    x2*=-1;
 }
  else if(mousePressed){
  a++;
  b++;
    
 }
}
//void keyPressed() {
 //if(key == CODED) {
  //if(keyCode == RIGHT){
    //x+=5;
    //desiredRot = 1.5*PI;
    //frame ++;
    
    
  //}else if(keyCode == LEFT){
    //x-=5;
    //desiredRot= .5*PI;
    //frame ++;
   
    
  //}else if(keyCode == UP){
    //y-=5 ; 
    //desiredRot= PI;
    //frame ++;
   
    
  //}else if(keyCode == DOWN){
    //y+=5;
    //desiredRot=0;
    //frame ++;
    
    
  //}  
  
  
 //}
 
//} 

