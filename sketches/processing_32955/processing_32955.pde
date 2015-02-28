
float[] ballsize = new float[4]; 
float[] xpos = new float[4];
float[] ypos = new float[4];

float [] xspeed = new float [4];  ///speed shapex///
float [] yspeed = new float [4];  ///speed shapey///


float r = random(255); ///colour///
float g = random(255);
float b = random(255);

void setup() 
{
  size(800, 600);
  noStroke();
  frameRate(30); ///refreshrate///
  smooth();

  xpos[0] = 200;  ///posX index///
  xpos[1] = 400;
  xpos[2] = 500;
  xpos[3] = 600;

  ypos[0] = 150;  ///postY index///
  ypos[1] = 250;
  ypos[2] = 350;
  ypos[3] = 450;

  ballsize[0] = 90;  ///ballsize index///
  ballsize[1] = 150;
  ballsize[2] = 80;
  ballsize[3] = 60;

  xspeed[0] = random(10);
  xspeed[1] = random(20);
  xspeed[2] = random(30);
  xspeed[3] = random(40);

  for (int i=0; i<4; i++) {
    yspeed[i] = random(10);
  }
}

void draw() 
{
  background(204, 255, 255);

  ///speed refresh///
  for (int i=0; i<4; i++) {
    xpos[i] = xpos[i] + xspeed[i];
    ypos[i] = ypos[i] + yspeed[i];
    
     if (xpos[i] > (width-ballsize[0]) || xpos[i] < 0) {
     xspeed[i] *= -1;
     r = random(255);  ///colourX///
     g = random(255);
     b = random(255);
    }
    if (ypos[i] > (height-ballsize[0]) || ypos[i] < 0) {
     yspeed[i] *= -1;
     r = random(255);  ///colourY///
     g = random(255);
     b = random(255);
    }
      ///mouserepel///
    if (dist(mouseX, mouseY, xpos[i], ypos[i]) < 50) {
    xspeed[i] *= -1;
    yspeed[i] *= -1;
  }
    
  }

  ///ellipse///
  fill(r, g, b);
  for (int i=0; i<4; i++) {
    ellipse(xpos[i], ypos[i], ballsize[i], ballsize[i]);
  }
}


