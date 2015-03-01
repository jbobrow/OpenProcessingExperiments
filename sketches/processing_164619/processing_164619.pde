
float angle = 0.0;
float offset = 250;
float scalar = 10;
float speed = 0.2;
int numberCircles = 70; 

float[] circlePositionX = new float[numberCircles]; 
float[] circlePositionY = new float[numberCircles]; 

float[] circleVelocityX = new float[numberCircles]; 
float[] circleVelocityY = new float[numberCircles];
void setup(){
size(500,500);
background(0);
}

void draw(){
  if(key=='q'|| key=='Q'){
    C4();
  }
  if(key=='e'|| key=='E'){
    C6();
  }
  if(key=='w'|| key=='W'){
   C5();
  }
  
}
  
 void C4(){
 
   size (500,500);
   smooth();
    background(0);
  textSize(36);
  fill(mouseX,mouseY,0,250);

  text("Processing",250, 260);
 
 }

 void C6(){
 

   float x = offset + cos(angle)*scalar;
  float y = offset + sin(angle)*scalar;
  
  ellipse(x,y,6,6);
  fill(140);

   if(angle > 200){
     
    angle -= speed;
    scalar -=speed;
  }else{
 
    angle += speed;
    scalar +=speed;
  }
 }
 void C5(){
   noStroke(); 
smooth(); 
colorMode(RGB); 
frameRate(60);
   
   float x = offset + cos(angle)*scalar;
  float y = offset + sin(angle)*scalar;
  background(mouseX-mouseY,mouseY-mouseX,250,70); 
for (int i=0;i < numberCircles;i++) { 
fill((mouseY+30-255), (mouseX+30), (100-mouseX)); 
}
  ellipse(x,y,50,50);
  
  angle += speed;
  scalar +=speed;
 }
   


