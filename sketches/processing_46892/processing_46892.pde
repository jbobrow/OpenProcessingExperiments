
//Lápices de color
float ang=1, radio[], px[], py[], pz[], aleat[], vcol, rx;
int part = 500 ;
int s = second();

void setup() {
  size(800, 400, P3D);
  background(230);
  px = new float[part];
  py = new float[part];
  pz = new float[part];
  aleat = new float[part];
  radio = new float[part];
  smooth();
  vcol=random(20);

  for (int i=0; i<part; i++) {
    px[i] = random(500);
    py[i] = random(500);
    aleat[i] = random(-90, 90);
    radio[i]+=i*0.99;
  }
  rx=random(120, 150);
}

void draw() {
  rotateX(degrees(70));
  translate(0, -rx, -rx);
  stroke((1+sin(vcol))*100, (1+cos(vcol*0.7))*100, (1.3+sin(vcol))*100, 50);
  strokeWeight(0.8);
  pushMatrix();
  translate(width/2, height/2);

  for (int i=0;i<part;i++) {
    point(px[i], py[i], pz[i]);
    px[i]=cos(ang*aleat[i])*radio[i]+noise(50);
    py[i]=sin(-ang*aleat[i])*radio[i];
    pz[i]=pz[i]+sin(60);
    pz[i]+=0.001;
    radio[i]+=0.05;

    if (pz[i]<-600) {
      pz[i]=0;
      ang=1;
      rx=random(250, 300);
      vcol=random(20);
      radio[i]+=0.1;
    }
  }
  popMatrix();
  ang+=0.001;
  vcol+=0.01;
}


