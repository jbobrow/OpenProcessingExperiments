
int c = 0;
void setup(){
  size(350,150);
  background(255);
  smooth();
  strokeWeight(15);
}


void draw(){
  if(mousePressed){
    if(key == 'b' || key == 'B'){
    strokeWeight(20);
    c=60;
  }
  if(key == 'w'|| key == 'W'){
    strokeWeight(10);
    c=200;
  }
    stroke(c);
    line(mouseX,mouseY,mouseX,mouseY);
  }
}



