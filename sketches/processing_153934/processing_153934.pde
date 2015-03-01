
int num = 51;//a number of waves
int frames = 72;//1cycle

float posA = 150;
float posB = 450;
float margin = 20;
float interval = 10;//wave interval
float shadowWidth = 1.5;
float ampCont = 1; //Amplitude controller
float phaseCont = 7;//phase controller

Wave[] waves = new Wave[num];


void setup() {
frameRate(24);
  colorMode(HSB, 360, 100, 100, 255);
  noStroke();
  size(500, 500);
  background(0, 100, 40);

  for (int i=0; i<num; i++) {
    waves[i] = new Wave(height-i*interval, i);
  }
}


void draw() {
  background(0, 100, 40);
  for (int i=0; i<num; i++) {
    waves[i].update();
  }
//  saveFrame("render/render_####.tif");
}


class Wave {
  float amp;
  float theta;
  float offset, offset2;
  float offsetShadow;
  int index;

  Wave(float _offset, int _index) {
    offset = _offset;
    offsetShadow = offset+shadowWidth;
    index = _index;
  }

  void update() {
    shapeDraw(true);//draw wave shadow
    shapeDraw(false);//draw wave plane
  }

  void shapeDraw(boolean shadow) {
    beginShape();//_______________________________________beginShape()
　　
　　curveVertex(x, y+offset);
    for (int x=int (-margin); x<int(width+margin); x+=5) {
      theta = TWO_PI/width*x + frameCount%72*TWO_PI/frames + float(index)/phaseCont;
      amp = sin(theta)*50 + cos(theta*2)*40 + sin(theta*3) * 20;
      float y;
      if (x<posA||x>posB) {
        y = 0;
      } else {
        y = ampCont * amp * sq(sin(map((x-posA), 0, posB-posA, 0, -PI)));
      }     

      if (shadow) {
        offset2 = offsetShadow;
        float h = index*360/num;
        float s = 100;
        float b = 100;
        fill(color(h, s, b, 48));//wave shadow color
      } else {
        offset2 = offset;
        float h = index*360/num;
        float s = map((float(index)*360/num), 0, 360, 100, 0);
        float b = map((float(index)*360/num), 0, 360, 40, 100);
        fill(color(h, s, b));//wave plane color
      }

      curveVertex(x, y+offset2);
    }
    curveVertex(width+margin, -margin);
    curveVertex(-margin, -margin);
    curveVertex(-margin, -margin);

    endShape();//_______________________________________endShape()
  }
}

