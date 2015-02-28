
void setup(){
  size(500,200);
  background(255);
  noStroke();
}

void draw(){
  for(int i=0;i<width;i++){
    fill(random(255),random(255),random(255));
    rect(i,1,width,height);
  }
}



