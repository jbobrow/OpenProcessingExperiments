
void setup ()
{ 
  size (500, 500);
}
color gras = color(11, 149, 25);
color stamm = color(149, 89, 11);
color stroke1 = color (0);
void draw()
{  
  background (255);
  translate(0, height);


  rectMode(CENTER);
  for (int i=0; i<width; i+=5)
  {
    pushMatrix();
    stroke(gras);
    float ver = sin(millis()/300.0+i)*10;
    line (i, 0, i+ver, -30);
    popMatrix();
  }
  stroke(stroke1);
  fill(stamm);
  rect(230, 0, 50, 400);


  for (int a=0; a<360; a+=20)
  {
    pushMatrix();
    stroke(stroke);
    fill(gras);
    translate(230, -200);

    rotate(radians(a));
    ellipse (60, 0, 40, 40);
    ellipse (30, 1, 20, 30);
    ellipse (15, 1, 20, 20);
    ellipse (7, 1, 10, 20);


    popMatrix();
  }

  if (mousePressed) {
    for (int b=0; b<width; b+=2)
    {
      pushMatrix();
      stroke(200, 200, 0);
      float ver = sin(millis()/100.0+b)*10;
      line (b, 0, b+ver, -70);
      stroke(200, 0, 0);
      line (b, 0, b+5+ver, -70);
      popMatrix();
    }

    for (int b=170; b<290; b+=4)
    {
      pushMatrix();
      translate(0, -280);
      stroke(200, 200, 0);
      float ver = sin(millis()/100.0+b)*10;
      line (b, 100, b+ver, -30);
      stroke(200, 0, 0);
      line (b, 100, b+5+ver, -30);
      popMatrix();
    }
  }
}

void mouseReleased() {
  if (gras == color(11, 149, 25) && stamm == color(149, 89, 11) && stroke1 == color(0)){
    gras = color(0);
    stamm = color(0);
    stroke1 = color (255);
  } else {
    gras = 0;
  } 

}

