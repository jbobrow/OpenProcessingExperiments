
float xpos = 0;
float xspeed = 3;
float xdirection = 0.3;

float z = 0;
float z2 = 0;
int col[] = new int[3];
PImage bg;
int a; 

void setup() 
{
  size(800,600,P3D);
 
  //frameRate(30);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of "milan_rubbish.jpg"
  // is 200 x 200 pixels.
  //bg = loadImage("fondo.jpg");
}

void draw() 
{

  background(0);
  //background(bg);

  xpos =  xpos + ( xspeed * xdirection );

  if (xpos > 480 || xpos < 0){
    xdirection *= -1;
  }
  // Orange point light on the right
  pointLight(150, 100, 0, // Color
  200, -150, 0); // Position

  // Blue directional light from the left
  directionalLight(200, 102, 0, // Color
  1, 0, 0); // The x-, y-, z-axis direction

  // Yellow spotlight from the front
  spotLight(255, 255, 20, // Color
  0, 40, 200, // Position
  0, -0.5, -0.5, // Direction
  PI / 2, 2); // Angle, concentration

  
  
  fill(255,0,0,20);
 stroke(0,200,255);
 pushMatrix();
 translate(-mouseX,-mouseY,1800*tan(z2/25));
  sphere(100);
 popMatrix();
  pushMatrix();
 translate(-mouseX,-mouseY,1800*tan(z2/35));
  sphere(100);
 popMatrix(); pushMatrix();
 translate(-mouseX,-mouseY,1800*tan(z2/55));
  sphere(100);
 popMatrix(); pushMatrix();
 translate(-mouseX,-mouseY,1800*tan(z2/15));
  sphere(100);
 popMatrix();
 
  z2++;
  //saveFrame("####.png");
}





