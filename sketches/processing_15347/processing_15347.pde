


float xpos = 0;
float xspeed = 3;
float xdirection = 0.3;
float ypos = 0;
float[] k = new float[100];
float[] b = new float[100];
float[] c = new float[100];
float[] d = new float[100];
float f = 0.5;


float z = 0;
float z2 = 0;
int col[] = new int[3];
PImage bg;
int a; 

void setup() 
{
  size(1024,420,P3D);
  col[0]=255;
  col[1]=0;
  col[2]=0;
  //frameRate(30);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of "milan_rubbish.jpg"
  // is 200 x 200 pixels.
  //bg = loadImage("fondo.jpg");
  frameRate(7);
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
  pointLight(255, 255, 255, // Color
  200, 40, 0); // Position

  // Blue directional light from the left
  directionalLight(200, 102, 0, // Color
  mouseX, mouseY, 0); // The x-, y-, z-axis direction

  // Yellow spotlight from the front
  spotLight(255,255,255, // Color
  mouseX, mouseY, 0, // Position
  0, -0.5, -0.5, // Direction
  PI / 2, 2); // Angle, concentration

  
  
  fill(255,255,255,20);
 stroke(0,100,255);

 for(int i=0;i < 100;i++)  {
      k[i]=random(0,210);
      b[i]=random(0,100);
      c[i]=random(0,512);
      d[i]=random(0,200);  
   pushMatrix();
 translate(c[i],k[i],1800*tan(z2/b[i]));
  box(100);
 popMatrix();
  fill(255,255,255,20);
 stroke(255,0,0);

 for(int f=0;f < 100;f++)  {
      k[f]=random(0,210);
      b[f]=random(0,100);
      c[f]=random(0,512);
      d[f]=random(0,200);  
   pushMatrix();
 translate(mouseX,k[i],1800*tan(z2/b[i]));
  box(100);
 popMatrix();
 
  z2++;
  //saveFrame("####.png");
}


}
}


