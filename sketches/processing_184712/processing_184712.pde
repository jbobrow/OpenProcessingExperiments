
StoneArch[] stones= new StoneArch[16];
float gearRotatorAng =0.0;
void setup(){
  size(800,800,P3D);
  for (int i = 0; i < 16; i ++) {
    stones[i] = new StoneArch(0, 0, 200);

}
}


void draw(){
  background(50);
  translate(width/2, height/2);
  rotateX(PI/4);
  int i= 0;
  for(float ang=0; ang<=2*PI; ang+=PI/8){
    pushMatrix();
    rotateZ(ang +gearRotatorAng);
    translate(180,0,100);
    stones[i].render();
    popMatrix();
    i++;
  }
  gearRotatorAng+= .001;
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
    translate(x,0,2);
    
    translate(-50,0,0);
    box(40,100,40);
    
    translate(100,0,0);
    box(40,100,40);
    
    translate(-50,-70,0);
    box(140,40,40);
    
    popMatrix();
  }
}


