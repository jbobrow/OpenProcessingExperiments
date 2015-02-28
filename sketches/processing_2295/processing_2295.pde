
// 
// black wirey things with little target fob nodes
//

// There will be ROOTS * 2^FORKS wirey things at the end
int ROOTS = 3; 
int FORKS = 4;

boolean looping = true;

void setup() { 
  size(950, 450); 
  background(0xff); 
  frameRate(1);
} 
 
void draw() { 
  //background(0xff); 
  fill(0xff, 0xff, 0xff, 0xcf); 
  rect(0, 0, width, height); 
  pushMatrix();
  translate(width * .5, height * .7);
  smooth();
  stroke(0);
  strokeWeight(1); 
  
  // draw a little cap on the root
  ellipse(0, 0, 3, 3);
  
  ArrayList stems = new ArrayList();
  for (int i = 0; i < ROOTS; i++) {
    stems.add(new Stem(0, 0));
  }

  for (int i = 0; i < FORKS; i++) {
    int stems_size = stems.size();
    
    // Have each of the stems draw a wire, then clone itself
    for (int j = 0; j < stems_size; j++) {
      Stem s = (Stem)stems.get(j);
      s.drawWire();
      stems.add(new Stem(s.posX, s.posY));
    }
  }
  
  // draw little targets on the end of each stem
  for (int i = 0; i < stems.size(); i++) {
    ((Stem)stems.get(i)).drawTarget();
  }
  popMatrix();
} 

void keyPressed() {
  if (looping) {
    noLoop();
  } else {
    loop();
  }
  looping = !looping;
}

// My faithful friend Turtle-K
class TurtleK { 
  float direction;  // out of 360 degrees
  float posX; 
  float posY; 
 
  TurtleK() { 
    direction = posX = posY = 0; 
  } 
 
  void turn(float deg) { 
    direction += deg;
    direction = direction % 360;
  } 
 
  void forward(float steps) { 
    float angle = (PI/180.0) * direction;  // convert to radians
    float newX = cos(angle) * steps + posX;
    float newY = sin(angle) * steps + posY;
    line(posX, posY, newX, newY);
    
    posX = newX;
    posY = newY;
  } 
 }
 
// A Stem has a tendency to go up
class Stem extends TurtleK {
  float angle;
  float step;
   
  Stem(float x, float y) {
    posX = x;
    posY = y;
    direction = -90;
    angle = random(10) - 5;
    step = random(0.5) + 0.5;
  }

  void turn(float deg) { 
    super.turn(deg);
    super.turn((90 - direction) / 50);
  }
  
  void drawWire() {
    for (int i = 0; i < 100; ++i) {
      forward(step);
      turn(angle);
    }
  }
   
  // renders a little bulls-eye
  void drawTarget() {
    fill(0xff);
    for (int i = 3; i > 0; --i) {
      ellipse(posX, posY, i * 4, i * 4);
    }
  }
}



