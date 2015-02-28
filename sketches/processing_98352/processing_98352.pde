

var audioElement=document.createElement("audio");
PImage PicPistola;

float posx=800;
float posy=800;
float vel=30;


void setup(){
size(600,600);
PicPistola=loadImage("lasergun.png");

}

void draw(){
  fill(255);
  rect(0,0,width,height);
  
  noStroke();
  fill(#FA0303);
  rect(posx,posy,50,10);
  posx=posx-vel;
  
  image(PicPistola,mouseX,mouseY,370/2,256/2);
  
  
  //------------------------------
  if(mousePressed){
   posx=mouseX;
  posy=mouseY+256/7; 
  }
  
  
  
  
}

void mousePressed(){
 audioElement.setAttribute("src","laserbass.wav");
 audioElement.play();
}


