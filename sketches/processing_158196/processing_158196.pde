
float a = 0;

void setup(){
  size(500,500);
  smooth();
  noStroke();
  background(#BAFF0D);
  
  print(map(-0.5,-1,1,0,400)); //sin use also for noise map( ,0,1,,)
}

void draw(){
  background(#BAFF0D);
 // float x = width/2 + 100*sin(a);
  float x = map(sin(a), -1,1, 0, width);
  ellipse(x,height/2,50,50);
  a = a + 0.03;
}
