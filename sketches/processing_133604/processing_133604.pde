


int f, elements = 80;
float[] sz = new float[elements];
float[] rot = new float[elements];
float theta, rotOff, scal,x,y;
boolean save;

void setup() {
  size(400, 400);
  background(20);
  rectMode(CENTER);
  float Sz = 0;

  for (int i=0; i<elements; i++) {

    if (i<elements/2) {
      Sz = elements/2 + 2*i;    
    } else {
      Sz = elements/2 + 2*(elements-i);
    }
       
    sz[i] = Sz ;
    rot[i]= PI/elements*i;
  }
}

void draw() {
  background(20);
  translate(width/2, height/2);

  for (int i=0; i<elements; i++) {
    pushMatrix();
    rotOff = map(sin(rot[i]+theta*2), -1, 1, -90, 120);
    scal = map(cos(rot[i]+theta), -1, 1, .5, 1);
    x = map(sin(rot[i]+theta), -1, 1, -20, 100);
    y = map(sin(rot[i]+theta*2), -1, 1, -40, 120);     
    rotate(radians(rotOff));
    stroke(255,150);
    noFill();
    ellipse(x, y, sz[i]*scal, sz[i]*scal);
    popMatrix();
  }
  theta += 0.0523/2;

  if (save) {
    if (frameCount%4==0 && frameCount<f+241) saveFrame("image-###.gif");
  }
}

void mouseClicked() {
  setup();
}

void keyPressed() {
  f = frameCount;
  save = true;
}

