
int c = 0;
void setup(){
  size(350,150);
  background(255);
  smooth();
  strokeWeight(5);
}

void draw(){  
  drawblack();
  
}

void drawblack(){
  if(mousePressed){
    if(key == 'b' || key == 'B'){
    strokeWeight(5);
    c=0;
  }
  if(key == 'w'|| key == 'W'){
    strokeWeight(10);
    c=255;
  }
    stroke(c);
    line(mouseX,mouseY,mouseX,mouseY);
  }
}



