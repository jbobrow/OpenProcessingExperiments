
float counter =0;

void setup(){
  size(500,500);
  colorMode(HSB, 360,100,100);
}

void draw(){
  pushMatrix();
  float B = map(hour(),0,24,0,100);
  background(210,90,B);
  popMatrix();
  
   
  for (int i=10; i<490; i+=20) {
  }
  
  for (int i=10; i<490; i+=8) {
  }

for (int i=10; i<490; i+=8) {
  }
  
pushMatrix();
  int sec= second()*8;
  fill(360);
  rect(367.5,10,10,sec);
  popMatrix();
  
  pushMatrix();
  int min= minute()*8;
  fill(360);
  rect(225,10,20,min);
  popMatrix();
  
  pushMatrix();
  int h= hour()*20;
  fill(360);
  rect(65,10,30,h);
  popMatrix();
}

