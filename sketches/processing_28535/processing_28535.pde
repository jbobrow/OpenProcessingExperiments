
void setup() {
  frameRate(10);
  size(640, 480, P3D); 
  lights();
}

void draw() {
  background(120);
  //use mouseX and mouseY to determine rotation angle of
  //x and y axes; center of window is neutral (no rotation);
  //far left is -PI radians (-180deg) for x,
  //far right is +PI radians (+180deg) for x,
  //top is +PI radians for y, bottom is -PI radians for y
  float rotX = (mouseX * (2*PI/width) - PI);
  float rotY = (mouseY * (2*PI/height) - PI);
  
  pushMatrix();  //remember current coordinate system
  //temporary origin --- (0,0,0) --- is center of window
  translate(width/2, height/2, 0); 
  rotateY(rotX);
  rotateX(rotY);
  stroke(0,0,0);
  fill(255,200,100);
  box(100); //center is @ origin, side length is 100
  
  stroke(255,0,0); 
  line(-150,0,150,0);      //x-axis:  red
  
  stroke(0,0,255); 
  line(0,-150,0,150);      //y-axis:  blue
  
  stroke(0,255,0);    
  line(0,0,-150,0,0,150);  //z-axis:  green
  
  popMatrix();

  fill(0,0,255);
  int rotXDeg = (int)(rotX * 180/PI + .5);
  int rotYDeg = (int)(rotY * 180/PI + .5);
  textSize(24);
  text("rotating x-axis by " + rotXDeg +"deg,\n" 
    + "rotating y-axis by "+rotYDeg+"deg",
    20,30);
  text("center mouse in window to see zero rotation",20,height-10);

}


