

float[] k = new float[100];
float[] b = new float[100];
float[] c = new float[100];
float[] d = new float[100];



float z = 0;
float z2 = 0;

PImage bg;
int a; 

void setup() 
{
  size(1024,420,P3D);
    
  //frameRate(30);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of "milan_rubbish.jpg"
  // is 200 x 200 pixels.
  //bg = loadImage("fondo.jpg");
}

void draw() 
{

  background(0);
  frameRate(10);
    
  //background(bg);

 
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

  
  
 
 stroke(255);

 for(int i=0;i < 100;i++)  {
      k[i]=random(0,420);
      b[i]=random(0,1024);
      c[i]=random(0,1024);
      d[i]=random(0,400);  
   pushMatrix();
    fill(k[i],b[i],d[i],50);
    stroke(k[i],b[i],c[i]);
 translate(mouseX,k[i],1800*tan(z2/b[i]));
  box(100);
 popMatrix();
 
  z2++;
  //saveFrame("#.png");
}


}


