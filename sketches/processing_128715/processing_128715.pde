
//Cube Rotation Demonstration 
//by: Pijus Zadeikis, 1/17/2014
//Creates a cube and axis lines that
// can be rotated with mouse and arrow
// key input while overlayed on top of 
// a reference cube.
void setup() {
  size(420, 360, P3D);
}
 int rotzfactor = 0; //z rotation factor controlled by up/down arrows
void draw() {
  //First I find all my rotation angles in radians so that center screen is (0,0)
  float rotx = (mouseY/360.0)*-2*PI+PI;
  float roty = (mouseX/420.0)*2*PI-PI;
  float rotz = rotzfactor*PI/36;
  background(0);
  stroke(0, 0, 200);
  line (0,20,420,20); // monitor bar
  fill(255);
  textSize(10); 
  text (" rotateX(" + rotx +" pi)"+" , rotateY("+roty/PI+" pi)"+" , rotateZ("+rotzfactor+"pi/36)", 0,10);
  fill(0, 0, 200);
  text (" Mouse controls X and Y, UP and DOWN controls Z", 0,22);
  
  translate(210, 180, 0); // center drawing start point in screen
  
  strokeWeight(1);
  stroke(50);
  line(-60, 0, 60, 0);       //
  line(0, 60, 0, -60);       // draw stationary axis lines
  line(0, 0, -60, 0, 0, 60); //
  strokeWeight(1);
  stroke(0, 150, 0);
  noFill();
  box(140);                  // draw stationary box
  
  
  rotateX(rotx);  //
  rotateY(roty);  // rotate drawing coordinates according to user input variables
  rotateZ(rotz);  //
  strokeWeight(2);
  stroke(255);
  line(-150, 0, 150, 0);       //
  line(0, 150, 0, -150);       // draw the rotating axis lines
  line(0, 0, -150, 0, 0, 150); // 
  strokeWeight(2);
  stroke(255, 0, 0);
  noFill();
  box(140); // draw rotating red box
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      rotzfactor++;
    }
    else if (keyCode == DOWN) {
      rotzfactor--;
    }
  }
}
