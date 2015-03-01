
StoneArch[] StoneArch= new StoneArch[16];
float ang=0;


void setup(){
  size(800,600, P3D);
  for(int i=0; i<16; i++){
    StoneArch[i]= new StoneArch(0,0,0);
  }
}

void draw(){
  background(70);
  translate(width/2, height/2, -200);
  rotateY(ang);
  int i=0;
  for(float ang= 0.0; ang < 2*PI; ang += PI/8){
    pushMatrix();
    rotateY(ang);
    translate(0,0,360);
    StoneArch[i].render();
    popMatrix();
    i++;
  }
  ang+=.01;
}





class StoneArch{
  float x,y,z;
  float ang;
  
  StoneArch(float nx, float ny, float nz){
    x=nx;
    y= ny;
    z=nz;
  }
  
  void render(){
    pushMatrix();
    translate(x,0,z);
    
    //LEFT PILLER
    translate(100, 0,0);
    box(40,100,40);
    
    //TOP PILLER
     translate(-50, -70,0);
    box(140,40,40);
    
    popMatrix();
  }
}
