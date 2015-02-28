
float angle;
float[] xPos= new float[40];
float[] yPos= new float[40];
float[] colors= new float[40];
float[] xVel= new float[40];
float[] yVel= new float [40];


void setup() {
  size(500, 500, P3D);
  smooth();
  for (int i=0; i<40; i++) {
    xPos[i]= random(0, 500);
    yPos[i]= random(0, 500);
  }

  for (int i= 0; i<40; i++) {
    xVel[i] = random(-5, 2);
    yVel[i] = random(-5, 2);
    colors[i] = int(random(0, 4));
  }

  angle= 0;
}

void draw() {
  background(0,0,0,20);
  angle+=.05;

  for (int i= 0; i<40; i++) {
    xPos[i]= xPos[i] + xVel[i];
    yPos[i]= yPos[i] + yVel[i];

    ellipse(xPos[i], yPos[i], 20, 20);

    if ((xPos[i]> width ||(xPos[i]< 0))) {
      xVel[i]= xVel[i] *-1;
    }

    if ((yPos[i]> height ||(xPos[i]< 0))) {
      yVel[i]= yVel[i] *-1;
    }



    // fill(255);
    ellipse(xPos[i], yPos[i], 20, 20);
  }

  for (int i=0; i<40; i++) {
    if (dist(xPos[i], yPos[i], width/2, height/2)<20) {
      if (colors[i]==0) {
        fill(146, 39, 143, 50);
        println("true");
      } 
      else if (colors[i] == 1) {
        fill(0, 255, 0, 50);
      } 
      else if (colors[i] == 2) {
        fill(255, 242, 0, 50);
      } 
      else if (colors[i] == 3) {
        fill(236, 0, 140, 50);
      }
      else if (colors[i] == 4) {
        fill(20, 181, 73, 50);
      }
    }
  }

  pushMatrix();
  translate(width/2, height/2);
  rotateZ(angle);
  ellipse(0, 0, 10, 10);
  ellipse(-50, 0, 90, 20);
  ellipse(50, 0, 90, 20);
  ellipse(0, -50, 20, 90);
  ellipse(0, 50, 20, 90);
  popMatrix();
}


