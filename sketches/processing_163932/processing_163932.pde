
float theta, r;
float dtheta, dr;
float t, dt;
float m1, m2;
float G;
float l_;

void setup() {
  size(400, 700);
  setupVars();
}

void setupVars() {
  l_ = 20.0;
  r = 5.0;
  theta = PI/3.5;
  dtheta = 0;
  dr = 0;
  
  m1 = 1.0;
  m2 = 1.1;
  G = 11;
  dt = 0.1;
}

void draw() {
  if (r < 0.8) {
    background(250,10,10);
    m1 += 0.002;
    dr = abs(dr*0.85);
    r = abs(r);
  } else if (l_-r < 0.8){
    background(220,150,10);
    m2 += 0.002;
    dr = -abs(dr*0.6);
  } else {
    background(250);
  }
  line(350,100+(l_-r)*20,350,100);
  ellipse(350,100+(l_-r)*20,m1*15,20);  // m1
  line(350,100,150,100);
  float x = r*sin(theta);
  float y = r*cos(theta);
  line(150,100,150+x*20,100+y*20);
  ellipse(150+x*20,100+y*20,m2*15,20);  // m2
  
  iterate();
}

void iterate() {
  r += dr*dt;
  theta += dtheta*dt;
  dr += dt*( m1*pow(dtheta, 2)*r + G*(m1*cos(theta)-m2) )/(m1+m2);
  dtheta += -dt*(G*sin(theta)+dr*dtheta)/r;
}


