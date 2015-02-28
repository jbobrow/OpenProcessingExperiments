
// collaborative effort with Pierce 

size(400, 400);
background(0);

int xpos;
int ypos;

int interval;
int gradientWidth;
int gradientHeight;

gradientWidth = width;
gradientHeight = height;

xpos = width/2;
ypos = width/2;

interval = 255/ 5;

noStroke();

for (float i = 0; i < 4; i = i + .05) {
  fill(interval*(i+1));
  ellipse(xpos, ypos, gradientWidth - interval * i, gradientHeight - interval * i);
}


