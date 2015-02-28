
//copyright Andrew Levandoski July 2 2013

void setup()
{
  size (400,400);
}

void draw()
{
  background(0, 0, 3);
  fill(16, 183, 227);
  stroke(255);
  strokeWeight(1);
  triangle(100,100,150,200,50,200);
  fill(22,147,180);
  quad(50,200,150,200,150,400,50,400);
  stroke(40,219,59);
  strokeWeight(4);
  line(105,100,200,100);
  line(105,100,155,200);
  line(155,200,250,200);
  line(225,200,250,200);
  line(175,150,225,150);
  line(225,150,250,200);
  fill(29,170,44);
  strokeWeight(1);
  stroke(255);
  quad(155,202,250,202,250,400,155,400);
  fill(240,233,29);
  quad(225,100,300,100,340,180,270,180);
  fill(175,168,25);
  quad(255,200,350,200,350,400,255,400);
}
