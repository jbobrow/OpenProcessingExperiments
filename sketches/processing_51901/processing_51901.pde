
int i = 0;
int numpoints;
color white = color(255, 255, 255);
color black = color(0, 0, 0);
int now = 0;
//m is spacce in between lines
float m = 130;
//import processing.opengl.*;
//ellipse and rectangle size
int er = 100;





void setup() {
  frameRate(1000);
  size(screenWidth, screenHeight, P3D);
  background(0);
 smooth();
}

void draw() {

  fill(random(190), 0, random(190), random(100));
  noStroke();
  rect(width-1, height-1, 1, 1);


  if (keyPressed)
  {
    if ( key == 'c' || key == 'C') {
      background(0);
    }
  }

  int s = second ();

  if (s != 59)
  {
    drawlineleft();
    drawlineright();
    //drawlineleftt();
  }
}

void drawlineleft() {

  for
    (int h = 0; 
  h < height; 
  h++)
  { 
    for 
      ( int w = 0; 
    w < width; 
    w++)
    { 
      if
        ( get(w, h) != (black))

      {

        stroke(30, random(150), random(200));

        //add disolving particles
        if (keyPressed)
        {
          if ( key == 's' || key == 'S') {
            translate(width, height);
            rotate(PI/2.0);
          }
        }

        point(w, h-m);
        point(w-m, h);
         point(w+m,h);
         point(w, h+m);
      }
    }
  }
}

void drawlineright()
{   

  //glitchy malfunction...
  if (keyPressed)
  {
    if ( key == 'b' || key == 'B') {
      filter(ERODE);
    }
  }


  for
    //(int h = 0;  h > height;  h++)
    (int h = height;  h < height;  h--)


  { 
    for 
     // ( int w = 0;  w > width; w++)
      ( int w = width;  w < width; w--)

    { 
      if
        ( get(w, h) != (black))

      {

        stroke(random(0), random(190), random(190));

        point(w, h+m);
        point(w+m, h);
      }
    }
  }
}
void mouseDragged()

{
  stroke(10);
  line(mouseX, mouseY, pmouseX, pmouseY);
  //line(width-mouseX, height-mouseY, width-pmouseX, height-pmouseY);
  //line(mouseX, height-mouseY, pmouseX, height-pmouseY);
  //line(width-mouseX, mouseY, width-pmouseX, pmouseY);
  //hold e and the mouse, let go of e first then the mouse, draw ellipses
  {   
    if (keyPressed)
    {
      if ( key == 'e' || key == 'E') {
        fill(0);
        ellipse(mouseX, mouseY, er, er);
      }
      //hold r and the mouse, let go of r first then mouse, draw rectangles
      {   
        if (keyPressed)
        {
          if ( key == 'r' || key == 'R') {
            fill(0);
            rect(mouseX, mouseY, er, er); }
        }
      }
       {   
        if (keyPressed)
        {
          if ( key == 't' || key == 'T') {
            fill(0);
            triangle(mouseX, mouseY, mouseX+er, mouseY+er, mouseX-er, mouseY+er); }
        }
    }
  }
  }}


