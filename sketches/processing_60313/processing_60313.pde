
float w=400;
float i, j, r, t;
int x, y, bg;
float mysize = 0.8;
String myshape = "circle";
color c = color(round(random(255)), round(random(255)));
PImage thedali;

void setup() { 
  size(400, 400); // Größe der Zeichenfläche festlegen
  frameRate(25); // FrameRate festlegen
  thedali=loadImage("dali.jpg"); // Dali-Bild laden
  smooth(); // AntiAliasing aktivieren
  fill(0, 0);
}
void draw() {
  if (keyPressed) {
    if (key == '+') {
      mysize = mysize + 0.05;
    }
    if (key == '-') {
      mysize = mysize - 0.05;
    }
    if (key == 'c') {
      myshape = "circle";
    }
    if (key == 'r') {
      myshape = "rectangle";
    }
  }
  x=mouseX;
  y=mouseY;
  background(((x+y)*255/1000), 100);

  noStroke();
  rectMode(CENTER);
  if (myshape== "rectangle") {
    rect(mouseX, mouseY, (30*mysize), (30*mysize));
  }
  if (myshape== "circle") {
    ellipse(mouseX, mouseY, (30*mysize), (30*mysize));
  }

  fill(0, 15);
  image(thedali, 0, 0);

  fill(c);

  for (i=0;i<w;i+=20)
  {
    for (j=0;j<w;j+=20)
    {

      if (myshape== "rectangle") {
        r=3E3/(dist(x=mouseX, y=mouseY, i, j)+1E2);
        rect(i+r*cos(t=atan2(j-y, i-x)), j+r*sin(t), (12*mysize), (12*mysize));
      }
      if (myshape== "circle") {
        r=3E3/(dist(x=mouseX, y=mouseY, i, j)+1E2);
        ellipse(i+r*cos(t=atan2(j-y, i-x)), j+r*sin(t), (12*mysize), (12*mysize));
      }
    }
  }
}
void mouseClicked() {
  c = color(round(random(255)), round(random(255)));
}



