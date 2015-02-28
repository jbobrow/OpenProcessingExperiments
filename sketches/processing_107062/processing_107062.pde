
//set up list to fill with neurons as they are made
ArrayList<Neuron> neurons;

//threshold distance to join the neurons
float thresh;

//this threshold is added to stop neurons trying to attach to themselves
float inhib;

//the running tally of neurons (this is used to give each neuron a number id)
int count;

//the amount the signals lose as they travel
float attenuation;

PVector mouse = new PVector(0f, 0f);
boolean fade = false;

//setup sketch and initialise all the variables

public void setup() {
  size(1080, 720, P2D);
  frameRate(60);
  background(0);
  neurons = new ArrayList<Neuron>();
  thresh = 240;
  inhib = 2;
  count = 0;
  attenuation = 0.01;
  smooth();
}

//draw every frame

public void draw() {
  
  //draws the background first, the fade is acheived by using a slightly transparent black frame
  
  if (fade) {
    fill(0, 30);
    rectMode(CORNERS);
    rect(0, 0, width, height);
    fill(255);
  } 
  else {
    background(0);
  }
  
  // draws lines and adds neurons to eachothers connections list
  makeConnections();
  
  //draw all the neurons in the neuron ArrayList
  for (int i = 0; i < neurons.size(); i++) {
    neurons.get(i).display();
  }
}

//adds a new neuron when the mouse is clicked, also increments 'count' to use as the neuron ids
public void mouseClicked() {
  mouse.set(mouseX, mouseY);
  neurons.add(new Neuron(mouse, count));
  count++;
}

//handles keypresses to to add charge to the neurons near the mouse, clear the neurons and toggle fade
public void keyPressed() {
  if (key == 'c') {
    for (int i = 0; i < neurons.size(); i++) {
      
      //gets the neuron positions, if a neuron is closer than 40px it will charge
      if (dist(neurons.get(i).Pos.x, neurons.get(i).Pos.y, mouseX, mouseY) < 40) {
        
        //the charging decreases further from the neuron with the function of 8 - 0.2*dist
        neurons.get(i).addCharge( 8 - 0.2f * dist(neurons.get(i).Pos.x, neurons.get(i).Pos.y, mouseX, mouseY));
      }
    }
  }
  if (key == 'x') {
    neurons.clear();
    count = 0;
  }
  if (key == 'f') {
    fade = !fade;
  }
}

//this function draws the lines and makes eah neuron aware of its connections
public void makeConnections() {
  
  //2 for loops are used to cross reference the list of neurons against eachother
  for (int i = 0; i < neurons.size(); i++) {
    for (int j = 0; j < neurons.size(); j++) {
      
      //filter the neurons that arent close enough to eachother
      if (neurons.get(i).Pos.dist(neurons.get(j).Pos) < thresh
        && neurons.get(i).Pos.dist(neurons.get(j).Pos) > inhib) {
          
        //set line style and draw line
        stroke(255);
        strokeWeight(1);
        line(neurons.get(i).Pos.x, neurons.get(i).Pos.y, 
        neurons.get(j).Pos.x, neurons.get(j).Pos.y);
        
        //if the neuron does not already contain the others id in its connections list, add it
        if (neurons.get(i).connections.contains(j) == false) {
          neurons.get(i).addConnection(neurons.get(j).id);
        }
      }
    }
  }
}

public class Neuron {
  
  PVector Pos;
  int id;
  
  //parameter to time the blue 'fire' ripples without interfering with the draw function
  float t;
  
  float charge;
  boolean fired;
  float siz;
  
  //each neuron has a connections list of others that are close to it such that it can fetch their location to send signals when it fires
  ArrayList<Integer> connections;
  
  //dynamic list of signals sent from an instance of a neuron
  ArrayList<Signal> s = new ArrayList<Signal>();
  
  //constructor needs a PVector for its position and an id that other neurons can identify it with
  Neuron(PVector _Pos, int _id) {
    Pos = new PVector();
    Pos.set(_Pos);
    id = _id;
    charge = 0f;
    fired = false;
    t = 1.0f;
    siz = 20;
    connections = new ArrayList<Integer>();
  }
  
  
  public void display() {
    
    //when the charge exceeds the radius fire() is called
    if (charge > siz) {
      fire();
      charge = 0;
    }
    
    //draw the neuron here
    pushStyle();
    stroke(255);
    strokeWeight(1.5f);
    fill(0);
    ellipse(Pos.x, Pos.y, siz, siz);
    popStyle();
    
    //remove signals if they have sent or expired
    removeSignals();
    
    //display this paricular neurons signals
    for (int i = 0; i < s.size(); i++) {
      s.get(i).display();
    }
    
    //draw the charge filling up, the colour changes with the amount from green to blue
    pushStyle();
    noStroke();
    fill(0, 255-charge*100*0.05f, charge*255*0.05f);
    ellipse(Pos.x, Pos.y, charge, charge);
    popStyle();
    
    //draw the 'fire' ripples
    if (fired == true) {
      pushStyle();
      noFill();
      stroke(0, 100, 255, t * 255);
      strokeWeight(10*t);
      ellipse(Pos.x, Pos.y, 60 - t * 40, 60 - t * 40);
      popStyle();
      t -= 0.05f;
    }
    if (t < 0.1f) {
      fired = false;
    }
    
  }
  
  //add the id to the list
  public void addConnection(int n) {
    connections.add(n);
  }
  
  
  public void fire() {
    
    //tell the display loop to trigger the 'fire' ripples
    if (!fired && charge > siz) {
      fired = true;
      t = 1.0f;
    }
    
    //adds new signal between the current neuron and the others in its connections list
    for (int i = 0; i < connections.size(); i++) {
      if (charge > siz) {
        s.add(new Signal(Pos, neurons.get(connections.get(i)), charge / connections.size()));
      }
    }
  }
  
  //can add charge from outside the neuron class
  public void addCharge(float c) {
    charge += c;
  }
  
  //remove the signals that have expired or sent
  public void removeSignals() {
    for (int j = 0; j < s.size(); j++) {
      if (s.get(j).sent) {
        s.remove(j);
      }
    }
  }
}

public class Signal {
  
  PVector sPos = new PVector();
  Neuron end;
  float t;
  float charge;
  boolean sent;
  float initialDist;
  
  //signal constructor requires a PVector start point, a Neuron end point (position can be accessed from neuron class) and the charge value it carries
  Signal(PVector _start, Neuron _end, float _charge) {
    sPos = _start;
    end = _end;
    charge = _charge;
    t = 0f;
    sent = false;
    //initial distance between the start and the end positions allows the signals to travel at the same speed even with the lerp function
    initialDist = PVector.dist(_start, end.Pos);
  }
  
  public void display() {
    if (!sent) {
      pushStyle();
      stroke(0, 200, 255);
      noFill();
      ellipse(PVector.lerp(sPos, end.Pos, t).x, 
      PVector.lerp(sPos, end.Pos, t).y, charge, charge);
      //the parameter between the neurons is incremented with a function of the initial distance so they all travel at the same speed
      t += 4/initialDist;
      charge -= attenuation;
      popStyle();
      
      //once the signal has reached the other end it passes its charge to the target neuron, the signal is "sent"
      if (t >= 1) {
        sent = true;
        end.addCharge(charge);
        charge = 0;
      }
      
      //if the signal runs out of charge on the way it expires and sent is set to true so it can be removed from the neuron
      else if (charge < 1) {
        sent = true;
      }
    }
  }
}



