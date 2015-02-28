
float [] x= new float[100];
float [] y= new float[100];

float centerX= 250;
float centerY= 250;


void setup() {
  size (500, 500);
  int i =0;
  while (i<100) {
    x[i] = 250;
    y[i] = 250;   
    i=i+1;
  }
}

void draw() {
  background(0);

  float R = random (0);
  float G = random (100, 150);
  float B= random (100, 200);
  fill (R, G, B);
  noStroke();
  if (mousePressed == true) {
    float r =random(-10, 10);

    int i =0;
    while (i<100) {
      x[i]= x[i] + ((mouseX-x[i]) / (5.0 + (i*5.0) ));
      y[i]= y[i] + ((mouseY-y[i]) / (5.0 + (i*5.0) ));

      i=i+1;
    }

    //    for(int i =0; i<100; i++){
    //      x[i]= x[i] + ((mouseX-x[i]) / (5.0 + (i*5.0) ));
    //      y[i]= y[i] + ((mouseY-y[i]) / (5.0 + (i*5.0) ));
    //    }

    int newcirc = 0;
    int arms=7;
    centerX=centerX+((mouseX-centerX)/50.0);
    centerY=centerY+((mouseY-centerY)/50.0);

    while (newcirc<arms) {
      pushMatrix();
      translate(centerX, centerY);
      rotate((TWO_PI/arms)*newcirc);
      translate(-centerX, -centerY);

      i =0;
      while (i<100) {
        ellipse (x[i], y[i], r, r);
        i=i+1;
      }

      popMatrix();

      newcirc=newcirc+1;
    }

    ellipse(mouseX, mouseY, r, r);
  }
}


