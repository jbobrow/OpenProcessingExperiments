
void setup() {
  size(900,900);
}

void draw() 

{
  if (mousePressed) {
    fill(0);
  } else {
    fill(0,100,255);
smooth();
translate(width/2, height/2);
ellipse(mouseX, mouseY, 50, 50);
ellipse(mouseX, mouseY, 50, 50);
rotate(radians(72));
ellipse(mouseX, mouseY, 50, 50);
rotate(radians(72));
ellipse(mouseX, mouseY, 50, 50);
rotate(radians(72));
ellipse(mouseX, mouseY, 50, 50);
rotate(radians(72));
ellipse(mouseX, mouseY, 50, 50);

}
}

void mousePressed() {
       background(255,255,255);
       translate(width/2, height/2);
     }




