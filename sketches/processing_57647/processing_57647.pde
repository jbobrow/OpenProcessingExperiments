
PShape Bee;
PShape sunflowerBack;
PShape sunflower3;
PShape beehiveBack;
PShape Bee2;
PShape Bee3;
PShape Bee4;
PShape Bee5;
PShape Bee6;
PShape BeeDrop;
float xpos = 0;
float ypos = 0;
float BeeRot = 0;
float sunflowerRot = 0;
float sunBackX = 0;
float sunBackY = 60;
float Bee3X = 570;
float Bee3Y = 385;
float Bee4X = 570;
float Bee4Y = 385;
float Bee5X = 570;
float Bee5Y = 385;
float Bee6X = 570;
float Bee6Y = 385;
float BeeDropX = 570;
float BeeDropY = 385;
boolean bgMove = false;
boolean littleBee = false;
float x = 570;
int y = 385;
int w = 58;
int h = 69;
float speed = 1;
float gravity = 0.1;


void setup() {
  size(800,600);
   smooth();
 
  Bee = loadShape("Bee.svg");
  sunflowerBack = loadShape("SunflowerBackground.svg");
  sunflower3 = loadShape("sunflower3.svg");
  beehiveBack = loadShape("SunflowerInteractivePage2.svg");
  Bee2 = loadShape("Bee2.svg");
  Bee3 = loadShape("Bee2.svg");
  Bee4 = loadShape("Bee3.svg");
  Bee5 = loadShape("Bee2.svg");
  Bee6 = loadShape("Bee3.svg");
  BeeDrop = loadShape("Bee2.svg");
  
}

void draw() {
  background(204,238,242,95);  //blue background
  noStroke();
  
  shape(sunflowerBack,sunBackX,sunBackY,800,600);
  
    //display big sunflower and rotate
  shape(sunflower3,335+sunBackX,148+sunBackY,348.5,401.5);
  sunflower3.rotate(radians(sunflowerRot));
 xpos=xpos+.5;
  sunflowerRot=sunflowerRot+.01;
    //add some variation to rotation
  //if (sunflowerRot>8) {
  // sunflowerRot=sunflowerRot*-1;
 // }
  //if (sunflowerRot<0) {
    //sunflowerRot=sunflowerRot*-1;
 // }
  //shape(sunflower3,165,5,348.5,401.5);
   
  shape(beehiveBack,700+sunBackX,-60,800,600); 

 
    //display bee and move across the screen
  shape(Bee,xpos,40,138,144);
   xpos=xpos+2.5;
 
  //if the bee leaves the screen, move it back to the left
  if (xpos>width) {
    xpos=-50;
  }
  
  //as bee reaches the right of screen background moves and changes
 if (xpos>width/2){
   bgMove=true;
 }
   
 
 if (bgMove){
   sunBackX=sunBackX-1;
   sunBackY=sunBackY+1; 
 }
   
  //when beehive Background reaches the left side of the screen it stays stationary
if(sunBackX<-600){
  sunBackX=-600;
}

if (littleBee){
if (sunBackX<-600);

shape(Bee2,x,y,w,h);
x=x-2;

shape(Bee3,Bee3X,Bee3Y,w,h);
  Bee3X=Bee3X-1;
  Bee3Y=Bee3Y+1;
  
shape(Bee4,Bee4X,Bee4Y,w,h);
  Bee4X=Bee4X+1;
  Bee4Y=Bee4Y-1;
  
shape(Bee5,Bee5X,Bee5Y,w,h);
  Bee5X=Bee5X-5;
  Bee5Y=Bee5Y+5;
  
shape(Bee6,Bee6X,Bee6Y,w,h);
  Bee6X=Bee6X+5;
  Bee6Y=Bee6Y-5;
 
shape(BeeDrop,BeeDropX,BeeDropY,w,h);
BeeDropY = BeeDropY + speed;
speed = speed + gravity;
  if (BeeDropY > height) 
   speed = speed * -0.95;
    
  

   
 }     

  
}
 
 
 

 
void mousePressed(){
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
    littleBee=!littleBee;
    

  }   
  

  
}


