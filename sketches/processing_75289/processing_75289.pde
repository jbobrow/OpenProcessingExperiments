
int myColor;
int ellSize;
float casa;

void setup(){
  size(800,600);
  smooth();
  background(20,90,90);
  rect(90,90,190,15);
  fill(255,60,70);
  ellipse(20,20,20,20);
  rect(20,20,10,10);
  ellipse(30,30,10,10);
  myColor = 0;
  ellSize=0;
  casa=0;
  
}

void draw() {
  
  myColor++;
  casa++;

  fill(myColor/2, myColor/3, myColor/4);
  ellipse(random(width),random(height),ellSize,ellSize);
  for(int i=0;i<600;i++){
  triangle (i,i,20,0,0,50);
  }
  fill(200);
  rect(200,200,500,500);
  
  fill(90);
  
  if (ellSize == 150) {
   ellSize = 1;
    background(random(255),random(255),random(255));
  }
  else {
  ellSize++;
  
  }
  
}
