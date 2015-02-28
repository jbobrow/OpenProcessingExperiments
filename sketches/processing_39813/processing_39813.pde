
int[] horizonNodes;
int num = 20;

void setup() {

  size(300, 300);
  colorMode(HSB, 500, 200, 100);

  horizonNodes = new int[num];

  for (int i = 0; i < horizonNodes.length; i++) {
    horizonNodes[i] = int(random(50));
  }
}

void draw() {
}

void mousePressed() {

  int colorSlider = 5;
  background(240);

  for (float base = height/4; base < height; base +=20) {        

    float space;
    float segment = width/num;
    colorSlider +=35;

    for (space = 0; space <= width; space += segment ) {  
      if (pickANode() == (num+1)/3) {
        fill(255,0,0);
        quad(space, base+20, space, base - pickANode(), space + segment, base - pickANode(), space + segment, base+20);
      }
      else {
        noStroke();
        fill(pickANode(), colorSlider, 100);
        quad(space, base+20, space, base - pickANode(), space + segment, base - pickANode(), space + segment, base+20);
      }
    }
  }
}

int pickANode() {
  int n = int(random(num));
  return horizonNodes[n];
}


