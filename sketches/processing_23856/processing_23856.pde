
//LEFT down size
//RIGHT up size
//ENTER clear
//S save
//P pause

PImage bg;
int x=width/2, y=height/2,dot=10;
color c;
boolean stop;

void setup() {
  size(723,480);
  bg=loadImage("2.jpg"); 
  background(255);
  smooth();
}

void draw(){
  loadPixels(); 
  bg.loadPixels(); 
  
  println(x+"/"+y);
  c=bg.pixels[x+y*width];
  fill(c,80);
  noStroke();
  rect(x,y,dot,dot);
  
  
  x+=random(-dot,dot);
  y+=random(-dot,dot);
  
  if(x<=0)x+=dot;
  if(x>=width)x-=dot;
  if(y<=0)y+=dot;
  if(y>=height) y-=dot;
  
}

void mouseClicked(){
  x=mouseX;
  y=mouseY; 
}

void keyPressed(){
  //Square size
  if(keyCode == RIGHT) dot++;
  if(keyCode == LEFT && dot>0) dot--;
  
  //Background display
  if(keyCode == ENTER) background(255);
  
  //Saving png
  if (key == 's' || key == 'S') saveFrame("sharp"+"_##.png");
  
  //pauseing the screen
  if(key == 'p') stop = !stop;
  if(stop) noLoop();
  else loop();
}

