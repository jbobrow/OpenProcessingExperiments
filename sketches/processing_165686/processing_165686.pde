
PFont s;
float r;
float g;
float b;
float a;

float diam;
float x;
float y;
void setup(){
  size(600,600);
  background(0,0,0);
}
void draw(){
  if(key=='q' || key=='Q'){
    reading();
  }
  if(key=='w' || key=='W'){
    PALENESS();
  }
  if(key=='e' || key=='E'){
    EYEMOVEMENT();
  }
}
  void reading (){
  smooth();
  fill(0,12);
  rect(0,0,width,height);
  noStroke();
  fill(255,0,0);
  rect(mouseX-11,mouseY-43,230,60);
  s=loadFont("Helvetica-BoldOblique-48.vlw");
  textFont(s,48);
  fill(#4DF7F6);
  text("Supreme",mouseX,mouseY);
}
void PALENESS(){
  float r;
float g;
float b;
float a;

float diam;
float x;
float y;
  smooth();
  frameRate(20);
r = random(255);
g = random(255,0);
b = random(255,0);
a = random(255,0);
diam = random(50);
x = random(width);
y = random(height);
noStroke();
fill(r,g,b,a);
rect(x,y,diam,diam);
} 
void EYEMOVEMENT(){
  //bigger rect
  background(0,0,0);
  noStroke();
  fill(255,0,0);
  rect(225,0,150,150); 
  noStroke();
  fill(255,0,0);
  rect(225,450,150,150);
  noStroke();
  fill(255,0,0);
  rect(0,225,150,150);
  noStroke();
  fill(255,0,0);
  rect(450,225,150,150);
  //smaller rect
  noStroke();
  fill(#4DF7F6);
  rect(275,160,50,50); 
  noStroke();
  fill(#4DF7F6);
  rect(275,390,50,50);
  noStroke();
  fill(#4DF7F6);
  rect(160,275,50,50);
  noStroke();
  fill(#4DF7F6);
  rect(390,275,50,50);
  //much smaller rect 
  noStroke();
  fill(255,0,0);
  rect(285,220,30,30); 
  noStroke();
  fill(255,0,0);
  rect(285,350,30,30);
  noStroke();
  fill(255,0,0);
  rect(220,285,30,30);
  noStroke();
  fill(255,0,0);
  rect(350,285,30,30);
  // much more smaller rect
  noStroke();
  fill(#4DF7F6);
  rect(290,260,20,20);
  noStroke();
  fill(#4DF7F6);
  rect(290,320,20,20);
  noStroke();
  fill(#4DF7F6);
  rect(260,290,20,20);
  noStroke();
  fill(#4DF7F6);
  rect(320,290,20,20);
  // much much more smaller rect 
  noStroke();
  fill(255,0,0);
  rect(296,284,8,8);
  noStroke();
  fill(255,0,0);
  rect(296,308,8,8);
  noStroke();
  fill(255,0,0);
  rect(284,296,8,8);
  noStroke();
  fill(255,0,0);
  rect(308,296,8,8);
  //smallest rect 
  noStroke();
  fill(random(255),0,0);
  rect(298,298,4,4);
}
  
  
    
    



