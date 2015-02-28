
//declare vector variables
PVector location;
PVector velocity;
int colourChange;

void setup() {
  size(800,800, P3D);
  noStroke();
  
   //ball starting at .... x co and y co z co
  location = new PVector(0,0,0); 
  //speed at which ball moves etc xspeed yspeed zspeed
  velocity = new PVector(2, 0.5, 1);

}

void draw() {
  lights();
  background(0);
  
  // Change height of the camera with mouseY
  camera(30.0, mouseY, 220.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
   
   //location.x + velocity.x & location.y + velocity.y
   location.add(velocity);
   
   //touching edges? if the location is larger than width
   //change the direction of the velocity
   if ((location.x > 120 ) || (location.x< -120)) {
     velocity.x = velocity.x *-1;
     colourChange = 0;
     
   }
   //same as x
   if((location.y > 120 )||(location.y < -120)) {
     velocity.y = velocity.y *-1;
     colourChange = 100;
   }
   
   if((location.z > 0) ||(location.z < 270)) {
     velocity.z = velocity.z *-1;
     //colourChange = 180;
   }
   
   
   
  fill(255, colourChange, 0);
  pushMatrix();
  translate(location.x, location.y, location.z);
  sphere(30);
  popMatrix();
  
  fill(255, 70);
  box(300);
}
