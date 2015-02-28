
        void setup()
{
  size(400, 600);
  background(0);
  smooth ();
//  noStroke();
  fill(19, 111, 8);
  triangle(width/2, 100, 50, 500, 350, 500);
  fill(88, 47, 6);
  rect(175, 500, 50, 75);
}
void draw()
{
  strokeWeight (3);
//  if (key=='s')
//  {
//    stroke(255);
//    point(mouseX, mouseY);
//  }
}

void mousePressed()
{
  strokeWeight(0);
  fill(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, 15, 15);
}
void keyPressed ()
{
  save ("snapshot.jpg");
}
       
                
