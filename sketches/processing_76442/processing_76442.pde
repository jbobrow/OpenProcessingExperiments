
//Maria Nunez

PImage ant;
float angle;
boolean colorea;


void setup(){
  size(800,800);
  background(255);
  ant= loadImage("ant.gif");
  angle=0;
  colorea=false;

}

void draw(){
  if(colorea==false){
    modePress();
  }
  
  if (colorea==true){
  modeRandom();
  }
  
  if (mouseX>750){
    mouseBig();
  }
    
  
  if (mousePressed){
   rotate(radians(0));
   modeControl();
 }
}

void mouseReleased(){
  colorea=true;
  background(255);
  angle=0;
}

void modeRandom(){
  
    for(int rad=0;rad<800;rad++){
 
  float x=rad*2*cos(radians(angle/10));
  float y=rad*2*sin(radians(angle))*rad*cos(radians(angle*.5));
  rad++;
  angle+=136.5;
  image(ant,x+width/2,y+height/2);
  }
  
}

void modePress(){
 colorea=false;
  for(int rad=0;rad<400;rad++){
//Saving for future sketches
    //float x=rad*cos(radians(angle/100));
 // float y=rad*10*sin(radians(angle*10))*rad*10*cos(radians(angle*10));
 float x=rad/10*cos(radians(angle/.5));
 float y=rad*10*sin(radians(angle*10))*rad*10*cos(radians(angle*10));
  rad++;
  angle++;
  image(ant,x+width/2,y+height/2); 
}
}
void modeControl(){
   for(int rad=0;rad<800;rad++){
 
  float x=rad*cos(radians(angle*.5));
  float y=rad*sin(radians(angle*.5));
  rad++;
  angle+=136.5;
  image(ant,x+width/2,y+height/2);
  println(mouseX);
 
  }
  
}

void mouseBig(){
   for(int rad=0;rad<300;rad++){
 
  float x=rad*cos(radians(angle*50));
  float y=rad*sin(radians(angle*50));
  rad+=10;
  angle+=-50;
  image(ant,x+width/2,y+height/2);
  }
}

