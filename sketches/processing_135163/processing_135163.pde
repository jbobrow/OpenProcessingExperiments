
float a;
float b;
float c;
float d;
float change1;
float change2;

void setup() {
  size(1920, 720);
}

void draw() {
  if (mousePressed) {
    fill(a,b,c);
  } else {
    fill (color(a,b,c));
    a=random(0,255);
    b=random(0,255);
    c=random(0,255);
    d=random(15,150);
  }
  ellipse(mouseX, mouseY, change1,change2);
  stroke(color(a,b,c));
  change1 = d;
  change2 = d; 
}





