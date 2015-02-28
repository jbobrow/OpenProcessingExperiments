
static final int ANIM_LENGTH = 10;
static final int ANIM_HALF   = ANIM_LENGTH / 2;

static final int BUTTERFLY_SIZE = 10;

Butterfly bfs[];

void setup() {
  size(650,200);
  background (255,255,255);
  frameRate(60);
  smooth();
  ellipseMode(CENTER);
  
  bfs = makeButterflies("Sneha", "ArialMT", 48, color(85,170,255));
}

void draw() {
  background(204,104,78);
  for(int i=0; i<bfs.length; i++) {
    bfs[i].update();
    bfs[i].draw();
  }
}

void mouseClicked() {
  if(mouseButton == LEFT) {
    for(int i=0; i<bfs.length; i++)
      bfs[i].pickRandomDestination();
  }
  else if(mouseButton == RIGHT) {
    for(int i=0; i<bfs.length; i++)
      bfs[i].pickDestination();  
  }
}

Butterfly[] makeButterflies(String msg, String fontName, int size, color cl) {
  PFont font = loadFont(fontName + "-" + size + ".vlw");
  textFont(font); // necessary for textWidth
  PGraphics img = createGraphics(int(textWidth(msg)), size, JAVA2D);
  
  img.beginDraw();
  img.textFont(font);
  img.fill(cl);
  img.text(msg, 0, size - textDescent());
  img.endDraw();
  
  img.updatePixels();

  int w = width / BUTTERFLY_SIZE, h = height / BUTTERFLY_SIZE;
  float hConv = img.width / float(w), vConv = img.height / float(h);
  
  LinkedList list = new LinkedList();
  for(int col=0; col<w; col++)
    for(int row=0; row<h; row++) {
      color pixel = img.get(int(col * vConv),int(row * hConv));
      if(alpha(pixel) != 0)
        list.addLast(new Butterfly(col * BUTTERFLY_SIZE, row * BUTTERFLY_SIZE, pixel));
    }
  
  Butterfly bfs[] = new Butterfly[list.size()];
  for(int i=0; i<bfs.length; i++)
      bfs[i] = (Butterfly) list.get(i);

  return bfs;
}

class Butterfly {
  color cl;
  float x, y, dx, dy, origx, origy;
  float speed = 1.5, steeringSpeed = PI / 16;
  float angle, size;
  boolean moving;
  
  int anim;
  
  Butterfly(float origx, float origy, color cl) {
    this.origx = origx;
    this.origy = origy;
    this.cl = cl;

    x = random(0, width);
    y = random(0, height);
//    x = origx; y = origy;
    angle = random(0, TWO_PI);
    size = random(BUTTERFLY_SIZE * 0.6,BUTTERFLY_SIZE);
    
    moving = false;
  }
  
  void draw() {
//    noStroke();
    fill(cl);
    pushMatrix();
    translate(x,y);
    rotate(angle + HALF_PI);
    
    float width = size * map(anim <= ANIM_HALF ? anim : ANIM_LENGTH - anim, 0, ANIM_HALF, 0.5, 0.2);
    ellipse(-width / 2, 0, width, size);
    ellipse(width / 2 + 1, 0, width, size);
    popMatrix();
  }
  
  boolean atDestination() {
    return dist(x, y, dx, dy) <= 2;
  }
  
  boolean isMouseNear() {
    return dist(x, y, mouseX, mouseY) <= size * 3;
  }
  
  void move() {
    float steer = atan2(dy - y, dx - x) - angle;
    if(steer < -PI) steer += TWO_PI;
    else if(steer > PI) steer -= TWO_PI;
    
    angle += constrain(steer, -steeringSpeed, steeringSpeed);
    x += speed * cos(angle);
    y += speed * sin(angle); 
  }
  
  void pickDestination() {
    if(dist(origx, origy, mouseX, mouseY) <= size) {
      float angle = random(0, PI);
      float dist = random(10,30);
      dx = origx + dist * cos(angle);
      dy = origy + dist * sin(angle);
    }
    else {
      dx = origx;
      dy = origy; 
    }
    
    moving = true;
  }
  
  void pickRandomDestination() {
    dx = random(0,width);
    dy = random(0,height); 
    
    moving = true;
  }
  
  void update() {
    if(!moving && !atDestination()) {
      if(isMouseNear())
        pickDestination();
    }
    else {
      if(atDestination()) {
        if(!isMouseNear())
          moving = false;
        else
          pickDestination();
      }
      
      move();
      if(++anim > ANIM_LENGTH)
        anim = 0;
    }
  }
}


