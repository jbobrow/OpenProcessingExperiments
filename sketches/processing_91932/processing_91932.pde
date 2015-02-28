
PShape head;
float h=500, w=500;
void setup() {
  size(500, 500);
  smooth();
  
  noStroke();
  fill(#ffffff);
    rect(0, 0, width, height);
    float sp = 100;
    for (int j=0;j<5;j++) {
      for (int f=0;f<5;f++) {
       make(sp/2+j*sp, sp/2+f*sp);
        //make(random(h),random(w));
      }
    }
}

void draw() {
  fill(#ffffff);
  if (mousePressed) {
    noStroke();
    rect(0, 0, width, height);
    float sp = 100;
    for (int j=0;j<5;j++) {
      for (int f=0;f<5;f++) {
       make(sp/2+j*sp, sp/2+f*sp);
        //make(random(h),random(w));
      }
    }
  }
}


float n = 10;

void make(float x, float y) {
  colorMode(HSB);
  fill(random(255),55,155);
  color hc = color(123, 55, random(55)+20);
  
  pushMatrix();
  translate(x, y);
  beginShape();
  float b = random(2)*10+15;
  float hh=random(20)+b, ww=random(10)+b, e = random(5)+4, s = 10;
  int off = int(random(n));
  for (float i=0;i<n+1;i++) {
    vertex(sin((i+off)/n*PI*2)*ww+random(s)-s/2, cos((i+off)/n*PI*2)*hh+random(s)-s/2);
  }

  endShape();
  stroke(hc);
  float mp = random(2)+3;
  float mw = random(12)+5;
  beginShape();
  for (float h =0;h<mp;h++) {
    vertex(-mw/2+mw/mp*h+random(s)-s/2, hh/2+random(s)-s/2);
  }
  endShape();

  noStroke();
  fill(hc);
  ellipse(-ww/4+random(s)-s/2, -hh/4+random(s)-s/2, e, e);
  e = random(5)+4;
  ellipse(ww/4+random(s)-s/2, -hh/4+random(s)-s/2, e, e);
  popMatrix();
}
void keyPressed() {
  if (key == 's') {
    saveFrame("images/screen_#####.png");
  }
}
