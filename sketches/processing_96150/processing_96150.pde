
int n = 1;

void setup() {
  size(550,550,P3D);
  frameRate(240);
}

void draw() {
  background(0);
  stroke(255);
  textAlign(LEFT,TOP);
  
  textSize(20);
  if (n == 1)       text("s",0,0);
  else if (n == 2)  text("p",20,0);
  else if (n == 3)  text("p",45,0);
  else if (n == 4)  text("p",70,0);
  else if (n == 5)  text("d",95,0);
  else if (n == 6)  text("d",124,0);
  else if (n == 7)  text("d",150,0);
  else if (n == 8)  text("d",175,0);
  else if (n == 9)  text("d",200,0);
  else if (n == 10) text("f",250,0);
  else if (n == 11) text("f",275,0);
  else if (n == 12) text("f",305,0);
  else if (n == 13) text("f",335,0);
  else if (n == 14) text("f",365,0);
  else if (n == 15) text("f",420,0);
  else if (n == 16) text("f",485,0);
  
  textSize(13);
  if (n == 2)       text("z",30,12);
  else if (n == 3)  text("x",55,12);
  else if (n == 4)  text("y",80,12);
  else if (n == 5)  text("z",105,12);
  else if (n == 6)  text("xz",134,12);
  else if (n == 7)  text("yz",160,12);
  else if (n == 8)  text("xy",185,12);
  else if (n == 9)  text("x -y",210,12);
  else if (n == 10) text("z",255,12);
  else if (n == 11) text("xz",280,12);
  else if (n == 12) text("yz",310,12);
  else if (n == 13) text("xyz",340,12);
  else if (n == 14) text("z(x -y )",370,12);
  else if (n == 15) text("x(x -3y )",425,12);
  else if (n == 16) text("y(3x -y )",490,12);
  
  textSize(10);
  if (n == 5)       text("2",112,10);
  else if (n == 9)  text("2     2",215,10);
  else if (n == 10) text("3",262,10);
  else if (n == 11) text("2",295,10);
  else if (n == 12) text("2",325,10);
  else if (n == 12) text("2",387,10);
  else if (n == 14) text("2",407,10);
  else if (n == 15) text("2       2",444,10);
  else if (n == 16) text("2     2",515,10);
  
  translate(275,275,275);
  colorMode(RGB,1);
  scale(60);
  
  rotateX(map(mouseY,0,height,PI,-PI));
  rotateY(map(mouseX,0,width,-PI,PI));
  
  for (float theta = 0; theta <= PI; theta += 0.04) {
    for (float phi = 0; phi <= TWO_PI; phi += 0.04) {
      float rho = func(n,theta,phi);
      PVector v = sphericalToCartesian(rho,theta,phi);
      float m = v.mag();
      
      stroke(0,abs(v.y/m),abs(v.z/m));
      point(v.x,v.y,v.z);
      point(-v.x,-v.y,-v.z);
    }
  }
  
}

PVector sphericalToCartesian (float rho, float theta, float phi) {
  float x = rho*sin(theta)*cos(phi);
  float y = rho*sin(theta)*sin(phi);
  float z = rho*cos(theta);
  
  return new PVector(x,y,z);
}

float func (int n, float theta, float phi) {
  switch(n) {
    case 1:  return 1/(2*sqrt(PI));
    case 2:  return 1/2*sqrt(3/PI)*cos(theta);
    case 3:  return 1/2*sqrt(3/PI)*cos(phi)*sin(theta);
    case 4:  return 1/2*sqrt(3/PI)*sin(phi)*sin(theta);
    case 5:  return 1/4*sqrt(5/PI)*(3*sq(cos(theta))-1);
    case 6:  return 1/2*sqrt(15/PI)*cos(theta)*cos(phi)*sin(theta);
    case 7:  return 1/2*sqrt(15/PI)*cos(theta)*sin(phi)*sin(theta);
    case 8:  return 1/4*sqrt(15/PI)*sq(sin(theta))*sin(2*phi);
    case 9:  return 1/4*sqrt(15/PI)*sq(sin(theta))*cos(2*phi);
    case 10: return 1/4*sqrt(7/PI)*(5*pow(cos(theta),3)-3*cos(theta));
    case 11: return 5/4*sqrt(21/TWO_PI)*sq(cos(theta))*cos(phi)*sin(theta) - 1/4*sqrt(21/TWO_PI)*cos(phi)*sin(theta);
    case 12: return 5/4*sqrt(21/TWO_PI)*sq(cos(theta))*sin(phi)*sin(theta) - 1/4*sqrt(21/TWO_PI)*sin(phi)*sin(theta);
    case 13: return 1/4*sqrt(105/PI)*cos(theta)*sq(sin(theta))*sin(2*phi);
    case 14: return 1/4*sqrt(105/PI)*cos(theta)*sq(sin(theta))*cos(2*phi);
    case 15: return 1/4*sqrt(35/TWO_PI)*cos(3*phi)*pow(sin(theta),3);
    case 16: return 1/4*sqrt(35/TWO_PI)*sin(3*phi)*pow(sin(theta),3);
  }
  
  return 0;
}

void keyPressed() {
  switch(key) {
  case '1': n = 1; return;
  case '2': n = 2; return;
  case '3': n = 3; return;
  case '4': n = 4; return;
  case '5': n = 5; return;
  case '6': n = 6; return;
  case '7': n = 7; return;
  case '8': n = 8; return;
  case '9': n = 9; return;
  case 'A':
  case 'a': n = 10; return;
  case 'B':
  case 'b': n = 11; return;
  case 'C':
  case 'c': n = 12; return;
  case 'D':
  case 'd': n = 13; return;
  case 'E':
  case 'e': n = 14; return;
  case 'F':
  case 'f': n = 15; return;
  case 'G':
  case 'g': n = 16; return;
  }
}
