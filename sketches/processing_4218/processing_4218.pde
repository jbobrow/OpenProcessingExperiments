
// summertime, pol guezennec 09
PImage a;
void setup(){
  size(1000,800);
  background(0); 
  a = loadImage("canoe.gif");
}
void draw(){
  frameRate(6);

  smooth();
  float i = -100;
  float j = 0;
  float var = random(-5,5);
  float ecart = random(3,6);
  strokeWeight(1);
  stroke(200, 160, 160);
  for(j = -100; j < 900; j+=ecart){
    line ( i,j+var, width+100, j+15);
  } 
  stroke(0,200, 255);
  for(j = -100; j < 900; j+=ecart){
    line(i, j+15+var, width+100, j+var);
  }
  stroke(0, 100, 255);
  for(j = -100; j < 900; j+=ecart){
    line(i, j+var, width+100, j+var);
  }
  int x = 100;
  image(a, x, var);
}



