
/*
nb ellipses are drawn, they move along x, y and z
 */
int nb;
ArrayList<Circle> circles = new ArrayList<Circle>();
final float sphereRad = 120;
float zTheta, zThetaSpeed, zZoomTheta;
float xTheta, xThetaSpeed, xAmplitude, xZoomTheta;
float yTheta, yThetaSpeed, yAmplitude, yZoomTheta;

void setup()
{
  size(400, 400, OPENGL);
  //  noFill();
  fill(20, 115);
  stroke(20, 40);
  initialize();
  for (int i = 0; i < nb; i++)
  {
    circles.add(new Circle());
  }
}

void initialize()
{
  nb = (int)random(120, 300);//number of circles
  xTheta = random(TWO_PI);//x ondulation
  yTheta = random(TWO_PI);//y ondulation
  zTheta = random(TWO_PI);//vertical ondulation
  xThetaSpeed = random(.02, .15) * (random(1)<.5 ? 1 : -1);//x ondulation speed
  yThetaSpeed = random(.02, .15) * (random(1)<.5 ? 1 : -1);//y ondulation speed
  zThetaSpeed = random(.01, .03) * (random(1)<.5 ? 1 : -1);//vertical ondulation speed
  xAmplitude = xAmplitude == 0 ? 0 : random(60);//x amplitude
  yAmplitude = yAmplitude == 0 ? 0 : random(60);//y amplitude
  xZoomTheta = random(12, 40);//number of x ondulations
  yZoomTheta = random(12, 40);//number of y ondulations
  zZoomTheta = random(10, 120);//number of vertical ondulations
}

void draw()
{
  lights();
  smooth();
  background(133, 26, 205);
  xTheta += xThetaSpeed;
  yTheta += yThetaSpeed;
  zTheta += zThetaSpeed;
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, PI, -PI));
  rotateX(HALF_PI + map(mouseY, 0, height, -PI, PI));
  for (Circle c : circles)
  {
    c.display();
  }
}

void keyPressed()
{
  if (key != CODED)
  {
    switch(key)
    {
    case 'r'://reset random
      initialize();
      break;
    case 'x'://toggle x and y ondulations
      xAmplitude = xAmplitude > 0 ? 0 : random(60);
      yAmplitude = yAmplitude > 0 ? 0 : random(60);
      break;
    }
  }
}

class Circle
{
  float r, x, y, z = random(-sphereRad, sphereRad), radCoeff = 1;
  float speed = random(.12, .44) * (random(1)<.5 ? 1 : -1);
  
  void display()
  {
    x = xAmplitude * cos(xTheta + z/xZoomTheta);
    y = yAmplitude * cos(yTheta + z/yZoomTheta);
    z += speed;
    if (abs(z) > sphereRad)
      z *= -1;
    
    radCoeff = abs(cos(zTheta + z/zZoomTheta));
    
    stroke(176, map(z, -sphereRad, sphereRad, 26, 135), map(z, -sphereRad, sphereRad, 98, 26), 75);
    r = sqrt(sphereRad*sphereRad - z*z);
    pushMatrix();
    translate(x, y, z);
    ellipse(0, 0, 2*radCoeff*r, 2*radCoeff*r);
    popMatrix();
  }
}



