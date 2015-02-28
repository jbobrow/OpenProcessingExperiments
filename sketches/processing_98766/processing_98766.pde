
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/14489*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//Animation animation1;

float xpos = 0;
float xspeed = 3;
float xdirection = 0.3;
float ypos = 0;
float yspeed = 3;
float ydirection = 0.3;
float zpos = 0;
float zspeed = 3;
float zdirection = 0.3;

float[] k = new float[100];
float[] b = new float[100];
float[] c = new float[100];
float[] d = new float[100];
float f = 0.5;


float z = 0;
float z2 = 0;


int a; 

void setup() 
{
  size(1024,420,P3D);
   
  //frameRate(30);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of "milan_rubbish.jpg"
  // is 200 x 200 pixels.
  //bg = loadImage("fondo.jpg");
  //animation1 = new Animation("PT_Shifty_", 8);

}

void draw() 
{

  background(255);
 // animation1.display(mouseX-200,mouseY-180);
  frameRate(10);
    
  //background(bg);
 
  xpos =  xpos + ( xspeed * xdirection );
   ypos =  ypos + ( yspeed * ydirection );
    zpos =  zpos + ( zspeed * zdirection );

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
  mouseX, mouseY,0, // Position
  0, -0.5, -0.5, // Direction
  PI / 2, 2); // Angle, concentration

  //animation1.display(mouseX-200,mouseY-180);
  
 
 

 for(int i=0;i < 100;i++)  {
      k[i]=random(0,420);
      b[i]=random(0,1024);
      c[i]=random(0,1024);
      d[i]=random(0,400);  
   pushMatrix();
    fill(255,100,200,40);
    noStroke();
 translate( b[i],k[i],1800*tan(z2/b[i]));
  sphere(100);
 popMatrix();
 
  z2++;
  //saveFrame("#.png");
 
}


}

// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}


