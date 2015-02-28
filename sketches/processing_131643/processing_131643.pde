
// hw #5
// copyright eunkic

// mouse left click to increase the speed, right to decrease

// initial point
float initialPoint;

// figure 1 (small star)
float x1, y1, d1, speed1;

// figure 2 (big star) 
float x2, y2, d2, speed2;

// colors
color bgc, c1, c2;


void setup( ) 
{
  size (400, 400);
  background (43, 105, 157);
  
  initialPoint = 50;
  
  x1 = initialPoint;
  y1 = initialPoint;
  x2 = width - initialPoint;
  y2 = height - initialPoint;
  
  d1 = 2.5;
  d2 = 5;
  
  speed1 = 5;
  speed2 = 2.5;
  
  bgc = color (43, 105, 157);
  c1 = color (255, 210, 0, 200);
  c2 = color (182, 255, 0, 100);
  
}

void draw( )
{
  prepareWindow( );
  moveFigure( );
  drawFigure( );
}

void prepareWindow () {
  fill(bgc, 20);
  rect( 0, 0, width, height);
}

void moveFigure () {

  // figure 1 (small star)
  // top-left to top-right
  if (y1 <= initialPoint)
  {
    y1 = initialPoint;
    x1 += speed1;
  }
  // top-right to bottom-right
  if (x1 >= (width-initialPoint))
  {
    x1 = width - initialPoint;
    y1 += speed1;
  }
  // bottom-right to bottom-left
  if (y1 >= (height-initialPoint))
  {
    y1 = height - initialPoint;
    x1 -= speed1;
  }
  // bottom-left to top-left
  if (x1 <= initialPoint)
  {
    x1 = initialPoint;
    y1 -= speed1;
  }
  
  // figure 2 (large star)
  // bottom-right to bottom-left
  if (y2 >= (height-initialPoint))
  {
    y2 = height - initialPoint;
    x2 -= speed2;
  }
  // bottom-left to top-left
  if (x2 <= initialPoint)
  {
    x2 = initialPoint;
    y2 -= speed2;
  }  
  // top-left to top-right
  if (y2 <= initialPoint)
  {
    y2 = initialPoint;
    x2 += speed2;
  }
  // top-right to bottom-right
  if (x2 >= (width-initialPoint))
  {
    x2 = width - initialPoint;
    y2 += speed2;
  }
}

void drawFigure () {
  figure (x1, y1, d1, c1);
  figure (x2, y2, d2, c2);
}

void figure (float x, float y, float d, color c) {
  fill (c);
  noStroke ();
  beginShape();
  vertex(x, y-10*d);
  vertex(x+3*d, y-4*d);
  vertex(x+9*d, y-3*d);
  vertex(x+4*d, y+d);
  vertex(x+6*d, y+8*d);
  vertex(x, y+5*d);
  vertex(x-6*d, y+8*d);
  vertex(x-5*d, y+d);
  vertex(x-10*d, y-3*d);
  vertex(x-3*d, y-4*d);
  endShape(CLOSE);
}

void mousePressed() {
  if (mouseButton == LEFT) 
  {
    speed1 ++;
    speed2 ++;
  } 
  else if (mouseButton == RIGHT) 
  {
    speed1 --;
    speed2 --;
  }
}

//void mouseWheel(MouseEvent event) {
  //float e = event.getAmount();
  //println(e);
  //e = constrain (e, -5, 5);
  //speed1 = constrain (speed1, -10, 10);
  //speed2 = constrain (speed2, -10, 10);
  //if (e > 0)
  //{
  //speed1 ++;
  //speed2 ++;
  //}
  //else if (e < 0) {
  //speed1 --;
  //speed2 --;
  //}
//}





