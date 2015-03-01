
StoneArch[] stonehenge = new StoneArch[16];
float spinner = 0.0;
void setup(){
  size(800,600,P3D);
  for(int i = 0; i < stonehenge.length; i++){
    stonehenge[i] = new StoneArch(0,0,0);
  }
}

void draw(){
  background(0);
  translate(width/2,height/2,-200);
  rotateY(spinner);
  spinner += 0.01;
  int i = 0;
  for(float ang = 0.0; ang < 2*PI; ang += PI/8){
    pushMatrix();
    rotateY(ang);
    translate(0,0,360);
    stonehenge[i].render();
    popMatrix();
    i++;
  }
}
class StoneArch{
  
  float x,y,z;
  float ang;
  
  StoneArch(float nx, float ny, float nz){
    x = nx;
    y = ny;
    x = nz;
  }
  
  void render(){
    pushMatrix();
    translate(x,0,z);
    
    //left piller
    translate(-50,0,0);
    fill(random(255),0,0);
    box(40,100,40);
    //right piller
    translate(100,0,0);
    fill(0,random(255),0);
    box(40,100,40);
    //top piller
    translate(-50,-70,0);
    fill(0,0,random(255));
    box(140,40,40);
    
    popMatrix();
  }
}


