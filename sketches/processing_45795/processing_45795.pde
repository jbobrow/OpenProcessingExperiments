
/*por Eduardo H Obieta
hackpact de arte generativo
www.artegenerativo.laad.com.mx
*/
int ca = 5;
float[] vari, rx, ry, rz, distx, multix, multiy, multiz;


void setup() {
  size(800, 400, P3D);
  background(255);
  smooth();
  distx= new float[ca];
  vari= new float[ca];
  rx= new float[ca];
  ry= new float[ca];
  rz= new float[ca];
  multix= new float[ca];
  multiy= new float[ca];
  multiz= new float[ca];

  for (int i=0; i<ca; i++) {
    rx[i]=random(-180, 180);
    ry[i]=random(-180, 180);
    rz[i]=random(-180, 180);
    distx[i]=random(450, 600);
    multix[i]=random(0.0001, 0.0006);
    multiy[i]=random(0.0001, 0.0006);
    multiz[i]=random(0.0001, 0.0006);
  }
}


void draw() {

  translate(width/2, height/2);
  for (int i=0; i<ca ;i++) {

    vari[i]=150+noise(distx[i])*30;
    rotateX(rx[i]+millis()*multix[i]);
    rotateY(ry[i]+millis()*multiy[i]);
    rotateZ(rz[i]+millis()*multiz[i]);
    stroke(121, 87, 9);
    strokeWeight(1);
    point(vari[i], 0);

    strokeWeight(0.1);
    stroke(121, 87, 9, 20);
    line(vari[i], 0, 100, 0);
    distx[i]+=0.1;
  }
}


