
StoneArch[] arches= new StoneArch[16];
float gearRotatorAng=0.0;

void setup() {
  size(600, 400, P3D);
  for(int i =0; i<16; i++){
    arches[i]= new StoneArch(0,0,0);
  }
}

void draw() {
  background(50);
  translate(width/2, height/2, -300); 
 rotateY(gearRotatorAng);
  int i= 0;
  for (float ang= 0; ang<=2*PI; ang+=PI/8) {
    pushMatrix();
    rotateY(ang);
    translate(0, 0, 360);
   arches[i].render();
    popMatrix();
    i++;
  }
  gearRotatorAng +=.005;
}


class StoneArch{
  float x,y,z;
  float ang;
  
StoneArch(float nx, float ny, float nz){
  x=nx;
  y=ny;
  z=nz;
}

void render(){
  pushMatrix();
  translate(x,0,z);
  
translate(-50,0,0);
box(40,100,40);

translate(100,0,0);
box(40,100,40);

translate(-50,-70,0);
box(140,40,40);

popMatrix();
}
}
