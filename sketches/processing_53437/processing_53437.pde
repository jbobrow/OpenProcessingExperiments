
int x = 125;
int y = 125;
int w = 125;
int h = 125; 

void setup()
{
  size(500,500);
}

void draw() {
 background(0);
 if ((mouseX>x) && (mouseX>x+w) &&
    (mouseY>y) && (mouseY < y+h)) {
     fill(255,0,0,50);
    } else {
      fill(0);
    }
 stroke(255);
 strokeWeight(2);
 rect(125,125, 250,250);
 line(170,250, 320,250);
}

