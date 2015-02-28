
void setup(){
  size(480,120);
  smooth();
}

void draw(){
  //background(255);
  if (mousePressed){ //change the color when i click mouse
    fill(random(0,255),random(0,255),random(0,255),120);
  }
    else{
      ellipse(mouseX,mouseY,30,30);
    }
}
