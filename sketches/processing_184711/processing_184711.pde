
Stonearch stonearch;
float gearRotatorAng = 0.0;
void setup() {
  size(600, 400, P3D);
  translate(width/2,height/2);
  stonearch = new Stonearch (0, 0, 0);
}

void draw() {
  background(50);

  translate(width/2, height/2);
  rotateX(PI/4);
  for (float ang = 0; ang<=2*PI; ang+= PI/4) {
    pushMatrix();
    rotateZ(ang + gearRotatorAng);
    rotateX(-PI/2);
    translate (180, 0, 100);
    stonearch.render();
    box(50);
    popMatrix();
  }
  gearRotatorAng += .001;
}





class Stonearch{
  
  float x,y,z;
  float ang;

  
  Stonearch(float nx,float ny,float nz){
    x = nx;
    y = ny;
    z = nz;
  }
  
  void render(){
    
    pushMatrix();
    fill(random(255), random(255), random(255));
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
