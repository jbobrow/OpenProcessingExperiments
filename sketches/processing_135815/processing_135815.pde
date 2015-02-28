
float[] xpos = new float[1500];
float[] ypos = new float[1500];
float[] yspeed = new float[1500];




void setup() {
  size(700, 700);

  for (int i=0; i<xpos.length; i++) {
    xpos[i] = random(width);
    ypos[i] = -30;
    yspeed[i] = random(1., 2.);
  }
}

void draw() {
  noStroke();
  fill(0, 5);
  rect(0, 0, 700, 700);

  for (int i=0; i<ypos.length; i++) {
    ypos[i] += yspeed[i];
    
    strokeWeight(random(0.5, 1.));
    float r = map(xpos[i], 0, 700, 0, 255);
    float g = map(ypos[i], 0, 700, 0, 255);
    float b = random(50, 150);
    stroke(r, g, b);
    line(xpos[i]+random(0.1, 2.5), ypos[i], xpos[i]+random(0.1, 2.5), ypos[i]-20);
    if (ypos[i] > height+20/2) {
      ypos[i] = -30;
    }
  }
  
}

