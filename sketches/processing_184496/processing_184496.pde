
Stone[] stones = new Stone[16];
float rotateAng = 0;

void setup(){
  size(600,400, P3D);
  for(int i=0; i<stones.length; i++){
    stones[i] = new Stone(0,0,0);
  }
}

void draw(){
  background(50);
  translate(width/2, height/2,-300);
  rotateX(-PI/4);
  rotateY(rotateAng);
  int i=0;
  for(float ang = 0.0; ang <= 2*PI; ang += PI/8){
    pushMatrix();
    rotateY(ang);
    translate(0,0,400);
    stones[i].render();
    popMatrix();
    i++;
  }
  rotateAng += .01;
}



class Stone {
  int x, y, z;
  float ang;
  
  Stone(int nx, int ny, int nz){
    x = nx;
    y = ny;
    z = nz;

  }
  
  void render(){
    pushMatrix();
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


