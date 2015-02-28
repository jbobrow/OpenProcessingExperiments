
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/79304*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import ddf.minim.*;

Minim minim;
//AudioSample d1;
float scaler = 1;
float xspeed = 5;
float xspeed1 =20;
float xpos;
float xpos1; 
float ypos=100 ;
float xdirection = 0.3;
float xdirection1 = 0.8;
float z = 0;
float z2 = 0;
PImage a,c; 

int zoom;
Animation animation1, animation2;
void setup() 
{
  size(1200,800,P3D);
 animation1 = new Animation("PT_Shifty_",50);
 animation2 = new Animation("PT_Shiftyn_",10);
  // minim = new Minim(this);
//  d1 = minim.loadSample("d1.wav", 2048);
   a = loadImage("final.jpg");
   c = loadImage("arma.png");
  //              b = loadImage("hud.png");

}

void draw() 
{
  noCursor();
  background(0);
      
  translate(mouseX,mouseY); // use translate around scale
  scale(scaler);
  translate(-mouseX,-mouseY); // to scale from the center
  //background(bg);
  
    image(a, -mouseX, -mouseY);
     
    image(c,580,400);
 animation1.display(mouseX,mouseY);
 
 animation2.display(0,0);

    
}


void keyPressed() {

  if (key == 'a') {
    tint(0,200,50);
    image(a, -mouseX, -mouseY);
    animation1.display(mouseX,mouseY);

   // if ((mouseX >= 200)&&(mouseX <= 250)&&(mouseY >= 20)&&(mouseY <=70)) {

      //animation2.display(mouseX-40,mouseY-40);
    //}
  }

  if (key == 'b') {
    tint(0,255,255);
    image(a, -mouseX, -mouseY);
    animation1.display(mouseX,mouseY);

  }
  if (key == 'c') {

    noTint();
  }
  
  //if (key == 'd') {
     //animation3.display(-xpos+750,mouseY-40);
  //}
  if (key == 'z') {
    {
      scaler += 0.1;
    }
  }
  if (key == 'x') {
    {
      scaler -= 0.1;
    }
  }
  /*if (key == 'p') {
    tint(0,255,0);
    image(a, 0, 0);
    pito.trigger();
  }*/
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



