
float gearRotatorAng = 0.0;
stoneArch[] stoneHenge = new stoneArch[16];

void setup(){
  size(600,400,P3D);
  for(int i = 0; i < 16; i++){
    stoneHenge[i] = new stoneArch(0,0,0);
  }
}

void draw(){
  background(240,250,255);
  
  translate(width/2,height/2,-250);
  rotateX(-PI/8);
  rotateY(gearRotatorAng);
  
  int i = 0;
  for(float ang = 0; ang <= 2*PI; ang+=PI/6){
    pushMatrix();
    rotateY(ang);
    translate(0,0,360);
    stoneHenge[i].render();
    popMatrix();
    i++;
  }
  gearRotatorAng += .001;
}

class stoneArch{
  
  float x,y,z;
  float ang;
  
  stoneArch(float nx, float ny, float nz){
    x = ny;
    y = ny;
    z = nz;
    
  }
  
  void render(){
    
    pushMatrix();
    translate(x,0,z);
    fill(random(255),255,255);
    
    //LEFT Pillar
    translate(-50,0,0);
    box(40,100,40);
    //RIGHT Pillar
    translate(100,0,0);
    box(40,100,40);
    //Top Piller
    translate(-50,-70,0);
    box(140,40,40);
    
    popMatrix();
  }
  
}
