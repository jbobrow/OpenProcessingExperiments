
float theta = 0;
void setup() {
  size(600, 600);
  background(255);
  smooth();
}

void draw() {
  fill(255);
  rect(0, 0, width, height);
  circle(300,300, 300, theta, 40);
  polygon(300, 300, 213, 4, -theta);
  rectMode(CENTER);
  rect(300, 300, 213, 213);
  
  for(int i = 0; i < 110; i+=5) {
    line(width/2+i, height/2, width/2, height/2 + (100-i));
    line(width/2+i, height/2, width/2, height/2 - (100-i));
    line(width/2-i, height/2, width/2, height/2 + (100-i));
    line(width/2-i, height/2, width/2, height/2 - (100-i));  
  }
  theta+=0.01;
  println(theta);
}

void circle(int x, int y, int size, float theta, int chordinten) {
  beginShape();
  for(float i = 0; i < 2 * PI; i += PI/180)  {
      vertex(x + size*cos(i), y + size*sin(i));
      stroke(0);
  }
  endShape();
  for(float i = 0; i < 2 * PI; i += PI/chordinten)  {
    line(x + size*cos(i + theta), y + size*sin(i + theta),x + size*cos(i + PI/2 + theta), y + size*sin(i + PI/2 + theta));
  }
  
}

void polygon(int x, int y, int size, int sides, float rot)
{
  float distToNextPoint = (2*PI)/sides;
  
  beginShape();
  for(int i = 0; i < sides; i++)
  {
    vertex(x + size * cos(rot), y + size *  sin(rot));
    rot = rot + distToNextPoint;
  }
  endShape(CLOSE);
}

