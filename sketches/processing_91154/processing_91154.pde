
void setup(){
  size(600,200);
  smooth();
}


void draw(){
  for(int i=20; i<400; i+=16){
    strokeWeight(8);
    stroke(random(0,225),random(0,255),random(0,255));
    line(i, 40, i+60, 80);
    line(i+i/2,80,i,120);
  }
}
