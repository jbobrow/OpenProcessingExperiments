
ArrayList vectorCollection;

int x;
int y;
int time;
int last;
int vectors = 50;

float axisX;
float axisY;

boolean click = false;

void setup() {
  size(500, 500);
  lines();

  vectorCollection = new ArrayList();

  //translate(-hei);

  for (int i = vectors; i < height - (vectors-1); i+= vectors) {
    PVector origin = new PVector (i, random(0.25*height, 0.75*height));
    VectorPoint myVector = new VectorPoint(origin);
    vectorCollection.add(myVector);
  }
}

void lines() {
  stroke(255);
  fill(0, 0);
}

void graph() {
}

void draw() {
  background(0);
  fill(255);
  textSize(14);
  text("Click Any Two Points To Calculate Slope", 0.5*width, 0.03*height);
  text("Press Any Key to Restart", 0.5*width, 0.065*height);
  for (int i = vectors; i < height - (vectors-1); i+= vectors) {
    axisX = map(i, 1*vectors, 9*vectors, 0, 10);
    axisY = map(i, 1*vectors, 9*vectors, 10, 0);
    textSize(10);
    fill(255);
    if(axisX < 11 && axisY < 11){
    String nfAxisX = nf(axisX,1,2);
    String nfAxisY = nf(axisY,1,2);
    text(nfAxisX, i, height*0.95);
    text(nfAxisY, width*0.05, i);
    }
    if(axisX >= 10 && axisY >= 10){
    String nfAxisX = nf(axisX,2,2);
    String nfAxisY = nf(axisY,2,2);
    text(nfAxisX, i, height*0.95);
    text(nfAxisY, width*0.05, i);
    }
    fill(100);
    stroke(100);
    strokeWeight(0.5);
    line(i,vectors,i,vectors*9);
    line(vectors,i,vectors*9,i);
    noStroke();
    ellipse(i, height*0.9, 5, 5);
    ellipse(width*0.1, i, 5, 5);
    ellipse(width*0.9, i, 5, 5);
  }
  for (int  i = 0; i < vectorCollection.size (); i++) {
    VectorPoint mb = (VectorPoint) vectorCollection.get(i);
    mb.run();
  }
}

void mousePressed() {
  click = true;
}

void keyPressed() {
  setup();
}

class VectorPoint {

  PVector loc = new PVector ();
  PVector av = new PVector();
  PVector firstSelection = new PVector();
  PVector secondSelection = new PVector();

  float X1;
  float Y1;
  float X2;
  float Y2;
  float slope;
  float dist = 20;

  int step;
  int text;
  int lineWeight;
  int green;
  int blue;

  //CONSTRUCTOR
  VectorPoint(PVector _loc) {
    loc = _loc;
  }


  void run() {
    lineBetween();
    selectVector();
    vectors();
  }

  void lineBetween() {
    stroke(255);
    strokeWeight(1);
    for (int i = 0; i < vectorCollection.size (); i++) {
      VectorPoint current = (VectorPoint) vectorCollection.get(i);
      if (i > 0) {
        VectorPoint previous = (VectorPoint) vectorCollection.get(i-1);
        line(previous.loc.x, previous.loc.y, current.loc.x, current.loc.y);
        float average1X = (current.loc.x+previous.loc.x)/2;
        float average1Y = (current.loc.y+previous.loc.y)/2;
        if (i > 1) {
          VectorPoint prior = (VectorPoint) vectorCollection.get(i-2);
          average1X = (previous.loc.x+prior.loc.x)/2;
          average1Y = (previous.loc.x+prior.loc.x)/2;
        }
        //curve(average1X, average1Y, current.loc.x, current.loc.y, previous.loc.x, previous.loc.y, average1X, average1Y);
      }
    }
  }

  void selectVector() {
    textAlign(CENTER, CENTER);
    for (int i = 0; i < vectorCollection.size (); i++) {
      VectorPoint other = (VectorPoint) vectorCollection.get(i);
      PVector mouse = new PVector(mouseX, mouseY);
      float firstDistance = mouse.dist(other.loc);
      float secondDistance = mouse.dist(other.loc);
      strokeWeight(lineWeight);
      stroke(255, green, blue);
      line(X1, Y1, X2, Y2);

      if (firstDistance < dist && click == false) {
        noStroke();
        fill(255, 0, 0);
        ellipse(other.loc.x, other.loc.y, 10, 10);
      }
      if (firstDistance < dist && click == true && step == 0) {
        firstSelection.set(other.loc);
        step = 1;
        text = 0;
        click = false;
      } 
      if (step == 1) {
        lineWeight = 4;
        green = 0;
        blue = 0;
        X1 = mouseX;
        Y1 = mouseY;
        X2 = firstSelection.x;
        Y2 = firstSelection.y;
      }
      if (secondDistance < dist && click == true && step == 1) {
        secondSelection.set(other.loc);
        click = false;
        step = 2;
      }
      if (step == 2) {
        lineWeight = 2;
        green = 0;
        blue = 0;
        X1 = firstSelection.x;
        Y1 = firstSelection.y;
        X2 = secondSelection.x;
        Y2 = secondSelection.y;
        step = 0;
        text = 1;
      }
      if (text == 1) {
        slope = -(secondSelection.y-firstSelection.y)/(secondSelection.x-firstSelection.x);
        //fill(255, 0, 0);
        //noStroke();
        //textSize(16);
        //text(slope, 0.5*width, 0.15*height);
        println(slope);
      }
    }
  }
  void vectors() {
    noStroke();
    fill(255);
    ellipse(loc.x, loc.y, 6, 6);
  }
}



