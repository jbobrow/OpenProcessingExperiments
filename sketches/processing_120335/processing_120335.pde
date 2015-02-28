
void setup(){
  size(500,500);
}

void draw(){
  background(130);
   
  for (int i=10; i<490; i+=20) {
  fill(255);
  rect(30,i,100,20);
  }
  
  for (int i=10; i<490; i+=8) {
  fill(255);
  rect(210,i,50,8);
  }

for (int i=10; i<490; i+=8) {
  rect(360,i,25,8);
  }
  
pushMatrix();
  int sec= second()*8;
  fill(144,4,4);
  rect(367.5,10,10,sec);
  popMatrix();
  
  pushMatrix();
  int min= minute()*8;
  fill(0);
  rect(225,10,20,min);
  popMatrix();
  
  pushMatrix();
  int h= hour()*20;
  fill(0);
  rect(65,10,30,h);
  popMatrix();
}
