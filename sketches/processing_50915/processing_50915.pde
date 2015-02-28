
//target drawing program
// copyright benjamin corwin 2012
  float x;
  float y;
  float o;
  float wdth;
  float hght;

void setup()
{
  size ( 400, 400);
  background(#00AA72);
  noStroke();
  smooth();

  o = 15;
  wdth = 50;
  hght = 50;
}

void draw()
{
  fill(#00AA72,o);
  noStroke();
  rect(0, 0, width, height);
  drawbgc(mouseX, mouseY, wdth, hght);

}


//void drawTarget( int x, int y, int d)
// same as
void drawbgc ( float x, float y, float wd, float ht)
{
  
  //background(#00AA72);
  fill(#FF5600);
  stroke(#FF5600);
  strokeWeight(7.5 * abs(wd + ht)/200);
  ellipse(x, y, 1.925 * wd, 1.925 * ht);
  noFill();
    //g
  stroke(#FF9900);
  beginShape();
    curveVertex(x + .5 * wd, y - .2 * ht);
    curveVertex(x + .5 * wd, y - .1 * ht);
    curveVertex(x + .5 * wd, y + .1 * ht);
    curveVertex(x + .5 * wd, y + .5 * ht);
    curveVertex(x + .3 * wd, y + .75 *ht);
    curveVertex(x + .0 * wd, y + .85 *ht);
    curveVertex(x - .3 * wd, y + .75* ht);
    curveVertex(x - .5 * wd, y + .5 * ht);
    curveVertex(x - .5 * wd, y + .0 * ht);
    endShape();
  ellipse(x, y, wd, ht);

  //outline
    //c
  stroke(#5fa2b9);
  strokeWeight(12.5 * abs(wd + ht)/200);
  arc(x + .525 * wd, y, .9 * wd, .9 * ht, PI/4, TWO_PI-PI/4);
    //b
  ellipse(x - .475 * wd, y, .9 * wd, .9 * ht);
  arc(x, y, 1.85 * wd, 1.85 * ht, PI, TWO_PI-2*PI/3);
  //inside
    //c
  stroke(#0d5872);
  strokeWeight(6.5 * abs(wd + ht) / 200);
  arc(x + .525 * wd, y, .9 * wd, .9 * ht, PI/4, TWO_PI-PI/4);
    //b
  ellipse(x - .475 * wd, y, .9 * wd, .9 * ht);
  arc(x, y, 1.85 * wd, 1.85 * ht, PI, TWO_PI-2*PI/3);
}
void keyPressed()
{
  if ( keyCode == ' ')
  {
    o = o + 3;
  }
  if ( keyCode == 'b')
  {
    o = 0 - 3;
  }
  if ( keyCode == UP)
  {
    hght = hght + 5;
  }
   
   if ( keyCode == DOWN)
  {
    hght = hght - 5;
  }
   
  if (keyCode == LEFT)
  {
    wdth = wdth - 5;
  }
   
  if ( keyCode == RIGHT)
  {
    wdth = wdth + 5;
  }
  
}
                                
