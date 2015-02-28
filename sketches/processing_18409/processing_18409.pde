
color sqcolor = color(155, 155, 155);
int xloc;
int yloc;
int sqsize;

void setup(){
  size(640,480);  
  frameRate(24);
  print(red(sqcolor));  
  background(0,0,0); 
  xloc = 10;  
  yloc= 300;  
sqsize = (int)random(2, 8);
}
void draw() {
  fill(sqcolor); 
  rect(xloc, yloc, sqsize, sqsize); 
  xloc =xloc + sqsize; 
  yloc = yloc + (int)random(-8, 8); 
  if(xloc > width) {
  xloc = 0;   
  sqcolor = color(red(sqcolor)+random(-20, 20), 
  green(sqcolor)+random(-20, 20),                
  blue(sqcolor)+random(-20, 20)); 
}
}
void mousePressed(){
sqcolor = color(random(200), random(200), 200);
}                                               
