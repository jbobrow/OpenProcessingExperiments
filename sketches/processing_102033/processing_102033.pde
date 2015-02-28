
ArrayList blocks;
int frm = 0, repnum = 0;


void setup() {
  size(1200, 800);
  blocks = new ArrayList();
  noStroke();
  smooth();
}

void draw() {
  background(0);
  for(int i = blocks.size() - 1; i >= 0; i--){
    Block now = (Block) blocks.get(i);
    now.increment();
    if(now.inc > now.lngth){
      blocks.remove(i);
    } else blocks.set(i, now);
  }
  
  
  for( int i = 0; i < blocks.size(); i++){
    Block now = (Block) blocks.get(i);
    now.display();
  }
  
  rndmfrm();
}

void rndmfrm(){
  frm++;
  if(frm > repnum){
    blocks.add(new Block(int(random(0, width)), int(random(0, height)), int(random(350, 450))));
    frm = 0;
    repnum = int(random(200, 350));
  }
}

void mousePressed(){
  blocks.add(new Block(mouseX, mouseY, int(random(450, 750))));
}
  
class Block {
  int xloc, yloc, inc, lngth, inloop, numloop, hlf;
  float mul;
  color col;


  Block(int xloc, int yloc, int lngth) {
    this.xloc = xloc;
    this.yloc = yloc;
    this.lngth = lngth;
    this.mul = 10;
    this.hlf = 0;
    this.inloop = 0;
    this.inc = 0;
    this.numloop = 0;
    rectMode(CENTER);
    stroke(255);
  }

  void increment() {
    inc++;
    inloop++;
    if (inloop > numloop) {
      inloop = 0;
      numloop = int(random(2, 15));
      strokeWeight(int(random(1.5, 5.5)));
      col = color(random(255.5), random(255.5), random(255.5));
      hlf = int((inc - lngth) * random(0.5, 1.5));
    }
  }

  void display() {
    fill(col);
    rect(xloc, yloc, hlf, hlf);
  }
}



