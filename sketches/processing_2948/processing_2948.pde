


void setup(){
  size(500,500);
   colorMode(HSB, 360,100,100); 
  background(#FAFAFA);
  noStroke();
  smooth();
}
void draw (){

 float x= random (width);
float y= random(height);

fill(x,y,56,100);
  rect(x, y, second(), second());
}

