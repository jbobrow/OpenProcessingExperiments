
int r, g, b;

//---------
void setup() {
  size(400, 500);
  background(0);
  rectMode(CENTER);

  r = 0;
  g = 250;
  b = 250;
}

//-----------
void draw() {

  fill(r, g, b);
  rect(width/2, height/2, 100, 100);

  fill(250-r, 250-g, 250-b);
  rect(mouseX, mouseY, 20, 20);
}

//----------
void mousePressed() {

  if (mouseX>width/2-50 &&
    mouseX<width/2+50 &&
    mouseY>height/2-50&&
    mouseY<height/2+50) {  
    fill(random(0, 255), random(0, 255), random(0, 255));
  }
  else {
    r = 0;
    g = 250;
    b = 250;

    background(random(0, 255), random(0, 255), random(0, 255));
  }


  println(mouseX);
  println(mouseY);
}



