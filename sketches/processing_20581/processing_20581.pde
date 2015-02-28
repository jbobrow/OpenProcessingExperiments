
/*Sarah Scialli
Homework 3: "Timer"
*/


float oldMillis;
float newMillis;
float y;
float x;
int speed;
PImage gumballFront;
PImage gumballBack;

void setup(){
  size(640,480);
  smooth();  
  oldMillis = 0;
  newMillis = 1000;
  y = 290.0;
  x = 120.0;
  speed = 2;
  gumballBack = loadImage("gumballmachineback.png");
  gumballFront = loadImage("gumballmachine.png");
  image(gumballBack,0,0);
  image(gumballFront,0,0);
  
}
void draw(){
   background(255);
   image(gumballBack,0,0);
   newMillis = millis();
   float dt = (newMillis - oldMillis)/100;
   if(dt >= 30 ){
     pickColor((int)random(0, 4));
     x = 100;
     oldMillis = newMillis; 
   }
   if(millis() > 1000){
     x+=16;
     y = 290 + speed*dt  + (0.5) *(9.8)* pow(dt,2);
     ellipse(x,y,30,30);
   }
   image(gumballFront,0,0);
   

} 


void pickColor(int x){
 switch(x){
   case 0:
     fill(207,0,0);
     break;
   case 1:
     fill(51,154,51);
     break;
   case 2:
     fill(0,0,255);
     break;
   case 3: 
     fill(255,255,51);
     break;
 } 
  
}

