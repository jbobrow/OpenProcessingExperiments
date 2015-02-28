
PFont font;

void setup() {
  size(500,500);
}
void draw() {
  background(255,25,20);
  noStroke();
  font = createFont("Aharoni-Bold",30);

  for (int ypos = 0; ypos < 600; ypos = ypos + 40) {
    for(int xpos = 0; xpos < 600; xpos = xpos + 60) {
      textFont (font);
        fill (mouseX,mouseY,0);
      textSize (30);
            text("FUNKY",xpos-29,ypos-40);
      rect (xpos,ypos,40,5);
      fill(mouseX,mouseY,10,50);
      ellipse(xpos,ypos,60,50);
      fill(0,0,mouseY);
      rect(xpos,ypos+23,34,10);
      fill(255,50);
    }
  }
}

