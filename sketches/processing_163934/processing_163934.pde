
float theta1, theta2, r1, r2;
float dtheta1, dtheta2, dr;
float t, dt;
float m1, m2;
float G;
float L;

float A_,B_,H_;

void setup() {
  size(600, 700);
  setupVars();
}

void setupVars() {
  A_ = 200;
  B_ = 400;
  H_ = 300;
  
  r1 = 8.0;
  r2 = 8.0;
  L = r1 + r2;
  theta1 = 0;
  theta2 = 0;
  dtheta1 = -0;
  dtheta2 = 0 + random(10)*0.1;
  dr = 0;
  
  m1 = 0.5;
  m2 = 0.5;
  G = 5;
  t = 0;
  dt = 0.04;
}

void draw() {
  r2 = L-r1;
  if (r1 < 0.5) {        // collision
    background(200,200,250);
    m1 += 0.002*random(20);
    dr = abs(dr*0.7);
    r1 = abs(r1-0.2)+0.2;
    r2 = L-r1;
    //theta1 += PI;
  } else if (r2 < 0.5){
    background(250,250,200);
    m2 += 0.02;
    dr = -abs(dr*0.7);
    r2 = abs(r2-0.2)+0.2;
    r1 = L-r2;
    //theta2 += PI;
  } else {
    background(250);
  }
  if (abs(dr)>20) {
    println("dr is ", dr);
    dr = 0;
  }
  strokeWeight(1);
  stroke(110);
  float x1 = r1*sin(theta1);
  float y1 = r1*cos(theta1);
  line(A_,H_,  A_+x1*20, H_+y1*20);
  ellipse(A_+x1*20, H_+y1*20, m1*15,m1*15);  // m1
  float x2 = r2*sin(theta2);
  float y2 = r2*cos(theta2);
  line(B_,H_, B_+x2*20, H_+y2*20);
  ellipse(B_+x2*20, H_+y2*20, m2*15,m2*15);  // m2
  
  strokeWeight(7);    // bar
  stroke(20, 0, 0);
  line(A_,H_,B_,H_);
  
  if (mousePressed) {      // dragging ropes around
    strokeWeight(2);
    if (distance(A_+20*x1,H_+20*y1,mouseX,mouseY) < distance(B_+20*x2,H_+20*y2,mouseX,mouseY) ) {
      stroke(200,50,50);
      line(A_,H_,  A_+x1*20, H_+y1*20);

      float V_X = (mouseX-A_)/20.0;
      float V_Y = (mouseY-H_)/20.0;
      float V_R = distance(0,0,V_X,V_Y);
      dr = dr*0.95;
      dr += (V_R-r1)*0.3;
      dtheta1 = dtheta1*0.9;
      dtheta1 -= asin( (x1*V_Y-y1*V_X)/(r1*V_R) ) * 0.8;
    } else {
      stroke(200,200,50);
      line(B_,H_,  B_+x2*20, H_+y2*20);

      float V_X = (mouseX-B_)/20.0;
      float V_Y = (mouseY-H_)/20.0;
      float V_R = distance(0,0,V_X,V_Y);
      dr = dr*0.95;
      dr -= (V_R-r2)*0.3;
      dtheta2 = dtheta2*0.9;
      dtheta2 -= asin( (x2*V_Y-y2*V_X)/(r2*V_R) ) * 0.8;

    }
  }
  
  iterate();
}

void iterate() {
  r1 += dr*dt;
  r2 = L-r1;
  if (r1 < 0.01)  // explosion fix
    r1 = 0.1;
  if (r2 < 0.01)
    r2 = 0.1;     //
  theta1 += dtheta1*dt;
  theta2 += dtheta2*dt;
  dr += dt*( m1*pow(dtheta1,2)*r1 - m2*pow(dtheta2,2)*r2 + G*(m1*cos(theta1)-m2*cos(theta2)) )/(m1+m2);
  dtheta1 += -dt*(G*sin(theta1)+dr*dtheta1)/r1;
  dtheta2 += -dt*(G*sin(theta2)-dr*dtheta2)/r2;
  
  t += dt;
}

float distance(float x_1, float y_1, float x_2, float y_2) {
  return sqrt( (x_2-x_1)*(x_2-x_1) + (y_2-y_1)*(y_2-y_1) );
}


