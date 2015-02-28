
/* Copyright 2012 Fabian Paul

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.*/

float dt = 0.1;       // time step
float m = 10;         // particle mass
int n = 50;           // particle count
public float r = 7;   // particle radius
float k = 80;         // elastic spring constant for all (elastic) collisions
float barrier_height;  
float barrier_x0;     // left barrier edge
float barrier_x1;     // right barrier edge
float x0 = 0;         // instantaneous piston/floor position
float t = 0;          // time
float w = 2*PI/(dt*100); // piston/floor angular frequency of oscillation
public float amp = 10; // piston/floor amplitude of oscillation
float Fg = -5;         // force of gravity
public float R = 0.63; // coefficient of restitution = 
                       // sqrt(ratio of inelastic to elastic force constant)

PVector[] X; // positions, x-axis is pointing _up_
PVector[] V; // velocities

void setup()
{
  size(400,300);
  X = new PVector[n];
  V = new PVector[n];
  // init barrier 
  barrier_height = height/2;
  barrier_x0 = width/2 - 10; 
  barrier_x1 = width/2 + 10;  
  // position particles randomly 
  for(int i=0; i<n; i++) {
    X[i] = new PVector(random(width),random(height));
    V[i] = new PVector(0,0);
  }
  setup_gui();
} 

PVector interact(PVector a, PVector b, PVector v, PVector w)  
{
  // make particles 'stick'
  // idea: set spring constant based on velocities
  // if particles are incoming (in the center of mass frame of reference) -> strong spring
  // if particles are outgoing -> weak spring
  // this 'steals' particles potential energy the moment they are at rest in the center of mass system
  float C;
  PVector x_rel = new PVector((a.x-b.x)/2, (a.y-b.y)/2);
  PVector v_rel = new PVector((v.x-w.x)/2, (v.y-w.y)/2);
  if(x_rel.dot(v_rel) > 0) C = R*R; 
  else C = 1;

  // calculate soft core force
  PVector dX = new PVector(b.x-a.x,b.y-a.y);
  float l = dX.mag();
  if(l<2*r) {
    PVector er = new PVector(dX.x,dX.y);
    er.div(er.mag());
    er.mult(C*k*(2*r-l)); // C is the inelastic contibution
    return er;
  } else {
    return new PVector(0,0);
  }
}
 
PVector wall(PVector x)
{
  // collisions are elastic
  PVector F = new PVector(0,0);
  // reflecting half-planes at the sides 
  if(x.x < r) F.add(new PVector(k*(r-x.x),0));
  if(x.y < x0+r) F.add(new PVector(0,k*(x0+r-x.y)));
  if(x.x > width-r) F.add(new PVector(k*(width-r-x.x),0));
  if(x.y > height-r) F.add(new PVector(0,k*(height-r-x.y)));
  // barrier, this was a bit tricky
  if(x.y < barrier_height+r && x.x > barrier_x0-r && x.x < barrier_x1+r) {
    if( x.y-barrier_height > x.x-barrier_x1 && x.y-barrier_height > barrier_x0-x.x )
      F.add(new PVector(0,k*(barrier_height+r-x.y)));
    if( x.x > (barrier_x0+barrier_x1)/2 && x.x-barrier_x1 > x.y-barrier_height)
      F.add(new PVector(k*(barrier_x1+r-x.x),0));
    if( x.x < (barrier_x0+barrier_x1)/2 && barrier_x0-x.x > x.y-barrier_height)
      F.add(new PVector(k*(barrier_x0-r-x.x),0));
  }
  return F;
}

void draw()
{
  // Euler step
  // update velocities
  for(int i=0; i<n; i++) {
    PVector F = new PVector(0,Fg); /* F_g */
    F.add(wall(X[i]));
    for(int j=0; j<n; j++) {
      if(j!=i) {
        F.add(interact(X[j],X[i],V[j],V[i]));
      }
    }
    F.mult(dt/m);
    V[i].add(F);
  }
  // update positions
  for(int i=0; i<n; i++) {
    PVector dX = new PVector(V[i].x, V[i].y);
    dX.mult(dt);
    X[i].add(dX);
  }
  // update floor
  x0 = amp*(1+sin(t*w));
  // draw everything
  background(255);
  for(int i=0; i<n; i++) 
    ellipse(X[i].x,height-X[i].y,2*r,2*r);
  // draw barrier
  line(barrier_x0, height-0, barrier_x0, height-barrier_height);
  line(barrier_x0, height-barrier_height, barrier_x1, height-barrier_height);
  line(barrier_x1, height-barrier_height, barrier_x1, height-0);
  // draw floor
  line(0, height-x0, width, height-x0);
  t += dt;
}

// GUI stuff from here on
import controlP5.*;

ControlP5 controlP5; 
Slider slider_R;
Slider slider_r;
Slider slider_amp;
boolean visible = false; 
 
void setup_gui()
{
  controlP5 = new ControlP5(this);  
  controlP5.hide();
  controlP5.setColorForeground(color(50));
  controlP5.setColorBackground(color(200));
  controlP5.setColorLabel(color(0));
  controlP5.setColorValue(color(255));
  controlP5.setColorActive(color(128));
  slider_R=   controlP5.addSlider("R",0,1).setPosition(20,20).setLabel("COR");
  slider_amp= controlP5.addSlider("amp",0,30).setPosition(20,40).setLabel("amplitude");
  slider_r= controlP5.addSlider("r",0,15).setPosition(20,60).setLabel("radius");
}

void mousePressed() {
  if(mouseButton == RIGHT) {
    visible = ! visible;
    if(visible)
      controlP5.show();
    else
      controlP5.hide();
  }
}

