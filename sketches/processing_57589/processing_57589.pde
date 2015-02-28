
class DoublePendulum {

  float m1, m2; //point masses at the ends of the arms
  float g;      //gravity constant
  float l1, l2; //arm lengths

  float[] x = new float[4];      //state vector,  state vars are theta1 theta1' theta2 theta2'
  
  float[] dx = new float[4];     //for storing the value of the state function at the current state

  
  void update(float h) {
    
    //evaluate the state functions
    dx[0] = x[1];
    
    dx[1] = -g*(2*m1 + m2)*sin(x[0]) - 
            m2*g*sin(x[0]-2*x[2]) - 
            2*sin(x[0] - x[2])*m2*(x[3]*x[3] * l2 + 
            x[1]*x[1]*l1 * cos(x[0] - x[2]));
    dx[1] = dx[1]/(l1*(2*m1 + m2 -m2*cos(2*x[0]-2*x[2])));
    dx[1] = dx[1]-0.08*x[1]/(abs(x[1])+0.01); //friction, should probably be elaborated on
    
    dx[2] = x[3];
    
    dx[3] = 2*sin(x[0] - x[2])*(x[1]*x[1]*l1*(m1 + m2) + 
            g*(m1 + m2)*cos(x[0]) +
            x[3]*x[3]*l2*m2*cos(x[0] - x[2])); 
    dx[3] = dx[3]/(l2*(2*m1 + m2 -m2*cos(2*x[0]-2*x[2])));
    dx[3] = dx[3]-0.1*x[3]/(abs(x[3])+0.01); //friction
    
    //euler step
    x[0] += h*dx[0];
    x[1] += h*dx[1];
    x[2] += h*dx[2];
    x[3] += h*dx[3];
  }
  
  void draw() {
    float endx = centerx + s*l1*sin(x[0]);
    float endy = centery + s*l1*cos(x[0]);
    line(centerx,centery,endx,endy);
    line(endx,endy,
         endx+s*l2*sin(x[2]),
         endy+s*l2*cos(x[2]));
  }
}


