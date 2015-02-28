
PImage spiral1;
PImage spiral2;
PImage spiral3;
PImage spiral4;

float aspect;
boolean paused= false;

void setup() {
  size(800,800);
  spiral1=loadImage("22.png");
  spiral2=loadImage("10-1.png");
  spiral3=loadImage("101.png");
  spiral4=loadImage("background .png");

}

void draw(){

 //DRAWING RANDOM SPIRAL1
 if(!paused){
  aspect=random(0.06,0.26);
  image(spiral1,random(width),random(height), spiral1.width*aspect, spiral1.height*aspect);
 }

}

//draw spiral2 wherever the mouse is pressed
void mousePressed(){
  aspect=random(0.3,2.3);
    image(spiral2, random(-width), random(-height), spiral2.width*aspect, spiral2.height*aspect);
  }


void keyPressed() {
  if(key=='a')
  background(90,132,106);
  
  if(key=='s'){
  image(spiral3, mouseX, mouseY, spiral3.width/2, spiral3.height/3);
  }
  
  if(key=='d'){
   image(spiral4, mouseX, mouseY, spiral4.width/2, spiral4.height/2);
  }
  
  

  if(key==' '){
   if(paused) {paused=false;}
   else{paused=true;} 
  }
  
  

}



