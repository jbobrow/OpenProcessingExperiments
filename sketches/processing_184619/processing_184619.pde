
StoneArch[]  stoneHenge=new StoneArch[16];

float rotateAng=0.0;
void setup() {
  size(800, 600, P3D); 
  for (int i=0; i<16; i++) {
    stoneHenge[i]=new StoneArch(0, 0, 0);
  }
}
void draw() {
  background(50);
  translate(width/2, height/2, -200);
int i=0;
  for (float ang=0; ang<=2*PI; ang+=PI/8) {
    pushMatrix();
    rotateY(ang+rotateAng);
    translate(0,0,300);
    stoneHenge[i].render();
  popMatrix();
  i++;
  rotateAng+=.0001;
  }

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
 
    fill(#767474);
    pushMatrix();
    translate(x,0,z);
    
    //Left Piller
    translate(-50,0,0);
    box(40,100,40);
    //Right PIller
    translate(100,0,0);
    box(40,100,40);
     //Top PIller
    translate(-50,-70,0);
    box(140,40,40);
    
    popMatrix();
  }
}


