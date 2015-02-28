
// 
// concentro b&w
//

int NUM_ROSETTES = 10;

ArrayList rosettes;
PImage cached_bg;

void setup() { 
  size(512, 512); 
  colorMode(RGB, 100);
  smooth();
  
  concentricBackground();
  cached_bg = get();

  rosettes = new ArrayList(NUM_ROSETTES);
  for (int i = 0; i < NUM_ROSETTES; ++i) {
    rosettes.add(new Rosette());
  }
  
}
 
void draw() { 
  image(cached_bg, 0, 0);
  stroke(0);
  for (int i = 0; i < NUM_ROSETTES; ++i) {
    Rosette r = (Rosette)rosettes.get(i);
    r.doDraw();
  }
  if (random(100) < 0.1) reset();
} 

void keyPressed() {
  reset();
}

void reset() {
  for (int i = 0; i < NUM_ROSETTES; ++i) {
    Rosette r = (Rosette)rosettes.get(i);
    r.reset();
  }
}

// half closed interval
float rrand(float min_val, float max_val) {
  return (random(max_val - min_val) + min_val);
}

void concentricBackground() {
  for (int i = 0; i < width; i += 100) {
    for (int j = 0; j < height; j += 100) {
      pushMatrix();
      translate(i, j);
      concentro(101);
      translate(50, 50);
      concentro(101);
      popMatrix(); 
    }
  }
}  

void concentro(int csize) {
  fill(100);
  stroke(0);
  strokeWeight(2); 
  
  for ( ; csize > 0; csize -= 10) {
    ellipse(0, 0, csize, csize);
  }
}

// My faithful friend Turtle-K
class TurtleK { 
  float direction;  // in radians
  float posX; 
  float posY; 
 
  TurtleK() { 
    direction = posX = posY = 0; 
  } 
 
  void turn(float deg) { 
    direction += deg;
    while (direction > TWO_PI) direction -= TWO_PI;
  } 
 
  void forward(float steps) { 
    float newX = cos(direction) * steps + posX;
    float newY = sin(direction) * steps + posY;
    
    posX = newX;
    posY = newY;
  } 
}

class Rosette extends TurtleK {
  int num_petals;
  ArrayList layers;
  
  class Layer {
    float petal_width;
    float petal_height;
  }
  
  Rosette() {
    reset();
  }
  
  void reset() {
    int margin = 100;  // no "const int"?
    int num_layers = 3;

    posX = rrand(margin, width - margin);
    posY = rrand(margin, height - margin);
    direction = random(TWO_PI);
    num_petals = int(rrand(5, 9));
    
    float petal_width = rrand(30, 40);
    float petal_height = rrand(60, 80);
    layers = new ArrayList();
    for (int i = 0; i < num_layers; i++) {
      Layer ll = new Layer();
      ll.petal_width = petal_width;
      ll.petal_height = petal_height;
      layers.add(ll);
      
      petal_width *= random(0.8) + 0.2;
      petal_height *= random(0.8) + 0.2;
      if (petal_width > petal_height) {
        // a language where you can't write a swap function DOES NOT COMPUTE
        float temp = petal_width;
        petal_width = petal_height;
        petal_height = temp;
      }
    }
  }
  
  void doDraw() {
    pushMatrix();
    translate(posX, posY);
    rotate(direction);
    for (int i = 0; i < layers.size(); i++) {
      Layer ll = (Layer)layers.get(i);
      fill(i % 2 * 100);
      rosette(num_petals, ll.petal_width, ll.petal_height);
    }
    popMatrix();
    
    turn(0.01);
    forward(1);
  }
}  


void rosette(int petal_count, float petal_width, float petal_height) {
  stroke(0);
  strokeWeight(2); 

  pushMatrix();
  float rotation = TWO_PI/petal_count;
  for (int i = 0; i < petal_count; ++i) {
    rotate(rotation);
    ellipse(0, petal_height/2, petal_width, petal_height);
  } 
  popMatrix();
}


