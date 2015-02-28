
int[] trail = new int[800];
float dt = .01;
float p, oldp, i, d;
float kp=.1, ki=0.005, kd=.01;

float output, pv, sp=300;

void setup()
{
  size(800, 600);
  smooth();
  textFont(createFont("Arial", 16));
}
float t = 0;
void update()
{  
  for(int i = 799; i > 0; i--)
  {
    trail[i] = trail[i-1];
  }
/*
  From Wikipedia:
  previous_error = setpoint - process_feedback
  integral = 0
  start:
    wait(dt)
    error = setpoint - process_feedback
    integral = integral + (error*dt)
    derivative = (error - previous_error)/dt
    output = (Kp*error) + (Ki*integral) + (Kd*derivative)
    previous_error = error
    goto start
*/
  // Calculate PID loop 50 times each update
  for(int j = 0; j < (50); j++)
  {
  p = (sp-pv);
  i += p*dt;
  d = ((p - oldp)/dt);
  output = (kp*p) + (ki*i) + (kd*d);
  oldp = p;
  pv += (output * dt);
  if(pv > 600) pv = 600;
  if(pv < 0) pv = 0;
  t += dt;
  }
  trail[0] = (int)pv;   
}

void draw()
{
  float scalef;
  update();
  background(0);
  strokeWeight(5);
  stroke(0, 255, 0);
  // Draw Setpoint
  line(0, 600-sp, 800, 600-sp);
  // Plot PID trail
  for(int i = 799; i > 0; i--)
  {
    scalef = i / 799.0;
    stroke(255-(255*scalef), 64*scalef, 255*scalef);
    line(799-i, 600-trail[i], 798-i, 600-trail[i-1]);
  }
  // Text Stuff
  text("Click anywhere to change the setpoint!", 10, 16);
  text("P: " + kp*p, 10, 32);
  text("I: " + ki*i, 10, 48);
  text("D: " + kd*d, 10, 64);
  text("SimTime: " + round(t) + "@dt:"+dt, 10, 80);
  text("Output: " + output, 10, 96);
  text("PV: " + round(pv), 10, 112);
  text("SP: " + round(sp), 10, 128);
}

void mouseClicked()
{
  sp = 600 - mouseY;
}

