
float timeStep = 0;
Gradient sky, corona, totality, daylight;

public void setup() {
  size(512, 512, P2D);
  colorMode(RGB, 255);
  initGradients();
}

public void draw() {
  int ww = width/2;
  int hh = height/2;
  background(sky.getColor((float)mouseX/(float)width));
  timeStep += 0.05f;
  noSmooth();
  strokeWeight(2);
  for (float a=0; a<TWO_PI; a+= TWO_PI/360) {
    float cx = cos(a);
    float sx = sin(a);
    for (int i=0; i<40; i++) {
      int x = (int)(cx*(i+80));
      int y = (int)(sx*(i+80));
      float start = ((float)i/(float)40);
      float d = a > PI ? TWO_PI - a : a;
      float value = noise(x*0.05f,y*0.05f,d+timeStep)-start;
      float totality = abs(mouseX-ww)< 10 ? 0.60f * (1-(abs(mouseX-ww)/10.0f)) : 0;
      stroke(corona.getColor((float)mouseX/(float)width,start+(value*totality)));
      point(ww+x,hh+y);
    }
  }
  smooth();
  noStroke();
  fill(0xffffff88);
  ellipse(ww,hh,160,160); // sun
  fill(0);
  ellipse(mouseX,hh,160,160); // moon
}

void initGradients() {
  sky = new Gradient();
  sky.addNode(new GNode(0,0x0088ff));
  sky.addNode(new GNode(0.45f,0x0088ff));
  sky.addNode(new GNode(0.50f,0x000011));
  sky.addNode(new GNode(0.55f,0x0088ff));
  sky.addNode(new GNode(1,0x0088ff));

  daylight = new Gradient();
  daylight.addNode(new GNode(0,0xffff88));
  daylight.addNode(new GNode(0.4f,0x0088ff));
  daylight.addNode(new GNode(1,0x0088ff));

  totality = new Gradient();
  totality.addNode(new GNode(0,0xffff88));
  totality.addNode(new GNode(0.2f,0xffff44));
  totality.addNode(new GNode(0.3f,0xff3300));
  totality.addNode(new GNode(0.5f,0x000011));
  totality.addNode(new GNode(1,0x000011));

  // corona is a second order gradient.
  // a gradient of gradients
  corona = new Gradient();
  corona.addNode(new GNode(0,daylight));
  corona.addNode(new GNode(0.45f,daylight));
  corona.addNode(new GNode(0.5f,totality));
  corona.addNode(new GNode(0.55f,daylight));
  corona.addNode(new GNode(1,daylight));
}

class Gradient {
  GNode[] nodes;

  public Gradient() {
    nodes = new GNode[0];
  }

  public void addNode(GNode node) {
    GNode[] newNodes = new GNode[nodes.length+1];
    System.arraycopy(nodes,0, newNodes,0, nodes.length); 
    newNodes[nodes.length] = node; 
    nodes = newNodes;  
  }

  int getColor(float z, float y, float x) {
    int nx = 0;
    while (z >= nodes[nx].position) nx++;

    float amt = (z - nodes[nx-1].position)/(nodes[nx].position-nodes[nx-1].position);

    int c1 = nodes[nx-1].gradient.getColor(x,y);
    int c2 = nodes[nx].gradient.getColor(x,y);

    return interpolate(c1,c2,amt);
  }

  int getColor(float y, float x) {
    int nx = 0;
    while (y >= nodes[nx].position) nx++;

    float amt = (y - nodes[nx-1].position)/(nodes[nx].position-nodes[nx-1].position);

    int c1 = nodes[nx-1].gradient.getColor(x);
    int c2 = nodes[nx].gradient.getColor(x);

    return interpolate(c1,c2,amt);
  }

  int getColor(float x) {
    int nx = 0;
    while (x >= nodes[nx].position) nx++;

    float amt = (x - nodes[nx-1].position)/(nodes[nx].position-nodes[nx-1].position);

    int c1 = nodes[nx-1].rgb;
    int c2 = nodes[nx].rgb;

    return interpolate(c1,c2,amt);
  }

  int interpolate(int c1, int c2, float amt) {
    int r = (int)(lerp(red(c1),red(c2),amt));
    int g = (int)(lerp(green(c1),green(c2),amt));
    int b = (int)(lerp(blue(c1),blue(c2),amt));

    return color(r,g,b);
  }
}

class GNode {
  int rgb;
  Gradient gradient;
  float position;

  public GNode(float pos, int c) {
    position = pos;
    rgb = c;
  }

  public GNode(float pos, Gradient g) {
    position = pos;
    gradient = g;
  }
}



