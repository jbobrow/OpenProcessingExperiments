
float sundia;
int sphdt;
int ordia[] = new int[7];
int placX[] = new int[7];
int placY[] = new int[7];
int orinc[] = new int[7];
int starX[] = new int[100];
int starY[] = new int[100];
int starZ[] = new int[100];
float rotX,rotY,rotZ;
 

void setup() {
  size(666, 666, P3D);
//  translate(width/2,height/2);
  sun();
  smooth();
}


void draw(){
//  rotX += 2;
//  rotY += 2;
//  rotZ += 2;
//  camera(rotX,rotY, 220,0,0,0,0,1,0);
  }

// generate a new solarsystem
void genes() {
  background(0);
  lights();
  smooth();
  noFill();
}

void rotate(){

}


void sun(){
  background(0);
  //sun no byouga
  translate(width/2,height/2);
  stroke(0);
  fill(255,0,0);
  sundia = int(random(20,25));
  sphdt = int(random(20));
  sphereDetail(sphdt);
  sphere(sundia);
  
  // orbit no byouga
  stroke(255,0,255,100);
  noFill();
  for(int i = 0;  i < 7; i++){
   ordia[i] = (int)random(100,600);
   placX[i] = (int)random(100,333);
   placY[i] = (int)random(100,333);
    ellipse(0,0,ordia[i],ordia[i]);
    rotateX(ordia[i]);
    rotateY(ordia[i]);
    pushMatrix();
    translate(placX[i],placY[i]);
    fill(random(255),0,random(255),100);
    sphere(10);
    popMatrix();
  }
  
  for(int p = 0; p < 100; p++){
    pushMatrix();
    starX[p] = (int)random(-666,666);
    starY[p] = (int)random(-666,666);
    starZ[p] = (int)random(-666,666);
    stroke(255);
    point(starX[p],starY[p],starZ[p]);
    popMatrix();
  }
}


void keyPressed(){
  if(key == '1'){
    sun();
  }
}

//
//void mouseMoved(){
// translate(0,0,mouseX); 
//}



