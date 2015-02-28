
void setup() {
  size(400,400);
  smooth();
  background(20,250,400);
  colorMode(HSB,width);
}
  int x=200;
void draw(){
  stroke(0);
  strokeWeight(50);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  noStroke();
  fill(50,400,400);
  ellipse(x, height/2,width/9,width/9);
  ellipse(width/2, x,width/9,width/9);
  x++;
  if(x>17*width/18){
  stroke(0);
  strokeWeight(50);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  noStroke();
  fill(50,400,400);
  ellipse(17*width/9-x, height/2,width/9,width/9);
  ellipse(width/2,17*width/9-x,width/9,width/9);
  }
  if(x>33*width/18){
  x=width/18;
  x++;
  }
}


