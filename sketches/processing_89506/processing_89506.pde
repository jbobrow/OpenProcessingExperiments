
void setup (){
  size (480, 240);
  smooth();
}

void draw (){
  if (mousePressed){ // change the color when i click the mouse
    fill(random(0,255),random(0,255),random(0,255));
  }
    else{
      ellipse (mouseX,mouseY, 30, 30);
    }
}
