
void setup(){
  size(480,240);
  smooth();
}

void draw(){
    //background(255,240);
    if (mousePressed){//change the color when i clicked the mouse
    ellipse(mouseX,mouseY,30,30);
      fill(random(0,255),random(0,255),random(0,255),120);      
   }
}
