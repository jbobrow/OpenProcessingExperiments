
void setup () {
  size(800, 800);
}
float n1 = 20;
float n2 = 50;
float q = random(0,8);
float r1 = random(50, 250);
float g1 = random(50, 250);
float b1 = random(50, 250);
float x = 400;
float y = 400;

void draw() {


      float circle1 = random (20, 30);
      float circle2 = random(5, 15);


      strokeWeight(1);
      fill(n1+r1, n2+g1, b1);
      rect(x-37, y-37, 75, 75);
      fill(232, n2+21, n1+35);
      ellipse(x, y, circle1, circle1);
      strokeWeight(3);
      line(x, y-45, x, y-90);
      strokeWeight(1);
      fill(0+n1, 109, 240);
      arc(x+1, y-37, 75, 75, PI, 2*PI);
      triangle(x-37, y-33, x-37, y+30, x-70-q, y+30);
      triangle(x+38, y-33, x+38, y+30, x+70+q, y+30);
      quad(x-34, y+38, x-22, y+38, x-15-q, y+60, x-42-q, y+60);
      quad(x+34, y+38, x+22, y+38, x+15+q, y+60, x+42+q, y+60);
      fill(255);
      ellipse(x-22, y-50, 8, 8);
      ellipse(x+22, y-50, 8, 8);
      strokeWeight(3);
      line(x-18, y-42, x+18, y-42);
      strokeWeight(1);
      fill(n1+232, n1+21, n2+35);
      ellipse(x, y-95, circle2, circle2);
    }



void mousePressed () {
  r1 = random(50, 250);
  g1 = random(50, 250);
  b1 = random(50, 250);
  n1 = random(1, 200);
  n2 = random(1, 200);
  q = random(0,10);
  x = mouseX;
  y = mouseY;
}
