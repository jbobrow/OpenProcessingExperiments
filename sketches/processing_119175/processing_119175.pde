
float x = 580;
float y = 360;
float t = 0;
float dt = 0.01;
float G = 4*pow(PI,2);
float M = 100000;
float Pe = 10;
float Omega = 0;
float Ap = 10;
float e = 0;
float theta = 0;
float saveX = x+10;
float saveY = y;
float spaceX = x-10;
float spaceY = y;

float semiMajor(float e, float pe) {
  float a = pe / (1-e);
  return a;
}
float semiMinor(float a, float e) {
  float b = a*sqrt((1-pow(e, 2)));
  return b;
}
float r(float a, float e, float theta) {
  float r = a * (1-pow(e, 2))/(1+e*cos(theta));
  return r;
}
float dtheta(float theta, float e, float a) {
  float h = sqrt(a*(1-pow(e,2))*G*M);
  float r = r(a, e, theta);
  float dtheta = dt*h*pow(r,-2);
  return dtheta;
}

void orbit(float Fpe, float Fomega, float Fe, float Fx, float Fy, float FG, float FMass, float Ftheta) {
  noFill();
  stroke(255);
  pushMatrix();
  translate(Fx, Fy);
  rotate(Fomega);
  float Fa = semiMajor(Fe, Fpe);
  float Fb = semiMinor(Fa, Fe);
  float Frad = r(Fa, Fe, Ftheta);
  noFill();
  stroke(255);
  ellipse(Fa-Fpe, 0, Fa*2, Fb*2);
  noStroke();
  colorMode(HSB,360,100,100);
  fill(Frad/2,100,50);
  ellipse(-cos(Ftheta)*Frad, Frad*sin(Ftheta), 10, 10);
  colorMode(RGB,255,255,255);
  popMatrix();
}

void setup() {
  size(1080, 720);
}

void draw() {
  t += dt;
  e = (Ap-Pe)/(Ap+Pe);
  float a = Ap/(1+e);
  float P = 2*PI*sqrt(pow(a,3)/ (G*M));
  if (theta < 2*PI){
    theta += dtheta(theta, e, a);
  } else {
    theta = theta - 2*PI+dtheta(theta,e,a);
  }
  println(theta);
  //defining user inputs
  if (mousePressed){
    saveX = mouseX;
    saveY = mouseY;
  }
  if (keyPressed){
    if (key == ' ' || key == ' '){
      if (mouseY < y){
        Omega = -acos((mouseX-x)/dist(mouseX,mouseY,x,y));
      } else {
        Omega = acos((mouseX-x)/dist(mouseX,mouseY,x,y));
      }
      spaceX = mouseX;
      spaceY = mouseY;
    }
  }
  if (dist(saveX,saveY,x,y)<dist(spaceX,spaceY,x,y)){
    Pe = dist(saveX,saveY,x,y);
    Ap = dist(spaceX,spaceY,x,y);
  } else {
    Pe = dist(spaceX,spaceY,x,y);
    Ap = dist(saveX,saveY,x,y);
  }

  //actually drawing
  background(0,24,46);
  fill(242,159,2);
  noStroke();
  ellipse(x, y, 50, 50);
  // orbit arguments are as follows:
  // Pe, arg of Pe, e, center of mass x then y, G, Mass, theta?
  fill(95,62,1);
  orbit(Pe, Omega, e, x, y, G, M, theta);

  //Numeric readouts
  textSize(10);
  fill(190);
  text("Periapsis: "+Pe,900,10);
  text("Apoapsis: "+Ap,900,20);
  text("Eccentricity: " + abs(e),900,30);
  text("Semi-Major Axis: "+a,900,40);
  text("Argument of Periapsis: "+Omega*360/(2*PI),900,50);
  text("True Anomaly: "+(theta*360/(2*PI)),900,60);
}


