
/**
  hexagonMouse made by Cym - Wednesday, December 2, 2009
   
  A simple sketch by Cym - http://cymspace.net/
 
  hexagonMouse is a little exercise to draw a hexagon, to fill up a
  background with a pattern of hexagons and to make a mouseover hexagon
 
  the idea was simple, but not so easy to realize
  a hexagon really is a shape made out of six equal triangles
  I did all the calculations using the dimensions of these triangles
 
  there is still one bug in the code:
  if you swap the two lines in void draw(), the mouseOver hexagon disappears
 
  if the code is like this it shows only the background pattern, not the mouseOver:
  
  void draw() {
    drawBackgroundHexagons(a,b,c);
    drawMouseHexagon(a,b,c);
  }
 
  it also doesn't make a difference if the code is put inside a
  void mouseMoved() instead of in void draw()
 
  and if the backgroundHexagons aren't semi-transparent, the mouseOver hexagon
  also disappears...
  
  (change: fill(255,245,170,15); to: fill(255,245,170,255); on line 75)
*/


/* hexagonSize: change this number to change the size of the pattern */
float hexagonSize = 28;

float a, b, c;

void setup() {
  frameRate(15);
  size(640,480);
  background(255,245,170);
  
  /* calculate the dimensions of the hexagon for the given hexagonSize */
  /* create the hexagon using the simple formula: a2 + b2 = c2 */
  c = hexagonSize;
  b = hexagonSize/2;
  a = sqrt((c*c)-(b*b));

}

void draw() {
  drawMouseHexagon(a,b,c);
  drawBackgroundHexagons(a,b,c);
}

void drawHexagon(float a, float b, float c) {
  /* draw the hexagon */
  beginShape();
  vertex(-b, -a);
  vertex(b, -a);
  vertex(c, 0);
  vertex(b, a);
  vertex(-b, a);
  vertex(-c, 0);
  endShape(CLOSE);
}

void drawBackgroundHexagons(float a, float b, float c) {

  int i = 1;
  int j = 1;
  int k = 1;

  stroke(0);
  fill(255,245,170,15);

  for (k=1; k<=((height/(2*a))+1); k++) {  
    for (j=1; j<=2; j++) {
      for (i=1; i<=((width/(3*c))+3); i++) {
        drawHexagon(a,b,c);
        translate(c*3,0);
      }
      translate(-(i*c*3),0);
      translate(c+b,a);
    }
    translate(3*c,0);
  }
}

void drawMouseHexagon(float a, float b, float c) {
  
  boolean drawHexagon = false;
  boolean odd = false;
  
  float startX = 0;
  float startY = 0;
  float transX = 0;
  float transY = 0;

  for (float i=c; i<=(width+c); i=i+(c*3)) {
    if(mouseX > (i) && mouseX < (i+c)) {
      startX = mouseX%(c*3);
      startY = mouseY%(a*2);
      transX = mouseX-startX;
      transY = mouseY-startY;
      odd = true;
      drawHexagon = true;
    }
  }
  
  if (drawHexagon==false) {
    for (float i=-(c/2); i<=(width+c); i=i+(c*3)) {
      if(mouseX > (i) && mouseX < (i+c)) {
        startX = (mouseX+c)%(c*3);
        startY = (mouseY+a)%(a*2);
        transX = mouseX-startX;
        transY = mouseY-startY;
        odd = false;
        drawHexagon = true;
      }
    }
  }

  if (drawHexagon==true) {
    
    stroke(0);
    fill(255,174,0);
    
    if (odd==true) {
      translate(c*1.5,a);
    } else {
      translate(c,a);
    }

    translate(transX,transY);
    drawHexagon(a,b,c);
    translate(-transX,-transY);
    
    if (odd==true) { 
      translate(-(c*1.5),-a);
    } else {
      translate(-c,-a);
    }
    drawHexagon = false;    
  }  
}

