
int numberEllipse = 10;

float[] xPos = new float [numberEllipse];
float[] yPos = new float [numberEllipse];
float[] xSpeed = new float [numberEllipse];
float[] ySpeed = new float [numberEllipse];
float[] circRad = new float [numberEllipse];
float[] circDist = new float [numberEllipse];



void setup() {
  size(400, 400);
  smooth();
  color(0);
  noStroke();
  frameRate(30);

  for (int i = 0; i < numberEllipse; i++) {
    xPos[i] = random(width);
    yPos[i] = random(height);
    xSpeed[i] = 1.5;
    ySpeed[i] = 1.3;
    circRad[i] = 12;
  }
}
void draw() {

  background(0);
  PImage myImage = loadImage("ahh_my_eyes400x400.jpg");
  imageMode(CENTER);
  image(myImage, width/2, height/2);     

  for (int i = 0; i < numberEllipse; i++) {
    for (int j = 0; j < numberEllipse; j++) {
      if (i!=j) {

        // Speed
        xPos[i] = xPos[i] + xSpeed[i];
        yPos[i] = yPos[i] + ySpeed[i];


        // Boundary Detection---------------------------------------------------
        if (xPos[i] <= circRad[i] || xPos[i] > width/* - circRad[i]*/) {
          xSpeed[i] *= -1;
        }


        if (yPos[i] <= circRad[i] || yPos[i] > height /*- circRad[i]*/) {
          ySpeed[i] *= -1;
        }

        //Collision detection       
        circDist[i]= dist(xPos[i], yPos[i], xPos[j], yPos[j]);
        if (circDist[i] <= circRad[i] + circRad[j]) {
          xSpeed[i] *= -1;
          ySpeed[i] *= -1;
        }
      }
    }
  }

  for (int i = 0; i < numberEllipse;i++) {
    fill(255);
    ellipse(xPos[i], yPos[i], circRad[i], circRad[i]);
  }
}


