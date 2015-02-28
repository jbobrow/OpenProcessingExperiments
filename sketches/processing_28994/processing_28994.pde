
color currentcolor;

CircleButton circle1, circle2, circle3;

boolean locked = false;


void setup() {
  color buttoncolor = color(204);
  color highlight = color(153);
  ellipseMode(CENTER);
  circle1 = new CircleButton(30, 100, 100, buttoncolor, highlight);

  size(700, 600);
  background(255, 204, 0);
}
void draw() {
  int a = height/6;
  int b = width/7;
  stroke(126);
  for ( int c = 1; c <= 7; c++) {
    line( c*b, 0, c*b, height);
  }
  for (int c = 1; c<=6; c++) {
    line(0, c*a, width, c*a);
  }
}
class Button
{
  int x, y;
  int size;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;   

  void update() 
  {
    if (over()) {
      currentcolor = highlightcolor;
    } 
    else {
      currentcolor = basecolor;
    }
  }

  boolean pressed() 
  {
    if (over) {
      locked = true;
      return true;
    } 
    else {
      locked = false;
      return false;
    }
  }

  boolean over() 
  { 
    return true;
  }

  boolean overRect(int x, int y, int width, int height) 
  {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } 
    else {
      return false;
    }
  }

  boolean overCircle(int x, int y, int diameter) 
  {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } 
    else {
      return false;
    }
  }
}


class CircleButton extends Button
{ 
  CircleButton(int ix, int iy, int isize, color icolor, color ihighlight) 
  {
    x = ix;
    y = iy;
    size = isize;
    basecolor = icolor;
    highlightcolor = ihighlight;
    currentcolor = basecolor;
  }

  boolean over() 
  {
    if ( overCircle(x, y, size) ) {
      over = true;
      return true;
    } 
    else {
      over = false;
      return false;
    }
  }
}

