
// This is a slightly more developed
// version of the instaspam sketch
// It does not have the camera, PHP
// or facebook functions integrated yet
// so you can start with this
// if you want to do that integration yourself

//THRESHOLD
//Converts the image to black and white pixels depending if they are above or below the threshold defined by the level parameter. The parameter must be between 0.0 (black) and 1.0 (white). If no level is specified, 0.5 is used.
//
//GRAY
//Converts any colors in the image to grayscale equivalents. No parameter is used.
//
//INVERT
//Sets each pixel to its inverse value. No parameter is used.
//
//POSTERIZE
//Limits each channel of the image to the number of colors specified as the parameter. The parameter can be set to values between 2 and 255, but results are most noticeable in the lower ranges.
//
//BLUR
//Executes a Guassian blur with the level parameter specifying the extent of the blurring. If no parameter is used, the blur is equivalent to Guassian blur of radius 1. Larger values increase the blur.
//
//ERODE
//Reduces the light areas. No parameter is used.
//
//DILATE
//Increases the light areas. No parameter is used.

/* @pjs preload="synthesizer.jpg"; */

// the image that is being edited
PImage originalImage;

// images to use for button logos
PImage cameraLogo, rotateLogo;

// the overlay images that can be applied to the image
PImage [] effectImages;

// buttons to trigger effects
Toggle [] effectToggles;

// Slider for Posterize and Blur.
Slider sliderP, sliderB;
int postVal = 100;
int blurVal = 0;

// button to load a file from the camera or file
Button fileButton;

// button to rotate the image
Button rotateButton;

// whether the user interface is showing
boolean displayGUI = false;

// this stops you showing a file temporarily as we load a new file
boolean updateImage = false;

// the angle of rotation of the image
float angle = 0;

// the position of the center of the image, this allows you to scroll it around
int imageCenterX;
int frame;

// Auxiliary variables
int UIBarWidth = 80;
int otherButtons = 2;

// loads a new image when you get one from the camera
void setImage(String url) 
{
  originalImage  = loadImage(url);
  updateImage = true;
  loop();
}

void setup()
{
  size(480, 640);

  imageCenterX = width/2;
  originalImage = loadImage("synthesizer.jpg");
  cameraLogo = loadImage("cameraLogo.png");
  rotateLogo = loadImage("rotateLogo.png");

  String []  effectNames = {
    "THR", "GRA", "INV", "ERO", "DIL"
  };
  effectToggles = new Toogle[5];
  totalButtons = effectToggles.length + otherButtons;
  for (int i = 0; i < totalButtons; i++) //(effectToggles.length)
  {
    if (i < 5)
    {
      effectToggles[i] = new Toggle(effectNames[i], 8, 60 * i + 8, 64, 48);
      effectToggles[i].activeColor = color(0, 255, 0);
      effectToggles[i].inactiveColor = color(100);
      effectToggles[i].set(false);
    }
    if (i == 5)
    {
      sliderP = new Slider("POS", postVal, 2, 100, 8, 60 * i + 8, 64, 48, HORIZONTAL);
    }
    if (i == 6)
    {
      sliderB = new Slider("BLU", blurVal, 0, 6, 8, 60 * i + 8, 64, 48, HORIZONTAL);
    }
  }
  rotateButton = new Button ("Rotate", 8, height - 120, 64, 48);
  //rotateButton.setImage(rotateLogo);
  fileButton = new Button ("File", 8, height - 60, 64, 48);
  //fileButton.setImage(cameraLogo);
}

void draw()
{
  background(100);

  // don't display the image if you have just updated the image
  if (! updateImage)
  {
    // rescale the image so that it is the full height of the screen
    float imageWidth = (height*originalImage.width)/originalImage.height;
    // draw the image
    imageMode(CENTER);
    pushMatrix();
    translate(imageCenterX, height/2);
    rotate(angle);
    //println(effectToggles[0].get());
    image(originalImage, 0, 0, imageWidth, height);
    if (effectToggles[0].get()) { 
      filter(THRESHOLD);
    }
    if (effectToggles[1].get()) { 
      filter(GRAY);
    }
    if (effectToggles[2].get()) { 
      filter(INVERT);
    }
    if (effectToggles[3].get()) { 
      filter(ERODE);
    }
    if (effectToggles[4].get()) { 
      filter(DILATE);
    }
    if (sliderP.get() > 2)
    {
      filter(POSTERIZE, postVal);
    }
    if (sliderB.get() > 0)
    {
      filter(BLUR, blurVal);
    }
    popMatrix();

    // if we are displaying the user interface, draw it
    if (displayGUI)
    {
      // draw a transparent rectangle behind the UI to make it more visible
      pushStyle();
      fill(0, 128);
      noStroke();
      rect(0, 0, UIBarWidth, height);
      // draw all the UI elements
      for (int i = 0; i < effectToggles.length; i++)
      {
        effectToggles[i].display();
      }
      sliderP.set(postVal);
      sliderB.set(blurVal);
      sliderP.display();
      sliderB.display();
      fileButton.display();
      rotateButton.display();
      noTint();
      popStyle();
    }
  }
  else // if we are updating the image, just draw some text
  {
    textAlign(CENTER, CENTER);
    text("updating", width/2, width/2);
    // stop the update message once we have drawn it once
    float imageWidth = (height*originalImage.width)/originalImage.height;
    originalImage.resize(imageWidth, height);
    updateImage = false;
  }
}

// respond to user interface events
void mouseReleased()
{
  // first we need to check if the user interface is show. If it is we can trigger events. Otherwise the click will show the interface
  if (displayGUI)
  {
    // if we are in the interface area at the bottom of the screen we trigger the UI events
    if (mouseX < UIBarWidth)
    {
      for (int i = 0; i < effectToggles.length; i++)
      {
        if (effectToggles[i].mouseReleased())
        {
          displayGUI = false;
        }
      }
      if (sliderP.mouseReleased())
      {
        displayGUI = false;
      }
      if (sliderB.mouseReleased())
      {
        displayGUI = false;
      }
      if (fileButton.mouseReleased())
      {
        // note that this function selectFile is defined in insta.js
        //selectFile();
        displayGUI = false;
      }
      if (rotateButton.mouseReleased())
      {
        angle += radians(90);
        displayGUI = false;
      }
    }
    else  
    {
      // if we clicked in the middle of the screen, hide the UI
      displayGUI = false;
    }
  }
  else
  {
    // if the UI was hidden, a click will show it
    displayGUI = true;
  }
}

// when we dragg we can move the image from left to
// right (it is the full screen height so we don't want
// to move it up and down)
void mouseDragged()
{
  if (! displayGUI)
  {
    imageCenterX += mouseX - pmouseX;
  }
  if (sliderP.mouseDragged())
  {
    postVal = sliderP.get();
  }
  if (sliderB.mouseDragged())
  {
    blurVal = sliderB.get();
  }
}


int HORIZONTAL = 0;
int VERTICAL   = 1;
int UPWARDS    = 2;
int DOWNWARDS  = 3;

class Widget
{

  PVector pos;
  PVector extents;
  String name;

  color inactiveColor = color(60, 60, 100);
  color activeColor = color(100, 100, 160);
  color bgColor = inactiveColor;
  color lineColor = color(255);

  void setInactiveColor(color c)
  {
    inactiveColor = c;
    bgColor = inactiveColor;
  }

  color getInactiveColor()
  {
    return inactiveColor;
  }

  void setActiveColor(color c)
  {
    activeColor = c;
  }

  color getActiveColor()
  {
    return activeColor;
  }

  void setLineColor(color c)
  {
    lineColor = c;
  }

  color getLineColor()
  {
    return lineColor;
  }

  String getName()
  {
    return name;
  }

  void setName(String nm)
  {
    name = nm;
  }


  Widget(String t, int x, int y, int w, int h)
  {
    pos = new PVector(x, y);
    extents = new PVector (w, h);
    name = t;
    //registerMethod("mouseEvent", this);
  }

  void display()
  {
  }

  boolean isClicked()
  {
    if (mouseX > pos.x && mouseX < pos.x+extents.x 
      && mouseY > pos.y && mouseY < pos.y+extents.y)
    {
      //println(mouseX + " " + mouseY);
      return true;
    }
    else
    {
      return false;
    }
  }

  public void mouseEvent(MouseEvent event)
  {
    //if (event.getFlavor() == MouseEvent.PRESS)
    //{
    //  mousePressed();
    //}
  }


  boolean mousePressed()
  {
    return isClicked();
  }

  boolean mouseDragged()
  {
    return isClicked();
  }


  boolean mouseReleased()
  {
    return isClicked();
  }
}

class Button extends Widget
{
  PImage activeImage = null;
  PImage inactiveImage = null;
  PImage currentImage = null;
  color imageTint = color(255);

  Button(String nm, int x, int y, int w, int h)
  {
    super(nm, x, y, w, h);
  }

  void setImage(PImage img)
  {
    setInactiveImage(img);
    setActiveImage(img);
  }

  void setInactiveImage(PImage img)
  {
    if (currentImage == inactiveImage || currentImage == null)
    {
      inactiveImage = img;
      currentImage = inactiveImage;
    }
    else
    {
      inactiveImage = img;
    }
  }

  void setActiveImage(PImage img)
  {
    if (currentImage == activeImage || currentImage == null)
    {
      activeImage = img;
      currentImage = activeImage;
    }
    else
    {
      activeImage = img;
    }
  }

  void setImageTint(color c)
  {
    imageTint = c;
  }

  void display()
  {
    if (currentImage != null)
    {
      //float imgHeight = (extents.x*currentImage.height)/currentImage.width;
      float imgWidth = (extents.y*currentImage.width)/currentImage.height;


      pushStyle();
      imageMode(CORNER);
      //tint(imageTint);
      image(currentImage, pos.x, pos.y, imgWidth, extents.y);
      stroke(bgColor);
      noFill();
      rect(pos.x, pos.y, imgWidth, extents.y);
      //noTint();
      popStyle();
    }
    else
    {
      pushStyle();
      stroke(lineColor);
      fill(bgColor);
      rect(pos.x, pos.y, extents.x, extents.y);

      fill(lineColor);
      textAlign(CENTER, CENTER);
      text(name, pos.x + 0.5*extents.x, pos.y + 0.5* extents.y);
      popStyle();
    }
  }

  boolean mousePressed()
  {
    if (super.mousePressed())
    {
      bgColor = activeColor;
      if (activeImage != null)
        currentImage = activeImage;
      return true;
    }
    return false;
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      bgColor = inactiveColor;
      if (inactiveImage != null)
        currentImage = inactiveImage;
      return true;
    }
    return false;
  }
}

class Toggle extends Button
{
  boolean on = false;

  Toggle(String nm, int x, int y, int w, int h)
  {
    super(nm, x, y, w, h);
  }


  boolean get()
  {
    return on;
  }

  void set(boolean val)
  {
    on = val;
    if (on)
    {
      bgColor = activeColor;
      if (activeImage != null)
        currentImage = activeImage;
    }
    else
    {
      bgColor = inactiveColor;
      if (inactiveImage != null)
        currentImage = inactiveImage;
    }
  }

  void toggle()
  {
    set(!on);
  }


  boolean mousePressed()
  {
    return super.isClicked();
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      toggle();
      return true;
    }
    return false;
  }
}

class RadioButtons extends Widget
{
  public Toggle [] buttons;

  RadioButtons (int numButtons, int x, int y, int w, int h, int orientation)
  {
    super("", x, y, w*numButtons, h);
    buttons = new Toggle[numButtons];
    for (int i = 0; i < buttons.length; i++)
    {
      int bx, by;
      if (orientation == HORIZONTAL)
      {
        bx = x+i*(w+5);
        by = y;
      }
      else
      {
        bx = x;
        by = y+i*(h+5);
      }
      buttons[i] = new Toggle("", bx, by, w, h);
    }
  }

  void setNames(String [] names)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if (i >= names.length)
        break;
      buttons[i].setName(names[i]);
    }
  }

  void setImage(int i, PImage img)
  {
    setInactiveImage(i, img);
    setActiveImage(i, img);
  }

  void setAllImages(PImage img)
  {
    setAllInactiveImages(img);
    setAllActiveImages(img);
  }

  void setInactiveImage(int i, PImage img)
  {
    buttons[i].setInactiveImage(img);
  }


  void setAllInactiveImages(PImage img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setInactiveImage(img);
    }
  }

  void setActiveImage(int i, PImage img)
  {
    buttons[i].setActiveImage(img);
  }



  void setAllActiveImages(PImage img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setActiveImage(img);
    }
  }

  void set(String buttonName)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if (buttons[i].getName().equals(buttonName))
      {
        buttons[i].set(true);
      }
      else
      {
        buttons[i].set(false);
      }
    }
  }

  int get()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if (buttons[i].get())
      {
        return i;
      }
    }
    return -1;
  }

  String getString()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if (buttons[i].get())
      {
        return buttons[i].getName();
      }
    }
    return "";
  }

  void display()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].display();
    }
  }

  boolean mousePressed()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if (buttons[i].mousePressed())
      {
        return true;
      }
    }
    return false;
  }

  boolean mouseDragged()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if (buttons[i].mouseDragged())
      {
        return true;
      }
    }
    return false;
  }

  boolean mouseReleased()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if (buttons[i].mouseReleased())
      {
        for (int j = 0; j < buttons.length; j++)
        {
          if (i != j)
            buttons[j].set(false);
        }
        //buttons[i].set(true);
        return true;
      }
    }
    return false;
  }
}

class Slider extends Widget
{
  float minimum;
  float maximum;
  float val;
  int textWidth = 60;
  int orientation = HORIZONTAL;

  Slider(String nm, float v, float min, float max, int x, int y, int w, int h, int ori)
  {
    super(nm, x, y, w, h);
    val = v;
    minimum = min;
    maximum = max;
    orientation = ori;
    if (orientation == HORIZONTAL)
      textWidth = 60;
    else
      textWidth = 20;
  }

  float get()
  {
    return val;
  }

  void set(float v)
  {
    val = v;
    val = constrain(val, minimum, maximum);
  }

  void display()
  {
    // Inverted the order of display to have the Slider name always on top of the slider bar
    pushStyle();
    noStroke();
    fill(bgColor);
    float sliderPos; 
    if (orientation ==  HORIZONTAL) {
      sliderPos = map(val, minimum, maximum, 0, extents.x-4); 
      //sliderPos = map(val, minimum, maximum, 0, extents.x-textWidth-4); // Replaced with the two lines above
      rect(pos.x+2, pos.y+2, sliderPos, extents.y-4);
      //rect(pos.x+textWidth+2, pos.y+2, sliderPos, extents.y-4); // Replaced with the two lines above
    } 
    else if (orientation ==  VERTICAL || orientation == DOWNWARDS) {
      sliderPos = map(val, minimum, maximum, 0, extents.y-textWidth-4); 
      rect(pos.x+2, pos.y+textWidth+2, extents.x-4, sliderPos);
    } 
    else if (orientation == UPWARDS) {
      sliderPos = map(val, minimum, maximum, 0, extents.y-textWidth-4); 
      rect(pos.x+2, pos.y+textWidth+2 + (extents.y-textWidth-4-sliderPos), extents.x-4, sliderPos);
    };
    fill(lineColor);
    textAlign(CENTER, CENTER);
    text(name, pos.x + 0.5*extents.x, pos.y + 0.5* extents.y);
    //text(name, pos.x, pos.y); // Replaced with the two lines above
    stroke(lineColor);
    noFill();
    if (orientation ==  HORIZONTAL) {
      rect(pos.x, pos.y, extents.x, extents.y);
      //rect(pos.x+textWidth, pos.y, extents.x-textWidth, extents.y); // Replaced with the two lines above
    } 
    else {
      rect(pos.x, pos.y+textWidth, extents.x, extents.y-textWidth);
    }
    popStyle();
  }


  boolean mouseDragged()
  {
    if (super.mouseDragged())
    {
      if (orientation ==  HORIZONTAL) {
        set(map(mouseX, pos.x, pos.x+extents.x-4, minimum, maximum));
        //set(map(mouseX, pos.x+textWidth, pos.x+extents.x-4, minimum, maximum));
      } 
      else if (orientation ==  VERTICAL || orientation == DOWNWARDS) {
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-4, minimum, maximum));
      } 
      else if (orientation == UPWARDS) {
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-4, maximum, minimum));
      };
      return true;
    }
    return false;
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      if (orientation ==  HORIZONTAL) {
        set(map(mouseX, pos.x+textWidth, pos.x+extents.x-10, minimum, maximum));
      } 
      else if (orientation ==  VERTICAL || orientation == DOWNWARDS) {
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-10, minimum, maximum));
      } 
      else if (orientation == UPWARDS) {
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-10, maximum, minimum));
      };
      return true;
    }
    return false;
  }
}

class MultiSlider extends Widget
{
  Slider [] sliders;

  MultiSlider(String [] nm, float min, float max, int x, int y, int w, int h, int orientation)
  {
    super(nm[0], x, y, w, h*nm.length);
    sliders = new Slider[nm.length];
    for (int i = 0; i < sliders.length; i++)
    {
      int bx, by;
      if (orientation == HORIZONTAL)
      {
        bx = x;
        by = y+i*h;
      }
      else
      {
        bx = x+i*w;
        by = y;
      }
      sliders[i] = new Slider(nm[i], 0, min, max, bx, by, w, h, orientation);
    }
  }

  void set(int i, float v)
  {
    if (i >= 0 && i < sliders.length)
    {
      sliders[i].set(v);
    }
  }

  float get(int i)
  {
    if (i >= 0 && i < sliders.length)
    {
      return sliders[i].get();
    }
    else
    {
      return -1;
    }
  }

  void display()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      sliders[i].display();
    }
  }


  boolean mouseDragged()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if (sliders[i].mouseDragged())
      {
        return true;
      }
    }
    return false;
  }

  boolean mouseReleased()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if (sliders[i].mouseReleased())
      {
        return true;
      }
    }
    return false;
  }
}



