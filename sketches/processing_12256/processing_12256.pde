

void setup(){
size(400,400);
background(random(455),random(325),random(225));
smooth();

}

void draw(){
int Drawx=mouseX;
int Drawy=mouseY;
}

void mouseDragged(){
int Drawx=mouseX;
int Drawy=mouseY;
ellipse(Drawx,Drawy,20,20);
fill(random(125),random(665),random(300));
}

void keyPressed() {
  if (key=='r') {
    rect(0,0,700,700);
  }
  if (key=='s') {
    saveFrame();
  }
  
}




 
  

