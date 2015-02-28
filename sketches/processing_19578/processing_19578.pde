
void setup(){
  size(250,250);
  background(0);
}

void draw(){
  noStroke();
  fill(0,0,0,20);
  rect(0,0,width,height);
  for (int i=0;i<400;i++){
    fill (random(255),random(255),random(255),random(255));
    ellipse(random(1,i),random(1,i),4,4);
  }
}

