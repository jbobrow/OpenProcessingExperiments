
int halfW, halfH, quarterW, quarterH;
float colorChange, brightChange;
segment s[];
int cnt;

//================================================================

void setup() {
  //setup display
  size(600,400);
  smooth();
  
  //setup constants
  halfW = width/2; quarterW = width/4;
  halfH = height/2; quarterH = height/4;
  cnt = 15;
  
  //setup segments
  s = new segment[cnt];
  for (int i=0; i<cnt; i++)
    s[i] = new segment(i);
}

//================================================================

void draw() {
  //draw cycle
  background(0);
  for (int i=0; i<cnt; i++)
    s[i].check();
}

//================================================================

class segment {
  PVector base; //position of the segment base (the middle of the base)
  float heartbeat; //used with perlin noise for smooth position changes
  float spd; //how fast the heartbeat changes (which translates to how fast the segment moves)
  int num; //keeps track of the order for color gradients
  //--------------------------------------
  segment(int orderNum) {
    spd = random(0.5, 1.5); //keeping it slow
    heartbeat = random(2000); //start off somewhere random
    base = new PVector(random(halfW) + quarterW, height); //base never changes
    num = orderNum; //nab the order num
  }
  //--------------------------------------
  void check() {
    PVector pos = new PVector( //this is the tip of segment
      noise(heartbeat*0.005, 0)*halfW + base.x - quarterW, 
      noise(0, (heartbeat + 1000)*0.005)*height);
    PVector posDir = new PVector( //this the bezier control point for the tip
      noise((heartbeat + 2000)*0.005, 0)*halfW + pos.x - quarterW, 
      noise(0, (heartbeat + 3000)*0.005)*halfH + pos.y - quarterH);
    PVector baseDir = new PVector(base.x, height - (height - pos.y)*0.5); //base control point
    float baseW = sqrt(baseDir.y/2); //the base is supposed to thicken as the segment shortens
    
//dynamically change color
colorChange = (heartbeat/30) % 100;
//brightness depends on the height of the element
brightChange = (height - posDir.y + 80) / height;
//putting it all together...
colorMode(HSB, 100, 100, 100);
fill(colorChange, num*100/cnt, num*100*brightChange/cnt);
stroke(colorChange, num*100/cnt, num*30/cnt);
    
    beginShape();
      vertex(base.x-baseW, base.y);
      bezierVertex(base.x-baseW, baseDir.y, posDir.x, posDir.y, pos.x, pos.y);
      bezierVertex(posDir.x, posDir.y, base.x+baseW, baseDir.y, base.x+baseW, base.y);
    endShape(CLOSE);

    heartbeat+=spd; //thump-thump
  }
  //--------------------------------------
}


