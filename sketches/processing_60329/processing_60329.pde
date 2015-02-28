
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/8168*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
// a processing remake of the web mode in mr doob's "harmony" procedural drawing app
// http://mrdoob.com/lab/javascript/harmony/#web

ArrayList history = new ArrayList();
float distthresh = 600;

void setup(){
  size(900,600);
  background(255);
  stroke(0,50);
  smooth();
}


void draw(){
  
}

void mouseDragged(){
  stroke(0,50);
  PVector d = new PVector(mouseX,mouseY,0);
  history.add(0,d);
  
  for (int p=0; p<history.size(); p++){
    PVector v = (PVector) history.get(p);
    float joinchance = p/history.size() + d.dist(v)/distthresh;
    stroke(d.dist(v)*1.25,50); //I added this line to make the color dependent on distance.
    if (joinchance < random(0.4))  line(d.x,d.y,v.x,v.y);
  }
}

void keyPressed(){
  if (key == ' ') {
    background(255);
    history.clear();
  }
}


