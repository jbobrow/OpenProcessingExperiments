
int halfX, halfY;
float r, rote, roteStep;
int step;
float noiz;
int ripples;
float rippleRote;


void setup () {
  size(600, 600);
  halfX = width /2;
  halfY = height /2;
  r = width /8;
  step = 60;
  roteStep = 0.1;
  rote = 0;
  noiz = random(100.0);
  ripples = 15;
  rippleRote = random(10.0);

  smooth();
  background(0);
  colorMode(HSB, 360, 100, 100, 100);
}

void draw () {
  fill(0, 0, 0, 16);
  rect(-10, -10, width+10, height+10);
  noFill();
  translate(halfX, halfY);

  for (int k=3; k>0; k--) {
    for (int j=ripples ; j>1; j--) {
      stroke((160+((k-1)*30))+j*3, 100, 60-(j*(60/ripples)));
      pushMatrix();
      beginShape();
      float[] xs = {};
      float[] ys = {};
      //    rotate(radians(rote +(j*(4*noise(rotNoiz)))));
      rotate(radians(rote + (j* (sin(rippleRote+k)*10) )));

      for (int i=0; i<360; i+=step) {
        float ss = sin(radians(i)) * (r+(j*8)) * (pow(20,(noise(noiz+k, i+(j*0.02)))*1) *0.3) ;
        float sc = cos(radians(i)) * (r+(j*8)) * (pow(20,(noise(noiz+k, i+(j*0.02)))*1) *0.3) ;

        xs = append(xs, ss);
        ys = append(ys, sc);
        curveVertex(ss, sc);
      }

      for (int i=0; i<3; i++) {
        curveVertex( xs[i], ys[i]);
      }

      endShape();
      popMatrix();
    }
    noiz +=0.005;
    rote += roteStep;
  }
  rippleRote += 0.01;
}

