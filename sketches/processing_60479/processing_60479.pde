
ArrayList history = new ArrayList();
float distthresh = 100;

void setup() {
  size(900, 600);
  background(255);
  stroke(0, 50);
  smooth();
}


void draw() {
}

void mouseDragged() {

  PVector d = new PVector(mouseX, mouseY, 0);
  history.add(0, d);

  for (int p=0; p<history.size(); p++) {
    PVector v = (PVector) history.get(p);
    float joinchance = p/history.size() + d.dist(v)/distthresh;
    if (joinchance < random(0.6))  line(d.x, d.y, v.x, v.y);
  }
}


void keyPressed() {
  if (key == 'b') {
    background(255, 250, 255);
    println("bang!");
    
  
   }
  }



