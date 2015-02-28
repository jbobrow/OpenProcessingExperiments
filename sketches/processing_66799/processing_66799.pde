

//Assignment 1 : Loop animation for Olympic
//Yoko Tomishima 

PFont font;
String victory = "Victory Ceremony";
String london = "LONDON 2012";
int x = 250;
int y = 60;
float h = 50;
int i = 0;
float x2 = 0;
float y2 = 0;
float xspeed = 10;
float yspeed = 10;
color[] randomColor;
float t = 1;
int currentTime;
int speed = 1;
float angle = 0.0; // Current angle
float speedc = 0.1; // Speed of motion
float radius = 5.0; // Range of motion


void setup(){
  size(600,300);
  background(255);
  smooth();
  font = loadFont("OratorStd-48.vlw");
  textFont(font,48);
  int currentTime = millis();
}



void draw(){
  
  //fading background
  fill(255,60);
  noStroke();
  rect(0,0,width,height);
  
  // text "vicroty ceremony"
  fill(0);
  text(victory,80,200);
  
  colorText();
  drawRing(); 
  updateLines();
}
  
void colorText(){
  //make array for color for text
  color[] randomColor = {
  color(3,114,255), color(255,214,3),
  color(0,0,0), color(8,149,46), color(245,27,27)
  };

 int colorIndex = int(random(randomColor.length));
 fill(randomColor[colorIndex]);
 text(london,120,250);
}


void drawRing(){
   
  angle += speedc;
  float sinval = sin(angle);
  float yoffset = sinval * radius;
  
  noFill();
  strokeWeight(5);

  stroke(3,114,255); // blue ring
  ellipse(x,y+yoffset,h,h);
  
  stroke(255,214,3); // yellow ring
  ellipse(x+h/2,y+h/2+yoffset,h,h);
  
  stroke(0,0,0); // black ring
  ellipse(x+h,y+yoffset,h,h);
  
  stroke(8,149,46); // green ring
  ellipse(x+h*1.5,y+h/2+yoffset,h,h);
  
  stroke(245,27,27); // red ring
  ellipse(x+h*2,y+yoffset,h,h);
}


  // ease
  float s(float p) {
  return 1.0/(1+exp(-p));
}   

void drawRect(){ // 1st animation
  
  //easing animation
  noStroke();
  fill(#FC0F8E);
  rect(600*s(t/10-8), 270, 10, 10);
  t += speed;
}

void drawQuad(){ //2nd animation
  strokeWeight(1);
  stroke(#FF9F03);
  fill(#FC0F8E);
  quad(random(100,500),random(100,200),random(100,500),random(100,200),random(width),random(height),random(width),random(height));
}

void reset(){ // reset timer
  currentTime = millis();
  t=0;
  x2 = 0;
  y2 = 0;
}

void lineV(){ 
 
  strokeWeight(1);
  fill(150,50);
  stroke(#FFF862);
  triangle(0,0,0,height,width/2,height);
  triangle(width,0,width,height,width/2,height);
  
}


void updateLines(){ // change animation depends on timer
      
  if (millis() < currentTime+5000){
    drawRect();
  }else if (millis() < currentTime+8000){
    drawQuad();
  }else if (millis() < currentTime+12500){
    lineV();
  }else{
    reset();
  }
}

