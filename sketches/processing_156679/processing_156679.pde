
//Dynamic 2D Waves
/*****************
source http://gamedev.tutsplus.com/tutorials/implementation/make-a-splash-with-2d-water-effects
******************/

int numCols=160;
Water[] water=new Water[numCols];
float ten=0.025;
float damp=0.025;
float spread=0.001;
Stone stone;

void setup() {

  size(800, 480);

  for (int i=0;i<numCols;i++) {

    water[i]=new Water(i*5, 500, 240, 240, 0);
  }

  stone=new Stone(new PVector(random(width), -30));
}


void draw() {

  fill(0, 20);
  noStroke();
  rect(0, 0, 800, 480);

  stone.run();

  if (stone.pos.y>240) {
    stone.pos.y=200-random(1000);
    stone.pos.x=random(width);
    stone.vel.y=0;
    stone.alpha=255;
  } 

  for (int i=0;i<numCols;i++) {

    water[i].display();
    water[i].update(damp, ten);

    if (stone.pos.y<240 && stone.pos.y+stone.vel.y>=240) {

      water[int(stone.pos.x/5)].h=stone.vel.y*stone.vel.y*5;
      stone.alpha=0;
    }

    float[] lDeltas = new float[numCols];
    float[] rDeltas = new float[numCols];

    for (int j=0;j<8;j++) {

      for (int l=0;l<numCols;l++) {
        if (l>0) {
          lDeltas[l]=spread * ( water[l].h - water[l-1].h);
          water[l-1].spd+=lDeltas[l];
          water[l - 1].h += lDeltas[l];
        }

        if (l<numCols-1) {

          rDeltas[l] = spread * ( water[l].h -  water[l+1].h);
          water[l+1].spd += rDeltas[l];
          water[l + 1].h += rDeltas[l];
        }
      }
    }
  }
}

class Stone {

  PVector pos;
  PVector vel;
  PVector acc;
  float alpha;

  Stone(PVector p) {
    pos=p.get();
    acc =new PVector(0, 0.25);
    vel = new PVector(0, 2);
    alpha=255;
  }

  void run() {
    vel.add(acc);
    pos.add(vel);
    display();
  }

  void display() {
    noStroke();
    fill(255, alpha);
    ellipse(pos.x, pos.y, 1, 1);
  }
}

class Water {

  float x, y, h, spd, targetHeight;

  Water(float _x, float _y, float _h, float th, float s) {

    targetHeight=_h;
    h=th;
    spd=s;
    x=_x;
    y=_y;
  }

  void update(float damp, float ten) {
    float x=targetHeight-h;
    spd+=ten*x-spd*damp;
    h+=spd;
  }

  void display() {
    stroke(#BFFF00, 255-h/2);
    beginShape(LINES);
    vertex(x, h);
    vertex(x+5, h);
    endShape();
  }
}
