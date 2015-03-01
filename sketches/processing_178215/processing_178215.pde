
/*
About the concept:
It seems people love to "Like" other's information on facebook. I am in a place where facebook can't be connected, but its local substituds also got the same function.
So I decided to make something about that.
Part of the idea came from diffrent flash and html5 games I've played and PORTAAAAAAL.
The absence of sound is that the other assigments of the class didn't get well, basically my poor ability of music.
Though this is not a big project, try it please.

About the coding:
Most part of this code was wrote under Java Mode of Processing 2.2.1.
When I tried to upload the code to OpenProcessing with JavaScript Mode, many methods just didn't run.
So I changed to Standard Mode of Processing 1.5.1 which can export the code to applet and be loaded by OpenProcessing.
I know it would be slower to load the code as applet, sorry guys.
*/

boolean onButton = false;
PImage button;
int canvasWidth = 800;
int canvasHeight = 600;
String text = "";
int thumbscount = 0;
int buttonScaleNormal = 4;
int buttonScalePressed = 5;
int buttonLocationPressedX;
int buttonLocationPressedY;
int buttonLocationNormalX;
int buttonLocationNormalY;
int buttonWidthPressed;
int buttonHeightPressed;
int buttonWidthNormal;
int buttonHeightNormal;
//Two timer for diffrent stage
int time0;
int time1;
int time2;
int time3;
//The number of current stage
int stage;
//Use HashMap to store most texts with keys.
HashMap texts = new HashMap();
HashMap subtexts = new HashMap();

//GImage is a class base on an PImage and other varibles. It was defined to try to make the image transform little bit easier.
GImage[] thumbs;

void setup() {
  //Processing 1.5.1 alert about the use of size(), the arguments can't be variebles
  //size(canvasWidth,canvasHeight);
  size(800,600);
  noStroke(); 
  noFill();
  background(255);
  button = loadImage("thumb.png");
  buttonLocationPressedX = canvasWidth/2-button.width/buttonScalePressed/2;
  buttonLocationPressedY = canvasHeight/2-button.height/buttonScalePressed/2;
  buttonLocationNormalX = canvasWidth/2-button.width/buttonScaleNormal/2;
  buttonLocationNormalY = canvasHeight/2-button.height/buttonScaleNormal/2;
  buttonWidthPressed = button.width/buttonScalePressed;
  buttonHeightPressed = button.height/buttonScalePressed;
  buttonWidthNormal = button.width/buttonScaleNormal;
  buttonHeightNormal = button.height/buttonScaleNormal;
  setTexts();
}

void setTexts() {
  
  texts.put(2,"ERROR");
  //Used to be "Wait a minute, please" but no one would take a minute to wait for this.
  texts.put(4,"Wait a second, please");
  texts.put(9,"Building connection");
  texts.put(15,"Uploading");
  texts.put(21,"Upload failed");
  texts.put(23,"Verifying");
  texts.put(30,"Server is busy");
  texts.put(35,"Please press again");
  texts.put(43,"Syncronizing");
  texts.put(47,"Locating Cookies");
  texts.put(51,"Cake been found");
  texts.put(52,"That's a mistake");
  texts.put(53,"Time out soon");
  texts.put(56,"Almost there");
  texts.put(58,"58");
  texts.put(59,"59");
  texts.put(60,"CONGRATULATIONS\nYOU WAIT FOR A WHOLE MINUTE\nAnd It Worked");
}

void draw()
{
  if (stage == 0)
  {
    fill(128);
    textAlign(CENTER, CENTER);
    textFont(createFont("Calibri", 48, true));
    textLeading(36);
    text("PRESS TO LIKE"
      , width*0.5, height*0.5);
  //Use the timer to determine the text. I was using 'Math.floor()' and it return an double. That means it would need at least another method to do the convertion.
  //With round there will be 0.5sec difference, but won't affect this sketch.
  time0 = round(millis()/1000);
  }
  else 
  if (stage == 2)
  {
    stroke(255);
    textSize(48);
    fill(0, 102, 153);
    textAlign(CENTER);
    text("You Liked "+thumbscount+" Times\nThank You For Your Support" , canvasWidth/2, canvasHeight/2);
    //Construct the thumb images
    for(int i=0; i<thumbscount; i++)
    {
      thumbs[i] = new GImage(button, (int)random(canvasWidth), (int)random(canvasHeight), button.width/buttonScaleNormal,button.height/buttonScaleNormal);
      thumbs[i].setScale(0);
    }
    stage=3;
    background(255);
    time2 = round(millis()/1000);
  }
  else 
  //The stage show the thumbs
  if (stage == 3)
  {
    time3 = round(millis()/1000)-time2;
    stroke(255);
    textSize(48);
    fill(0, 102, 153);
    textAlign(CENTER);
    text("Look At Them\nYou Liked "+thumbscount+" Times\nThank You For Your Support" , canvasWidth/2, canvasHeight/2);
    for(int i=0; i<thumbscount; i++)
    {
      //Show one thumb in total 5 sec with a sequence
      if (5.0/thumbscount*i<time3)
        thumbs[i].enlargeInTime(2, 1);
      thumbs[i].display();
    }
  }
  else
  {
  time1 = round(millis()/1000)-time0;
  update(mouseX, mouseY);
  background(255);
  //Get the text from HashMap with the time as key
  if (texts.containsKey(time1))
    text = String.valueOf(texts.get(time1));
  if (onButton)
  {
    if (mousePressed)
    {
      image(button,buttonLocationPressedX, buttonLocationPressedY, buttonWidthPressed, buttonHeightPressed);
    } else
    {
      image(button, buttonLocationNormalX, buttonLocationNormalY, buttonWidthNormal, buttonHeightNormal);
    }
    
  } else
  {
    image(button, buttonLocationNormalX, buttonLocationNormalY, buttonWidthNormal, buttonHeightNormal);
  }
  stroke(255);
  textSize(48);
  fill(0, 102, 153);
  textAlign(CENTER);
  text(text, canvasWidth/2, canvasHeight/4*3);
  //After 63sec in stage1, clear screen and go to stage2
   if (time1>63)
   {
      stage=2;
      background(255);
      //Decide how big the thumb images' array is
      thumbs = new GImage[thumbscount];
   }
  }
}

void update(int x, int y)
{
  if (onButton(buttonLocationNormalX, buttonLocationNormalY, buttonWidthNormal, buttonHeightNormal))
  {
    onButton = true;
  } else {
    onButton = false;
  }
}

void mouseReleased()
{
  if (onButton&&stage == 1) {
    thumbscount++;
  }
  if (stage == 0) {
    stage = 1;
  }
}
//The method to determine whether the mouse was on the button or not
boolean onButton(int x, int y, int width, int height)
{
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

//The definition of GImage
class GImage
{
  int x;
  int y;
  PImage image;
  int width;
  int height;
  //Varible to control the scale of the PImage displayed 
  float scale;
  //Varible of how much scale should be changed between two draw()
  float dscale;
  //Varible of whether the imaging is enlarging
  boolean enlarging = false;
  //The loopMax decide how many time it would loop, when it equals 0, then loop forever
  int loopMax = 1;
  //The loopCurrent is how many time it had looped
  int loopCurrent = 1;
  //Setter and getter of basic varibles
  void setX(int x)
  {
    this.x = x;
  }
  int getX()
  {
    return this.x;
  }
  void setY(int y)
  {
    this.y = y;
  }
  int getY()
  {
    return this.y;
  }
  void setImage(PImage image)
  {
    this.image = image;
  }
  PImage getImage()
  {
    return this.image;
  }
  void setWidth(int width)
  {
    this.width = width;
  }
  int getWidth()
  {
    return this.width;
  }
  void setHeight(int height)
  {
    this.height = height;
  }
  int getHeight()
  {
    return this.height;
  }
  void setScale(float scale)
  {
    this.scale = scale;
  }
  float getScale()
  {
    return this.scale;
  }
  //The constructor of GImage
  GImage(PImage image, int x, int y, int width, int height)
  {
    setX(x);
    setY(y);
    setImage(image);
    setWidth(width);
    setHeight(height);
    setScale(1);
    imageWithMiddlePoint(image, x, y, width, height);
  }
  
  //The method to refresh the image's display
  void display()
  {
    //When the enlarging is in process, use enlarge() to calculate
    if (enlarging)
      enlarge();
    imageWithMiddlePoint(image, x, y, width*scale, height*scale);
  }
  //The method to begin enlarge the image in given second and given times
  void enlargeInTime(float seconds, int loopMax)
  {
    if (!enlarging&&(loopMax==0||loopCurrent<=loopMax))
    {
      scale = 0;
      enlarging = true;
    }
    dscale = 1/frameRate/seconds;
  }
  
  //The method to enlarge the image
  void enlarge()
  {
    scale = scale+dscale;
    if (scale>1)
    {
      scale = 1;
      enlarging = false;
      loopCurrent++;
    }
  }
  //The method use middle of the image as the anchor point
  void imageWithMiddlePoint(PImage image, int x, int y, float width, float height) {
    image(image, x-width/2, y-height/2, width, height);
  }
}

