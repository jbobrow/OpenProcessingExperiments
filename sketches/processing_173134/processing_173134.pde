
float a = random (0, 255);
float b = random (0, 255);
float c = random (0, 255);

void setup () {
  noCursor();
  noStroke();
  size (800, 600);
  background(#FFFFFF);
}

void draw() {
  //background(#FFFFFF);
  fill (a, b, c, 200);
  ellipse (mouseX, mouseY, 50, 50);
  
  if (random(0,20)>10)
  {a+=5;} else {a-=5;}
  
  if (random(0,20)>10)
  {b+=5;} else {b-=5;}
  
  if (random(0,20)>10)
  {c+=5;} else {c-=5;}

  if (a<=0&&b<=0&&c<=0||a>=255&&b>=255&&c>=255) {
    a = random (0, 255);
    b = random (0, 255);
    c = random (0, 255);
  }
}



