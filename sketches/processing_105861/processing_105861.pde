
int number=100;
float[] xPos = new float[number]; //xPosition
float[] yPos = new float[number]; //yPosition
float[] radius = new float[number]; //radius
float[] sx = new float[number]; //speed of x
float[] sy = new float[number]; //speed of y
float[] h = new float[number];
float[] s = new float[number];
float[] b = new float[number];
float[] o = new float[number];

float g=0.95; //gravity

void setup() {
  size (500, 500);
  colorMode (HSB);

  //set random variables

  //number=int(random(500));

  for (int i=0; i<number; i++) {
    radius[i]=random(width/4);
    xPos[i]=random(width-radius[i]);
    yPos[i]=random(height-radius[i]);
    sx[i]=random(50);
    sx[i]=random(50);
    h[i]=random(255);
    s[i]=random(255);
    b[i]=random(255);
    o[i]=random(125);
  }

  for (int i=0; i<number; i++) {
    fill(h[i], s[i], b[i], o[i]);
    ellipse(xPos[i], yPos[i], radius[i], radius[i]);
  }
}

void draw() {
  background(255);

  for (int i=0; i<number; i++) {
    sy[i]=sy[i]+g;
    fill(h[i], s[i], b[i], o[i]);
    ellipse(xPos[i]+=sx[i], yPos[i]+=sy[i], radius[i], radius[i]);

    // change x direction 
    if ((xPos[i]>=width-radius[i]/2) || (xPos[i]<=0+radius[i]/2)) {
      sx[i]=sx[i]*-1;
    }
    // change y direction 
    if ((yPos[i]>=height-radius[i]/2) || (yPos[i]<=0+radius[i]/2)) {
      sy[i]=sy[i]*-1;
      sx[i]=sx[i]+g;
    }

    if ((yPos[i]>=height-radius[i]/2)&&(sy[i]<=0)) {
      yPos[i]=height-radius[i]/2;
      xPos[i]-=sx[i];
    }
  }
}



