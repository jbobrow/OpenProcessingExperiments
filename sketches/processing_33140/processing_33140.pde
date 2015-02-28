
PFont musenFont;
float yPos=45;
float vel=5;
float xPos=10;

void setup(){
   size(1280,720);
   musenFont=createFont("Helvetica",60,true);
   textFont(musenFont);
   
}

void draw(){
  
 
  
  fill(0,0,0 );
  
   PImage a;
   a=loadImage("sea.jpeg");
   image(a,0,0);
   fill(210,10,50);
   text("Welcome to my world!", 350,250);
  
  strokeWeight(3);
  fill(255,0,127);
  noStroke();
  yPos+=vel;
  xPos+=vel;
  ellipse(200,yPos,90,90);
  
  strokeWeight(3);
  fill(255,0,127);
  noStroke();
  yPos+=vel;
  xPos+=vel;
  ellipse(300,yPos,90,90);
  
  strokeWeight(3);
  fill(255,0,127);
  noStroke();
  yPos+=vel;
  xPos+=vel;
  ellipse(1000,yPos,90,90);
  
  strokeWeight(3);
  fill(255,0,127);
  noStroke();
  yPos+=vel;
  xPos+=vel;
  ellipse(1100,yPos,90,90);
  
  
  if (yPos <45 || yPos>height-45){
  vel*=-1;
}

}

