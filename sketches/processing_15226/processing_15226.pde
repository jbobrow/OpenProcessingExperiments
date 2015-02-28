
//MODULATE AND CUSTOM FUNCTION EXERCISE

//UCLA Design|Media Arts
//Interactivity 28 Fall 2010
//by Stephen Ou


color c1 = #B71818;
color c2 = #FFFFFF;
color c3 = #000000;
int card = 0;

void setup()
{
  size(600, 600);
  smooth();
  background(0);

  drawTree(c2, c3,int( random(3,13)), 100,100, random(1,10)*5,random(1,6)*5);
  drawTree(c1, c2,int( random(3,13)), 300,100, random(1,10)*5,random(1,6)*5);
  drawTree(c3, c1,int( random(3,13)), 500,100, random(1,10)*5,random(1,6)*5);
  drawTree(c3, c2,int( random(3,13)), 100,300, random(1,10)*5,random(1,6)*5);
  drawTree(c2, c1,int( random(3,13)), 300,300, random(1,10)*5,random(1,6)*5);
  drawTree(c1, c3,int( random(3,13)), 500,300, random(1,10)*5,random(1,6)*5);
  drawTree(c2, c3,int( random(3,13)), 100,500, random(1,10)*5,random(1,6)*5);
  drawTree(c1, c2,int( random(3,13)), 300,500, random(1,10)*5,random(1,6)*5);
  drawTree(c3, c1,int( random(3,13)), 500,500, random(1,10)*5,random(1,6)*5);
}

void draw()
{
  //  drawTree(c1, 3, mouseX, mouseY, 5, 5);
}

void mousePressed()
{
  background(0);

  drawTree(c2, c3,int( random(3,13)), 100,100, random(1,10)*5,random(1,6)*5);
  drawTree(c1, c2,int( random(3,13)), 300,100, random(1,10)*5,random(1,6)*5);
  drawTree(c3, c1,int( random(3,13)), 500,100, random(1,10)*5,random(1,6)*5);
  drawTree(c3, c2,int( random(3,13)), 100,300, random(1,10)*5,random(1,6)*5);
  
  pushMatrix();
  translate(600, 600);
  rotate(radians(180));
  drawTree(c2, c1,int( random(3,13)), 300,300, random(1,10)*5,random(1,6)*5);
  popMatrix();
  
  drawTree(c1, c3,int( random(3,13)), 500,300, random(1,10)*5,random(1,6)*5);
  drawTree(c2, c3,int( random(3,13)), 100,500, random(1,10)*5,random(1,6)*5);
  drawTree(c1, c2,int( random(3,13)), 300,500, random(1,10)*5,random(1,6)*5);
  drawTree(c3, c1,int( random(3,13)), 500,500, random(1,10)*5,random(1,6)*5);
}


void drawTree(color c, color b, int w, int xpos, int ypos, float xoff, float yoff)
{
  //grid
  noStroke();
  fill(b);
  rectMode(CENTER);
  rect(xpos, ypos, 200,200);

  stroke(c);
  strokeWeight(w);
  strokeCap(SQUARE);
  //top cap
  strokeJoin(MITER);
  beginShape();
  vertex(xpos-2*xoff, ypos-yoff);
  vertex(xpos, ypos-3*yoff);
  vertex(xpos+2*xoff, ypos-yoff);
  endShape();
  //middleleft
  line(xpos, ypos-2*yoff, xpos-2*xoff, ypos);
  //middleright
  line(xpos, ypos-2*yoff, xpos+2*xoff, ypos);
  //bottomleft
  line(xpos, ypos-yoff, xpos-2*xoff, ypos+yoff);
  //bottomright
  line(xpos, ypos-yoff, xpos+2*xoff, ypos+yoff);
  //trunk
  line(xpos, ypos-3*yoff, xpos, ypos+3*yoff);

  //circle
  noFill();
  ellipse(xpos, ypos+3*yoff, yoff+10, yoff+10);
}


