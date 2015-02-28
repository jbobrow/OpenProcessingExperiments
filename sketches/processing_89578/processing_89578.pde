
void setup () {
  size (480,120);
  smooth (); 
}

void draw(){
   //background(255);
  ellipse(mouseX,mouseY,30,30);
   if (mousePressed) {//chane the color when i click the mouse
    fill(random(0,255),random (0,255),random(0,255),120); 
   } 
}
