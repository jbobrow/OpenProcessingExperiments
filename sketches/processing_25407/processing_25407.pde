
void setup(){
  size(500,250);
  background(255);
}

void draw(){
  int i = 5;
  while(i < width/2){
    strokeWeight(4);
    stroke(i,0,0);
    line(width/2-i,i,width/2+i,i);
    i = i + 10;
  }
}

