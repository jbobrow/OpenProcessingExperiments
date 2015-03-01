
int num = 91;//a number of waves
int frames = 72;//1cycle

float posA = -100;
float posB = 600;
float margin = 20;
float interval = 12;//wave interval
float shadowWidth = 1.5;
float ampCont = 2; //Amplitude controller
float phaseCont = 20;//phase controller

Wave[] waves = new Wave[num];


void setup() {
  frameRate(24);
  colorMode(HSB, 360, 100, 100, 255);
  noStroke();
  size(500, 500);
  background(0);

  for (int i=0; i<num; i++) {
    waves[i] = new Wave(height+130-i*interval, i);
  }
}


void draw() {
  fill(0, 20);
  rect(0, 0, width, height);

  for (int i=0; i<num; i++) {
    waves[i].update();
  }
  //  saveFrame("render/render_####.tif");
}


class Wave {
  float amp;
  float theta;
  float offset;
  int index;

  Wave(float _offset, int _index) {
    offset = _offset;
    index = _index;
  }

  void update() {
    shapeDraw();//draw wave plane
  }

  void shapeDraw() {
    beginShape();//_______________________________________beginShape()
    
    curveVertex(x, y+offset);
    for (int x=int (-margin); x<int(width+margin); x+=5) {
      theta = TWO_PI/width*x + frameCount%72*TWO_PI/frames + float(index)/phaseCont;
      amp = sin(theta)*50 + cos(theta*2)*40 + sin(theta*3) * 20 + sin(theta*5) * 20 +cos(theta*7)*40;
      float y;
      if (x<posA||x>posB) {
        y = 0;
      } else {
        y = ampCont * amp * sq(sin(map((x-posA), 0, posB-posA, 0, -PI)));
      }     
      float h = index*100/num+120;
      float s = map((float(index)*360/num), 0, 360, 100, 60);
      float b = map((float(index)*360/num), 0, 360, 40, 100);
      fill(color(h, s, b, 10));//wave plane color

      curveVertex(x, y+offset);
    }
    curveVertex(width+margin, -margin);
    curveVertex(-margin, -margin);
    curveVertex(-margin, -margin);

    endShape();//_______________________________________endShape()
  }
}

