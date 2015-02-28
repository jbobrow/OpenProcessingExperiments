
float [] x= new float[100];
float [] y= new float[100];
float [] a= new float[100];
float [] b= new float[100];
float [] xdot= new float[500];
float [] ydot= new float[500];

float r = random (-250,250);
float r2 = random (-250,250);
float r3 = random (-250,250);

float centerX= 250;
float centerY= 250;
  //PImage back;


void setup() {
  size (500, 500);
  
    int count = 0;
  while (count<500){
  xdot[count] = random (500);
  ydot[count] = random (500);
  count = count+1;
  } 
  
  int i =0;
  //back = loadImage("photoshoped one.jpg");
  
  while (i<100) {
    x[i] = 250;
    y[i] = 250; 
    a[i] = r2;
    b[i] = r3;  
    i=i+1;
  }
}


void draw() {

  background(0);
  //this is a code for the flashing stars
  
  /*int count = 0;
  while (count<100){
  float xdot = random (500);
  float ydot = random (500);
  float R = random (0);
  float G = random (100, 150);
  float B= random (100, 200);
  fill (R, G, B);
  noStroke();
  ellipse (xdot, ydot, 2, 2);
  count = count+1;
  }*/
  
  int count = 0;
  while (count<500){
  float R = random (0);
  float G = random (100, 150);
  float B= random (100, 200);
  fill (R, G, B);
  noStroke();
  ellipse (xdot[count], ydot[count], 1, 1);
  count = count+1;
  }  
  
  //image(back, 0, 0);

  float R = random (0);
  float G = random (100, 150);
  float B= random (100, 200);
  fill (R, G, B);
  noStroke();
  if (mousePressed == true) {
    float r = 5;

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
        //ellipse (mouseX-a[i], mouseY-b[i], 2,2);
        i=i+1;
      }

      popMatrix();

      newcirc=newcirc+1;
    }

    ellipse(centerX, centerY, r, r);
  }
  
  
  else {

    float r = 5;
    float t = 5;
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
    //centerX=centerX+((mouseX-centerX)/50.0);
    //centerY=centerY+((mouseY-centerY)/50.0);

    while (newcirc<arms) {
      pushMatrix();
      translate(mouseX, mouseY);
      rotate((TWO_PI/arms)*newcirc);
      translate(-centerX, -centerY);

      i =0;
      while (i<100) {

        fill(R, G, B, t);
        ellipse (x[i], y[i], r, r);
        i=i+1;
      }

      popMatrix();

      newcirc=newcirc+1;
    }
    fill(R, G, B, t);
    ellipse(mouseX, mouseY, r, r);
  }
}
void mousePressed (){
  centerX=mouseX;
  centerY=mouseY;
}


