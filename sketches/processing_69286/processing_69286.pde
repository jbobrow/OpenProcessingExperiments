
//Press "r" to start drawing random connections and nodes. 
//Press "space-bar" to clear

boolean mouseIsDown = false;
boolean randomizer = false; 
ArrayList history = new ArrayList();
float distthresh = 60;
float rndW = 5;

void setup() {
  size(750, 750);
  background(255, 255, 255);
  smooth();
}
 
void draw() {

  float distCalc = dist(pmouseX, pmouseY, mouseX, mouseY);
  
  if (randomizer == true) { float rndW = random(5, 8); }
  else { float rndW = 5; }
  
  if (mouseIsDown == true)
  {
    if (distCalc > 5) {
      distCalc = 5;
    }
    strokeWeight(rndW-distCalc);
    line(pmouseX, pmouseY, mouseX, mouseY);

  }
 
}

void mouseDragged(){
 
  PVector d = new PVector(mouseX,mouseY,0);
  history.add(0,d);
   
  for (int p=0; p<history.size(); p++){
    PVector v = (PVector) history.get(p);
    float joinchance = p/history.size() + d.dist(v)/distthresh;
    if (randomizer == true) {
      if (joinchance < random(1))  line(d.x,d.y,v.x,v.y); }
    else {
      if (joinchance < random(0.1))  line(d.x,d.y,v.x,v.y); }
  }
}


void mousePressed() {
  mouseIsDown = true;
}

void mouseReleased() {
  mouseIsDown = false;
}




void keyPressed() {
 if (key == 'r' || key == 'R') {
     randomizer = true;
    }
 if (key == ' ') {background(255,255,255);}
}
void keyReleased() {
 if (key == 'r' || key == 'R') {
     randomizer = false;
    }
}
