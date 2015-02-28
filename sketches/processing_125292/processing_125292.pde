
int x = 250;
int y = 250;
int c1 = 15;
int c2 = 15;
int c3 = 15;
void setup()
{
  size(500,500);
  background(255);


}

void draw() {
  //background(255);
  //stroke(0);
  fill(c1,c2,c3);
  ellipse(x,y,2,2);
  x += int(random(4)-2);
  y += int(random(4)-2);
  c1 += int(random(2));
  c2 += int(random(2));
  c3 += int(random(2));
  c1 = c1 % 255;
  c2 = c2 % 255;
  c3 = c3 % 255;
  //println(c1); 
  //  b.run();
//  b2.run();
//  for (int i=0; i < balls.size(); i++)
//  {
//    temp = (bounceItem) balls.get(i);
//    temp.run();
//  }
}




