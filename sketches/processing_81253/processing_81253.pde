
//bouncing ball code taken from http://www.openprocessing.org/sketch/66301

 /* @pjs font="GillSansStd-Shadowed.otf"; */
 
PImage img;

PFont font1;

int yPos = 5;
int spe = 5; // spe = speed
boolean direction = true; // true = going down, false = going up

//PFont font;

void setup(){
  size(600,400);
  img= loadImage("chase.jpg");
  image(img,0,0);
  
  //font1=loadFont("GillSansStd-Shadowed.otf");
  //textFont(font1);
  
  //textFont(createFont("GillSansStd-Shadowed",32));
  
  font1=loadFont("AbadiMT-CondensedExtraBold-48.vlw");
  textFont(font1);
}


void draw(){
  background(img);

  frameRate(100);
  //background(25, 193, 23);
  //fill(255);
  fill(49, 155, 31);
  noStroke();
  ellipse(height/1.1, yPos-50, 50, 50);
 
  if  (direction == true && yPos >= 5) {
    yPos +=spe;
  }
  if (yPos >= height){
   direction = false; }
    
   if (direction == false && yPos <= height){
     yPos -=spe;}
      
     if (yPos <= 5){
    direction = true;
  }
  
  fill(0);
  text("I WANT A",50,320);
  text("TOO!!!",150,360);
  fill(255);
  text("BALL",50,360);
  
    if (mousePressed){
    smooth();
    fill(255);
    ellipse(height/2, yPos-50, 50, 50);
      
     text("YAY!",50,80);
     
     

  }
  
}

void mouseClicked() {
 //strokeWeight(10);
  //line(200,50,100,100);
  //stroke(random(10,220),220,180);
    //text("GRRR!!!",50,140);
    //fill(200,30,10);
    //text("GRRR!!!",mouseX, mouseY);
    //text("GRRR!!!",mouseX+100, mouseY+100);


}



