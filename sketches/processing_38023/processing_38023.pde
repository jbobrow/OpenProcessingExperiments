
void setup(){
  background(0);
  size(600,600);
  colorMode(HSB,width);
}

int cen = 0; //rotation from center
int rot = 0; //primary rotation
int x = 0;
int w = 200;
int h = 200;

void draw(){
  frameRate(12);
  noFill();
  pushMatrix();
  translate(width/2,height/2); //starts rotation at center
  rotate(radians(rot*12));
  translate(x++,0);
  rotate(radians(cen+45)); //rotates from primary rotation
  stroke(random(width),600,600); //scales hsb Hue from range of width
  ellipse(0,0,w,h);
  popMatrix();
  
  cen+=10;
  rot++;
  w--; //shrinks down from width of 200 then starts growing again
  h--; //shrinks down from height of 200 then starts growing again
}
  

