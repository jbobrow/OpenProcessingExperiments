
// Ethan Frier
// Homework 5 - figure function 
// Jnauary 29, 2013
// copywrite 2013


/*
 Jim's face follows the mouse.  change 'qwd' and 'qht' ot change scale of face
 Click the mouse to make Jim angry angry and use the 'a' and 's' keys to change
 hair color. 
 */


float qx, qy, qwd, qht;
color eyes;
color hair;
float hairvar;

void setup()
{
  size(400, 400);

  qx = 0;
  qy = 0;
  qwd = 200;
  qht = 200;

  smooth();

  hairvar = 200;
  eyes = color(0, 0, 0);
}


void draw ()
{
  fill(245, 229, 200);
  rect(0, 0, width, height);

  figure(mouseX, mouseY, qwd, qht);

  hair = color(hairvar);
}

void figure (float x, float y, float wd, float ht)
{
  //  fill(0);
  //  ellipse(fx, fy, fwd, fht);

  x = x - wd *.5;
  y = y - ht * .5;
  wd = 200;
  ht = 200;

  noFill();

  // Border rectangle
  //rect(x, y, wd, ht);

  strokeWeight(3);
  fill(255, 100);

  // Glasses left lens
  rect(x + wd * .15, y + ht * .45, wd * .3, ht * .2, 3, 0, 30, 20);

  // Glasses right lens
  rect(x + wd * .55, y + ht * .45, wd * .3, ht * .2, 0, 3, 20, 30);

  //Pupils

  fill(eyes);
  ellipse(x + wd * .3, y + ht * .55, wd * .05, ht * .05);
  ellipse(x + wd * .7, y + ht * .55, wd * .05, ht * .05);


  // Glasses nose bridge and 'F'
  noFill();
  line(x + wd * .45, y + ht * .45, x + wd * .45, y + ht * .6);
  line(x + wd * .45, y + ht * .45, x + wd * .55, y + ht * .45);
  beginShape();
  curveVertex(x + wd * .42, y + ht * .53);
  curveVertex(x + wd * .45, y + ht * .52);
  curveVertex(x + wd * .5, y + ht * .51);
  curveVertex(x + wd * .55, y + ht * .52);
  curveVertex(x + wd * .58, y + ht * .53);
  endShape();

  fill(hair);
  strokeWeight(1);

  // sexy stache
  beginShape();
  curveVertex(x + wd * .6, y + ht * .82);
  curveVertex(x + wd * .5, y + ht * .82);
  curveVertex(x + wd * .35, y + ht * .85);
  curveVertex(x + wd * .25, y + ht * .95);
  curveVertex(x + wd * .27, y + ht * .99);
  curveVertex(x + wd * .4, y + ht * .96);
  curveVertex(x + wd * .5, y + ht * .95);
  curveVertex(x + wd * .6, y + ht * .96);
  curveVertex(x + wd * .73, y + ht * .99);
  curveVertex(x + wd * .75, y + ht * .95);
  curveVertex(x + wd * .65, y + ht * .85);
  curveVertex(x + wd * .5, y + ht * .82);
  curveVertex(x + wd * .4, y + ht * .82);
  endShape(CLOSE);

  //Left eyebrow
  beginShape();
  curveVertex(x + wd * .4, y + ht * .35);
  curveVertex(x + wd * .32, y + ht * .35);
  curveVertex(x + wd * .21, y + ht * .39);
  curveVertex(x + wd * .23, y + ht * .42);
  curveVertex(x + wd * .32, y + ht * .4);
  curveVertex(x + wd * .39, y + ht * .41);
  curveVertex(x + wd * .42, y + ht * .39);
  curveVertex(x + wd * .4, y + ht * .36);
  curveVertex(x + wd * .32, y + ht * .35);
  curveVertex(x + wd * .29, y + ht * .35);
  endShape(CLOSE);

  //Right eyebrow
  beginShape();
  curveVertex(x + wd * .71, y + ht * .35);
  curveVertex(x + wd * .68, y + ht * .35);
  curveVertex(x + wd * .6, y + ht * .36);
  curveVertex(x + wd * .58, y + ht * .39);
  curveVertex(x + wd * .61, y + ht * .41);
  curveVertex(x + wd * .68, y + ht * .4);
  curveVertex(x + wd * .77, y + ht * .42);
  curveVertex(x + wd * .79, y + ht * .39);
  curveVertex(x + wd * .68, y + ht * .35);
  curveVertex(x + wd * .6, y + ht * .35);
  endShape(CLOSE);

  beginShape();
  curveVertex(x + wd * .6, y + ht * .24);
  curveVertex(x + wd * .5, y + ht * .25);
  curveVertex(x + wd * .25, y + ht * .28);
  curveVertex(x + wd * .15, y + ht * .35);
  curveVertex(x + wd * .1, y + ht * .55);
  curveVertex(x + wd * .08, y + ht * .6 );
  curveVertex(x + wd * .05, y + ht * .55);
  curveVertex(x + wd * .06, y + ht * .35);
  curveVertex(x + wd * .08, y + ht * .17);
  curveVertex(x + wd * .2, y + ht * .08);
  curveVertex(x + wd * .35, y + ht * .02);
  curveVertex(x + wd * .5, y + ht * .00);
  curveVertex(x + wd * .65, y + ht * .02);
  curveVertex(x + wd * .8, y + ht * .08);
  curveVertex(x + wd * .92, y + ht * .17);
  curveVertex(x + wd * .94, y + ht * .35);
  curveVertex(x + wd * .95, y + ht * .55);
  curveVertex(x + wd * .92, y + ht * .6 );
  curveVertex(x + wd * .9, y + ht * .55);
  curveVertex(x + wd * .85, y + ht * .35);
  curveVertex(x + wd * .75, y + ht * .28);
  curveVertex(x + wd * .5, y + ht * .25);
  curveVertex(x + wd * .4, y + ht * .24);
  endShape(CLOSE);
}


void mousePressed()
{
  eyes = color(255, 0, 0);
}


void mouseReleased( )
{
  eyes = color(0, 0, 0);
}


void keyPressed()
{
  if (key == 'a')
  {
    hairvar = hairvar + 10;
  }

  if (key == 's')
  {
    hairvar = hairvar - 10;
  }
}


