
/*por Eduardo H Obieta
 hackpact de arte generativo
 www.artegenerativo.laad.com.mx
 */

int pun=800, s, si, inicia=0;
float dista[], px[], py[], pz[], ang[], vel[];

void setup() {
  size(800, 400, P3D);
  background(0);
  px=new float[pun];
  py=new float[pun];
  pz=new float[pun];
  ang=new float[pun];
  vel=new float[pun];
  si=second();
}

void draw() {
  noStroke();
  fill(0, 5);
  rect(0, 0, width, height);
  frameRate(30);
  translate(0, height/2);
  stroke(255, random(0, 255));
  strokeWeight(random(1, 7));
  s=second();

  for (int i=0; i<pun; i++) {
    point(px[i]+i+0.005, py[i], pz[i]);
    if (s>=si+3) {
      inicia=1;
    }
    if (inicia==1) {
      vel[i]=random(0.00001, 0.00002);
      ang[i]+=i*vel[i];
      py[i]=sin(ang[i])*200;
      pz[i]=cos(ang[i])*200;
    }
  }
}


