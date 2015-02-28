
void setup()
{
  smooth();
  size(300, 300);
  faceDrawing(width/2, height/2, 150);
}
void draw()
{
  if (mousePressed) {

    fill(255, random(125,255), random(0, 255));
    ellipses(width/2, height/2);
    
  }
}

void ellipses(int x, int y)
{
  stroke(255);
  ellipse(x-40, y, 30, 15);
  ellipse(x+40, y, 30, 15);
}


void faceDrawing(int a, int b, int size)
{
  stroke(255);
  fill(255);
  ellipse(a, b, size, size); // 얼굴 형

  fill(0);
  triangle( a+10, b+10, a, b-5, a-10, b+10); //nose

  fill(255, 100, 0);
  arc(a, b+25, 30, 30, 0, PI);  // 입

  fill(0);
  ellipse(a-30, b-30, 10, 10);
  stroke(0);
  line(a+20, b-28, a+45, b-35);
  line(a+20, b-28, a+45, b-20); // 눈
}
