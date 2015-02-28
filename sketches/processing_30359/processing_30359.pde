
float m = 1;                                              // Pendula mass
float g = 9.8;                                            // Acceleration due to gravity
float b = 0;                                              // Damping
float dt = 0.005;                                          // Simulation time
float T = 10;                                             // Period of one complete cycle
float d = 0.01;                                           // Pendula separation distance
int N = 51;                                             // Full cycles completed by the longest pendulum
int n = 15-1;                                           // Number of pendula minus 1

float l = 100;
float q = 0.25*PI;                            // Initial angle
float qd = 0;                                  // Initial velocity
float qdd = (-m*g*l*sin(q)-b*qd)/(m*l*l);    

void setup()
{
  size(450, 450);
  frameRate(30);
  smooth();

}

void draw()
{
  for (float j=0; j<T*2; j+=dt)
  {
  background(255);

    line(250, 250, 250+l*sin(q), 250+l*cos(q));

    qd += qdd*dt;                            // Initial angle
    q += qd*dt;                                  // Initial velocity
    qdd = (-m*g*l*sin(q)-b*qd)/(m*l*l);          // Initial acceleration
//    delay(int(dt*1000));
  }
}  
                
