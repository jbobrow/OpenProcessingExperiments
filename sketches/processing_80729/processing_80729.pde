
Bioform bf;
Bioform bf2;
Bioform bf3;

void setup() {
  background(0);
  size(200, 200);
  bf = new Bioform(width, height);
    bf2 = new Bioform(width, height);
      bf3 = new Bioform(width, height);
//  float w = width;
//float h = height;
}

void draw() {
  background(0);
smooth();
noStroke();
fill(#FFFFFF,50);
translate(width/4,height/4);
scale(.5,.5);
  bf.appear();
  scale(.7,.7);translate(width/10,height/10);
    bf2.appear();translate(width/10,height/10);
    scale(.7,.7);
    bf3.appear();
  filter(BLUR, 8);
}
class Bioform {


  float [] p1x;
  float [] p1y;
  float [] p2x;
  float [] p2y;
  float [] c1x;
  float [] c1y;
  float [] c2x;
  float [] c2y;

  Bioform(float w, float h) {   
    p1x = new float[4];
    p1x[0] = w/2+random(-w/4, w/4); 
    p1x[1] = w+random(-w/4, w/4); 
    p1x[2] =  w/2+random(-w/4+w/4);
    p1x[3] = random(-w/4, w/4);

    p1y = new float[4];
    p1y[0] = 0+random(-h/4, h/4);
    p1y[1] = h/2+random(-h/4, h/4);
    p1y[2] = h+random(-h/4, h/4);
    p1y[3] = h/2+random(-h/4, h/4);


    p2x = new float[4];
    p2x[0] =  w+random(-w/4, w/4); 
    p2x[1] =  w/2+random(w/2-w/4, w/2+w/4);
    p2x[2] = random(-w/4, w/4);
    p2x[3] = w/2+random(-w/4, w/4);

    p2y = new float[4];
    p2y[0] = h/2+random(-h/4, h/4);
    p2y[1] = h+random(-h/4, h/4);
    p2y[2] = h/2+random(-h/4, h/4);
    p2y[3] = 0+random(-h/4, h/4);


    c1x = new float[4];
    c1x[0] = (3*w)/4+random(-w/4, w/4);
    c1x[1] = w+random(-w/4, w/4); 
    c1x[2] = w/4+random(-w/4, w/4);
    c1x[3] = random(-w/4, w/4);

    c1y = new float[4];
    c1y[0] = random(-h/4, h/4);
    c1y[1] = (3*h)/4+random(-h/4, h/4);
    c1y[2] = h+random(-h/4, h/4);
    c1y[3] = h/4+random(-h/4, h/4);



    c2x = new float[4];
    c2x[0] = w+random(-w/4, w/4); 
    c2x[1] = (3*w)/4+random(-w/4, w/4);
    c2x[2] = random(-w/4, w/4);
    c2x[3] = w/4+random(-w/4, w/4);

    c2y = new float[4];
    c2y[0] = h/4+random(-h/4, h/4);
    c2y[1] = h+random(-h/4, h/4);
    c2y[2] = (3*h)/4+random(-h/4, h/4);
    c2y[3] = random(-h/4, h/4);
  }

  void appear() {
    beginShape();
    for (int i=0;i<4;i++) {

      vertex(p1x[i], p1y[i]);
      bezierVertex(c1x[i], c1y[i], c2x[i], c2y[i], p2x[i], p2y[i]);
    }
    endShape();
  }
}
void mousePressed()
{
  setup();
}


