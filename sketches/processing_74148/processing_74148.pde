
// Jeffrey C. CP1 Rotating Cube October 5, 2012
//URL: http://www.openprocessing.org/user/21148
float cz=600;
float a=.5;
float vx=250;
float vy=250;
float vz=0;
void setup() {
  size(500, 500, P3D);
}

void draw() {
  background(0);
  fill(0,150,50,100);
  translate(vx,cz,cz);
  rotateX(cz/50.0);
  box(100);
  translate(-vx,-vy,-cz);
  camera(550,50,-300,vx,cz,cz,0,1,0);
  cz=cz-a;
  a=a+.01*2.5;
  if(cz<=-300){
    a=a-.02*2.5;
    println(cz);
  }
  else{
    a=a+.01;
  }
  pointLight(255,255,255,250,250,0);
}


