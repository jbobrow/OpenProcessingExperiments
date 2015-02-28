
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/12852*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//float xpos = 0;
float xspeed = 3;
float xdirection = 0.3;

float z = 0;
float z2 = 0;
int col[] = new int[3];
PImage bg;
PImage img;
PImage n;
int a; 
int b;
Animation animation1;
float xpos, ypos;
float drag = 1.0;
void setup() 
{
  size(500,375,P3D);
    animation1 = new Animation("PT_TeddyC_", 29);
  frameRate(30);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of "milan_rubbish.jpg"
  // is 200 x 200 pixels.
  bg = loadImage("city.jpg");

}

void draw() 
{
  
  
  //translate(-mouseX,-mouseY);
background(bg);

  
  xpos =  xpos + ( xspeed * xdirection );

  if (xpos > 480 || xpos < 0){
    //xdirection *= -1;
  }
 pushMatrix();
  noStroke();
  noTint();
  noFill();
   rect(0,0, width, height);
 popMatrix();
 
  pushMatrix();
   fill(col[0],col[1],col[2],75);
 // translate(100,30,100*sin(z2/5));
   //sphere(100);
 
 popMatrix();
 //z2++;

  float difx = mouseX - xpos;
  float dify = mouseY - ypos;
 // pushMatrix();
  //image (img,mouseX,mouseY);
   //popMatrix();
   
   
   
   
  /*if (abs(difx) > 0.0) {
    xpos = xpos + difx/drag;
    xpos = constrain(xpos, 0, width);
  }
  //if (abs(dify) > 0.0) {
    ypos = ypos + dify/drag;
    ypos = constrain(ypos, 0, width);
  }
*/
  // Display the sprite at the position xpos, ypos
 
    animation1.display(mouseX-50,mouseY-50);
    if(mousePressed)
    {
      n = loadImage("city2.jpg");
       image(n, 0, 0);
       bg = loadImage("city2.jpg");

 
    }
    else
    {
      bg = loadImage("city.jpg");
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


