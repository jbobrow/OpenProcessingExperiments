
float gearRotatorAng = 0.0;
Stone[] stones = new Stone[16];


void setup(){
  size(600,400,P3D);
  for(int i =0; i < stones.length; i ++){
    stones[i] = new Stone(180,0,100, i*PI/8);
  }
}

void draw(){
  background(100);
  noStroke();
  translate(width/2, height/2,-200);
//  rotateX(-PI/4);
  rotateZ(gearRotatorAng);
  for(int i=0; i<stones.length; i++){
    float ang = i*PI/8;
    rotateZ(ang);
    stones[i].render();
//    stones[i].update();
  }
  gearRotatorAng += .01;
}

class Stone {
  int x, y, z;
  float ang;
  
  Stone(int nx, int ny, int nz, float _ang){
    x = nx;
    y = ny;
    z = nz;
    ang = _ang;
  }
  
  void render(){
    pushMatrix();
    fill(0);
    translate(x, 0, z);

    translate(-50, 0,0);
    box(40,100,40);
    
    translate(100,0,0);
    box(40,100,40);
    
    translate(-50,-70, 0);
    box(140,40,40);
    
    popMatrix();
  }
}


