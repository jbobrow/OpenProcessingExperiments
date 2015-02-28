
void setup (){
  size (800,400);
  background (random (255),random (100),random (150));
}

void draw (){
  stroke (random (255),random (200),random (150));
  fill (random (255),random (100),random (150),50);
  quad ( mouseX,100,50, mouseY,mouseY,200,200,mouseX);
}

void mousePressed (){
  saveFrame();
}

