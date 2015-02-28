
int N_NEURONS = 50;
int NEURON_RADIUS = 20;
int ACTION_THRESHOLD = 16;
int ACTION_SPEED = 3;
int ATTENUATION_DIST = 50;
int ATTENUATION_AMT = 1;
float CONNECT_RANGE = 160;
float INHIB_RANGE = 40;
ArrayList<Neuron> neurons = new ArrayList<Neuron>();

void setup() {
  background(0);
  frameRate(60);
  size(1280, 720);

  for (int i = 0; i < N_NEURONS; i++) {
    neurons.add(new Neuron(i));
  }
}


void draw() {

  for (int i = 0; i < neurons.size(); i++) {
    neurons.get(i).colorNeuron(neurons.get(i).getCharge());
    neurons.get(i).drawNeuron();
    if (neurons.get(i).discharge()) {
      neurons.get(i).discharger();
      //ACTION POTENTIAL
      //if (frameCount % 30 == 0) { //tester
      int[] connectedNeurons = neurons.get(i).getConnections();
      for (int j = 0; j < connectedNeurons.length; j++) {
        neurons.get(connectedNeurons[j]).addCharge(ACTION_THRESHOLD/3);//tester
      } //tester
      //} //tester
      //neurons.get(0).colorNeuron(15); //tester!
      //neurons.get(0).drawNeuron(); //tester!
    }
    connector();
  }
}
void mousePressed() {
  int pressedNeuron = -1;
  for (int i = 0; i < neurons.size(); i++) {
    if (dist(mouseX, mouseY, neurons.get(i).getX(), neurons.get(i).getY()) < NEURON_RADIUS) {
      pressedNeuron = i;
    }
  }
  if (pressedNeuron >= 0) {
    neurons.get(pressedNeuron).addCharge(ACTION_THRESHOLD);
  } 
  else {
    int thisNeuron = neurons.size();
    neurons.add(new Neuron(thisNeuron));
    neurons.get(thisNeuron).setX(mouseX);
    neurons.get(thisNeuron).setY(mouseY);
    connector();                                 //tester?
    println(neurons.get(0).getConnections());     //tester!
    println(neurons.size());      //tester!
  }
}

class ActionPotential {
  float Xpos, Ypos;
  int startID, endID, charge, iterator;

  ActionPotential(int _startID, int _endID) {
    startID = _startID;
    endID = _endID;
    Xpos = neurons.get(startID).getX();
    Ypos = neurons.get(startID).getY();
    charge = ACTION_THRESHOLD;
    iterator = 0;
  }
  
  
}

void connector() {
  for (int i = 0; i < neurons.size(); i++) {
    int[] tempConnections = new int[0];
    for (int j = 0; j < neurons.size(); j++) {
      if (i != j && dist(neurons.get(i).getX(), neurons.get(i).getY(), neurons.get(j).getX(), neurons.get(j).getY()) < CONNECT_RANGE 
        && dist(neurons.get(i).getX(), neurons.get(i).getY(), neurons.get(j).getX(), neurons.get(j).getY()) > INHIB_RANGE) {
        tempConnections = append(tempConnections, j);
        stroke(128);
        line(neurons.get(i).getX(), neurons.get(i).getY(), neurons.get(j).getX(), neurons.get(j).getY());
      }
    }
    neurons.get(i).setConnections(tempConnections);
  }
}

class Neuron {
  float Xpos, Ypos;
  int neuronID, charge;
  int[] connections = new int[0];

  Neuron(int ID) {
    Xpos = random(width);
    Ypos = random(height);
    charge = 0;
    neuronID = ID;
  }

  int getID() {
    return neuronID;
  }

  float getX() {
    return Xpos;
  }

  void setX(float newX) {
    Xpos = newX;
  }

  float getY() {
    return Ypos;
  }

  void setY(float newY) {
    Ypos = newY;
  }


  int[] getConnections() {
    return connections;
  }

  void setConnections(int[] newConnections) {
    connections = newConnections;
  }

  void drawNeuron() {
    ellipse(Xpos, Ypos, NEURON_RADIUS, NEURON_RADIUS);
  }

  void colorNeuron(int chargeIn) {
    stroke(255);  
    if (chargeIn >= 8) {  
      fill(255, 255-(chargeIn-8)*32, 0);
    } 
    else {
      fill((chargeIn-8)*32, 255, 0);
    }
  }

  void addCharge(int chargeChange) {
    charge += chargeChange;
  }

  int getCharge() {
    return charge;
  }

  void discharger() {
    if (charge >= ACTION_THRESHOLD) {
      charge = 0;
    }
  }

  boolean discharge() {
    if (charge >= ACTION_THRESHOLD) {
      return true;
    } 
    else {
      return false;
    }
  }
}



