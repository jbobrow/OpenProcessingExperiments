
PVector location; 
PVector velocity; 
int amount = 300; 
//could replace nums with "amount" 
//to make it easier to change them

int[] x = new int[500]; 
// [] brackets tell it that its an array
int[] y = new int[500];
int[] z = new int[500];

float sphere_move = 0; 

void setup() {
  size(1200,1000, P3D);
  background(0);
 
  noFill();
  stroke(255);
  location = new PVector(100,100,100); 
  velocity = new PVector(2.5,5,5);
  
   for(int i = 0; i<100; i++) { 
    x[i] = int(random(-750, 750)); 
    y[i] = int(random(-750, 750)); 
    z[i] = int(random(-750, 750)); 
   }
  
}
 

 
void draw() {
  background(0);
  translate(width/2, height/2); 
  if (mousePressed == true) {
  rotateY(frameCount / 2);
  } else { 
    rotateY(frameCount / 175.0);
  }
  box(500); 
  //box(1000);
 

  location.add(velocity);


  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }
  
  if ((location.z > 300 || location.z < 0)) { 
    velocity.z = velocity.z * -1;
  } 
 
  
  

  box(location.x,location.y,location.z);
  
  sphere(67.5);
  
 
  
  for(int i = 0; i<100; i++) { 
    point(x[i], y[i], z[i]);
  }
  
}
  
  
  /* saveFrame("frame-####.tif");
  if(frameCount > 2500) {
    noLoop();
 }
  
  println(frameCount);
  
  */ 

class PVector {
 
  float x;
  float y;
  float z;
 
  PVector(float x_, float y_, float z_) {
    x = x_;
    y = y_;
    z = z_;
  }
 

  void add(PVector v) {
    y = y + v.y;
    x = x + v.x;
    z = z + v.z;
  }
}


