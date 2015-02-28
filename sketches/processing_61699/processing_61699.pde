
void setup()
{
  size(300, 300);
}
void draw()
{
  faceDrawing(width/2, height/2);
  
   if (dist(width/2, height/2, mouseX, mouseY)<50)
   {
     faceDraw2(width/2, height/2);
   }
   
   if (dist(width/2, height/2, mouseX, mouseY)>50)
   {
     faceDrawing(width/2, height/2);
   }
}

void faceDrawing(int a, int b)
{
  background(128);
  
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(a, b, 100, 100);

  ellipse(a-20, b-30, 20, 20);
  ellipse(a+20, b-30, 20, 20);

  fill(0);
  ellipse(a-20, b-30, 5, 5);
  ellipse(a+20, b-30, 5, 5);

  noFill();
  arc(a, b, 30, 30, 0, PI);
  arc(a, b+20, 30, 30, 0, PI);

  line(a-16, b, a-16, b+20);
  line(a+16, b, a+16, b+20);
}

void faceDraw2(int a, int b)
{
    fill(random(0, 255), random(0, 255), random(0, 255));
    ellipse(a, b, 100, 100);
    triangle(a-20, b-50, a, b-100, a+20, b-50);

    ellipse(a-20, b-30, 20, 20);
    ellipse(a+20, b-30, 20, 20);

    fill(0);
    ellipse(a-20, b-30, 5, 5);
    ellipse(a+20, b-30, 5, 5);

    noFill();
    arc(a, b, 30, 30, 0, PI);
    arc(a, b+20, 30, 30, 0, PI);

    line(a-16, b, a-16, b+20);
    line(a+16, b, a+16, b+20);
  }
