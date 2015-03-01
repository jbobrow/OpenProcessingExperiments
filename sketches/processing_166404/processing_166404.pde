
void setup() {
  size(500, 500);
  background(255);
}

float dist=0.0;
float sizer=5.0;
int num=300;
float factor=2.0001;
float rot = 2.001;
int forward=1;

void draw() {
  background(255);
  translate(width/2,height/2);
  for (int i=0;i<num;i++) {
    fill(255,0,0);
    ellipse(0,dist+factor*i,sizer,sizer);
    ellipse(0,dist-factor*i,sizer,sizer);
    fill(0,255,0);
    ellipse(dist+factor*i,0,sizer,sizer);
    ellipse(dist-factor*i,0,sizer,sizer);
    rotate(PI/rot);
  }
  if (rot<=2) {
    forward=1;
  }
  if (rot>=198000) {
    forward=-1;
  }
  if (rot>=0 && rot<4) {
    rot=rot+(0.001*forward);
  }
  if (rot>=4 && rot<20) {
    rot=rot+(0.005*forward);
  }
  if (rot>=20 && rot<300) {
    rot=rot+(1*forward);
  }
  if (rot>=300 && rot<10000) {
    rot=rot+(100*forward);
  }
  if (rot>=10000 && rot<=198100) {
    rot=rot+(1000*forward);
  }
}


