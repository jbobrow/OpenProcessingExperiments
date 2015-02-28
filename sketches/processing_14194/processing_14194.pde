
// width and height of character (screen)
int char_width = 800; //screen width
int char_height = 1000; //screen height
 
float radius = char_width*.1; //dynamic radius, s(width/.1)
int cX = char_width/-5 ;
int cY = char_height/-3;// changes rotation mode
 
float offset_step= 3;// step to change color range
int turn = 20; //change position of rainbow
 
void setup() {
  size(900,1000,P3D); // size of window. translating in 3d requires p3d or OPENGL as parameter to size. 
  background(0); // backround color is black
  colorMode(HSB,545); // color mode of character
  strokeWeight(19);// lineweight of moving character
  noFill();
  frameRate(60);// high frame rate for a smoother animation 
                //moving at 60 frames per second 
}
  
void draw() {
// clear screen
  fill(0,0);// at (0,0) when char rotates around, it wont leave a trail behind or a shadow. 
  noStroke();  
  translate(0,0,0); //translate (x,y,z) initially at zero 
  //x parameter defines left/right translation. 
  //The Y parameter defines the up/down motion. 
  //the Z parameter translates the character to move away or toward the screen. 
  //when Z is used p3d or OPENGL parameter is used in parralel. 
  rect(0,0,width*1,height*1);   
  translate(width/2,height/2,0); //translates to x, y, z of width/2, height/2, and zero

//rotate character in x and y axis // keeps significant digits
  rotateX(float(frameCount%600)/600*TWO_PI);  //rotates the object about the x-axis
  rotateY(float(frameCount%400)/400*TWO_PI);  //rotates the object about the y-axis
 
 
//draw screen

//creates a hole in a shape
  for (int a = 10; a < 450; a+=30) {   //sets up a for loop
    float r = radians(a - turn); // 360->2PI, 180->PI (variable r is in  radians, wher the angle changes from 10 to 450 degrees)
    stroke(floor(a+sin(((turn)%200)/360*TWO_PI)*50-20),300,360,30);  //floor- rounds up/down the value of the given parameter, stroke sets the color
    noFill();
    bezier(cX,cY,cX,  //bezier function draws the curve with vary as a function of r defined in radians above
    radius / 2 * cos(r), radius / 2 * sin(r) , cX*2/3,
    radius * cos(r + HALF_PI), radius * sin(r + HALF_PI), cX*1/4,
    radius * cos(r + PI), radius * sin(r + PI), 1);
   }   
} 

//

