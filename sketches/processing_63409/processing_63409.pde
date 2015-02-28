
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/59807*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/**Alcys_Gandhi
*
*fait le 4 juin 2012
*inspiré par http://www.openprocessing.org/sketch/59807
*/
PImage job;
ArrayList points;
int depart, nn;

void setup() { 
  job=loadImage("gandhi.png");
  job.loadPixels();
  size(500, 546, P3D);
  remplirPoints();
  depart=500;
  background(255);
  stroke(0);
}

void draw() {
  PVector v;
  if (points.size()>30) {
    nn=lePlusPres(depart);
    PVector vd=(PVector)points.get(depart);
    PVector vn=(PVector)points.get(nn);
    if (vd.dist(vn)<40) {
      strokeWeight((255-vn.z*0.5-vd.z*0.5)/95.0);
      line(vd.x, vd.y, vn.x, vn.y);
    }
    points.remove(depart);
    depart=(nn<depart)? nn: nn-1;
  }
  else {
    println("fini");
    noLoop();
  };
}
void remplirPoints() {
  points= new ArrayList();
  int  x, y;
   float c;
  while (points.size ()<12000) {
    x=round( random(1, job.width))-1;
    y=round(random(1, job.height))-1; 
  c=brightness(job.pixels[y*width+x]);
    if (random(0, 255-c)>50 )points.add(new PVector(x, y,c));
  }
}

int lePlusPres(int u) {
  PVector v1, v2;
  int res=0;
  float d=10000;
  v1=(PVector)points.get(u);
  for (int i=0;i<points.size()-1;i++) {
    if (i!=u) {
      v2=(PVector)points.get(i);
      float dp=v1.dist(v2);
      if (dp<d) {
        res=i;
        d=dp;
      }
    }
  }
  return res;
}


