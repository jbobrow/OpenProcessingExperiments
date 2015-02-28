
import processing.opengl.*;
  
static final int NUM_NEURONS = 150;
static final int NEURON_SIZE = 3;
static final int SIGNAL_SIZE = 1;
static final int START_THRESHOLD = 20;
static final float SIGNAL_SPEED = 100; // the smaller the faster
static final float SPEED_CONSTANT = 0.3; // the smaller the faster
static final int REFRACTORY_TIME = 500;
static final int FIRING_CHARGE = 5;
float MAX_DISTANCE;
  
Neuron[] neurons = new Neuron[NUM_NEURONS];
ArrayList<Signal> signals = new ArrayList<Signal>();
  
void setup()
{
  size(720, 480, P3D);
  MAX_DISTANCE = dist(0,0,width,height);
  smooth();
  noFill();
  background(0);
  ellipseMode(CENTER);
  
  for (int i=0; i<NUM_NEURONS; i++)
  {
    neurons[i] = new Neuron(i, int(random(width)), int(random(height)));
  }
  
  makeConnections();
}
  
void mouseDragged()
{
  for (int i=0; i<NUM_NEURONS; i++)
  {
    if (dist(mouseX,mouseY,neurons[i].x,neurons[i].y) < 20)
      neurons[i].addCharge(20);
  }
}
  
void draw()
{
  fill(0,0,0,42);
  rect(0,0,width,height);
   
  drawSignals();
  
  for (int i=0; i<NUM_NEURONS; i++)
    neurons[i].draw();
}
 
class Neuron
{
  int refractory;
  float charge, threshold;
  float x, y, originalx, originaly;
  int id;
  Neuron[] connections;
  int num_connections;
  
  Neuron(int newid, int newx, int newy)
  {
    id = newid;
    x = newx;
    y = newy;
    originalx = x;
    originaly = y;
    num_connections = 0;
    charge = 0;
    threshold = random(START_THRESHOLD);
    refractory = 0;
  }
  
  void draw()
  {
    update();
      
    if (refractory > 0)
    {
      fill(refractory,255-refractory,0);
      stroke(refractory,255-refractory,0);
    }
    else
    {
      noFill();
      stroke(0,255,0);
    }
     
    ellipse(x, y, NEURON_SIZE, NEURON_SIZE);
       
    noFill();
  
    //stroke(num_connections, x, y, 10);
    stroke(255*(threshold/START_THRESHOLD), num_connections, y, 10);
      
    for (int i=0; i<num_connections; i++)
      line(x, y, connections[i].x, connections[i].y);
  }
    
  void update()
  {   
    if (refractory > 0)
    {
      refractory--;
    }
    else
    {
      if (charge > threshold)
      {
        for (int i=0; i<num_connections; i++)
          signals.add(new Signal(this, connections[i], random(FIRING_CHARGE)));
            
        charge = 0;
        refractory = int(random(REFRACTORY_TIME));
          
        // Draw firing
        fill(255,255,255,200);
        ellipse(x,y,2*NEURON_SIZE,2*NEURON_SIZE);
      }
    }
  }
  
  void addCharge(float c)
  {
    if (refractory == 0)
      charge += c;
  }
}
  
class Signal
{
  Neuron origin, destination;
  boolean alive;
  float progress, distance, charge;
  
  Signal(Neuron o, Neuron d, float c)
  {
    origin = o;
    destination = d;
    progress = 0;
    distance = dist(o.x,o.y,d.x,d.y);
    charge = c;
    alive = true;
  }
    
  void draw()
  {
    update();
      
    stroke(origin.x,origin.y,charge*10,255*(charge/FIRING_CHARGE));
    //stroke(0,255,255,255*(charge/FIRING_CHARGE));
      
    float signalx = lerp(origin.x,destination.x,progress/distance);
    float signaly = lerp(origin.y,destination.y,progress/distance);
    //point(origin.x*(1-(progress/distance))+destination.x*(progress/distance), origin.y*(1-(progress/distance))+destination.y*(progress/distance));
    //ellipse(origin.x*(1-(progress/distance))+destination.x*(progress/distance), origin.y*(1-(progress/distance))+destination.y*(progress/distance), SIGNAL_SIZE, SIGNAL_SIZE);
    ellipse(signalx, signaly, SIGNAL_SIZE, SIGNAL_SIZE);
  }
  
  void update()
  {
    progress += SPEED_CONSTANT+(distance-progress)/SIGNAL_SPEED;
      
    if (progress > distance)
    {
      alive = false;
      destination.addCharge(charge);
    }
  }
}
  
void makeConnections()
{
  Neuron origin, destination;
  
  for (int i=0; i<NUM_NEURONS; i++)
  {
    origin = neurons[i];
    origin.connections = new Neuron[0];
  
    for (int j=0; j<NUM_NEURONS; j++)
    {
      destination = neurons[j];
      if (origin.id != destination.id)
      {
        // Make this a random chance according to distance
        if (dist(origin.x, origin.y, destination.x, destination.y) < 100)
        {
          origin.connections = (Neuron[])append(origin.connections, neurons[j]);
          origin.num_connections++;
        }
      }
    }
  }
}
  
void drawSignals()
{
  Signal current;
  for (int i=0; i<signals.size(); i++)
  {
    current = signals.get(i);
    current.update();
  
    if (!current.alive)
    {
      signals.remove(i);
      i--;
    }
  }
    
  stroke(0,255,0);
  for (int i=0; i<signals.size(); i++)
    signals.get(i).draw();
}


