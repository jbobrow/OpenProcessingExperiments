
PImage Logo;
PImage [] Images; //original Images.
PImage [] effectImages; //where images with effects get stored.


RadioButtons whichImage; //for selecting an image.
Button [] effect; //for selecting an effect.

int currentImage= -1; //indicates selected image.


boolean [] [] effectBool; //for turning effect on or off.

PFont f; //font



void setup()
{
  size(640, 470);
  background(0);
  f = createFont("Arial",16,true); 

  effectBool = new boolean[4][7];
  for(int i=0;i<4;i++)
  {
    for(int j=0; j<7; j++)
    {
      effectBool[i][j] = false;
    }
  }
  
  Logo = loadImage("logo.png");
  
  Images = new PImage [4];
    Images[0] = loadImage("0.jpg");
    Images[1] = loadImage("1.jpg");
    Images[2] = loadImage("2.jpg");
    Images[3] = loadImage("3.jpg");
    
  effectImages = new PImage[4];
  for(int i=0; i<effectImages.length; i++)
    effectImages[i] = createImage(Images[i].width, Images[i].height, RGB);
   
   
  whichImage = new RadioButtons(4,width-100, 20, 70, 70, VERTICAL);
  for(int i=0;i<Images.length;i++)
  {
    whichImage.setImage(i, Images[i]);
  }
  
  effect = new Button[7];
    effect[0] = new Button("Scary", 25, height-50, 60, 20);
    effect[1] = new Button("Brighten", 95, height-50, 60, 20);
    effect[2] = new Button("Darken", 165, height-50, 60, 20);
    effect[3] = new Button("B&W", 235, height-50, 60, 20);
    effect[4] = new Button("ColorMix", 305, height - 50, 60, 20);
    effect[5] = new Button("X-Ray", 375, height - 50, 60, 20);
    effect[6] = new Button("Poster", 445, height - 50, 60, 20);
 
}

void draw()
{
  
   background(0);
   
   //displaying instructions.
   if(currentImage == -1)
   {
     pushMatrix();
     fill(255);
     textAlign(CENTER);
     textFont(f,46);
     text("PixelGram",(width-100)/2,50);
     textFont(f,36);
     text("Instructions:", (width-100)/2, 100);
     textFont(f,16);
     text("Click on any image from the sidebar to view it.\n\nClick on any effect below to apply it to the selected image.\n\n Have Fun!", (width-100)/2,180);
     popMatrix();
   }
     
  textFont(f,12);
  
  //displaying interface.
  
  whichImage.display();
  image(Logo, width-115, height-115, 100, 100);
 
 
  for(int i=0;i<effect.length;i++)
  {
    effect[i].display();
  }
  
 for(int i=0;i<4;i++)
 {
   if(whichImage.get() == i) //checking and displaying selected image.
   {
     int imgHeight = (500*Images[i].height)/Images[i].width;
     image(Images[i], 20, 20, 500, imgHeight);
     currentImage = i;
     for(int j=0; j<effectImages.length; j++)
        effectImages[i] = createImage(Images[i].width, Images[i].height, RGB);
   }

   //checking which effect is selected and applying it.
   for(int j=0;j<7;j++)
   {
     if(effectBool[i][j]) 
     {
       if(i==currentImage)
       {
       int imgNewHeight = (500*Images[i].height)/Images[i].width;
       effects(Images[i], effectImages[i],j);
       image(effectImages[i], 20, 20, 500, imgNewHeight);
       }
   
       else
         effectBool[i][j] = false;
     }
   }
 }

}

void mouseDragged()
{
 whichImage.mouseDragged();
 for(int i=0; i<effect.length;i++)
 effect[i].mouseDragged();

}

void mousePressed()
{
 whichImage.mousePressed();
 for(int i=0; i<effect.length;i++)
 effect[i].mousePressed();
}

void mouseReleased()
{
 whichImage.mouseReleased();

 for(int j=0;j<7;j++)
 {
   if(effect[j].mouseReleased())
   {
     effectBool[currentImage][j] = !effectBool[currentImage][j]; //to turn effect on and off when clicked.
     effect[j].mouseReleased();
     for(int k=0;k<7;k++)
     {
       if(j!=k)
       effectBool[currentImage][k] = false;
     }
   }
   
 }
   
}


//Randomly changing color of each pixel based on its original color.
void effects(PImage img, PImage imgNew, int effectNumber) 
{
  float rr,gg,bb;
  img.loadPixels(); //loading pixels of original image.
  imgNew.loadPixels(); //loading pixels of image where effect is saved.
  for (int y = 0; y < img.height; y++) 
  {
    for (int x = 0; x < img.width; x++) 
    {
      int loc = x + y*img.width; //calculating location of each pixel.
      //getting color of each pixel of original image.
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
    
       //Alloting random colors to pixels based on their original color.
      if(effectNumber == 0)
      {
        //setting color of each pixel of new image.
        if(r<120)
        rr = random(200,255);
      
        else
        rr = random(0,5);
      
        if(g<120)
        gg = random(200,255);
      
        else
        gg = random(0,5);
      
        if(b<120)
        bb = random(200,255);
      
        else
        bb = random(0,5);
      
        imgNew.pixels[loc] =  color(rr,gg,bb);         
      }
     
    //Brightening each pixel
    if(effectNumber == 1)
    {
        float Brightness = 1.5;
        
        //increasing brightness of each pixel
        rr = r*Brightness; 
        gg = g*Brightness;
        bb = b*Brightness;
  
        //keeping brightness between original brightness and max value.
        rr = constrain(rr,r,255);
        gg = constrain(gg,g,255);
        bb = constrain(bb,b,255);
   
        color c = color(rr,gg,bb);
        imgNew.pixels[loc] = c;
    }
  
    //Darkening each pixel
    if(effectNumber == 2)
    {
        float Darkness = 0.7;
        rr = r*Darkness;
        gg = g*Darkness;
        bb = b*Darkness;
  
        rr = constrain(rr,0,255);
        gg = constrain(gg,0,255);
        bb = constrain(bb,0,255);
   
        color c = color(rr,gg,bb);
        imgNew.pixels[loc] = c;
     }

    //Black and white
    if(effectNumber == 3)
    {
        float grayScale = brightness(img.pixels[loc]);
        grayScale = constrain(grayScale, 0, 255);
        imgNew.pixels[loc]  = color(grayScale);//making pixel in grayscale
    }
    

    //swapping colors. red of original becomes green, green becomes blue and blue becomes red.
    if(effectNumber == 4)
    {  
        rr = g;
        gg = b;
        bb = r;
        color c = color(rr,gg,bb);
        imgNew.pixels[loc] = c;
     }

    //X-Ray effect. Opposite of Black & White.
    if(effectNumber == 5)
    {
        float grayScale = 255 - brightness(img.pixels[loc]);
        constrain(grayScale,0,255);
        imgNew.pixels[loc] = color(grayScale);
    }

    //Posterizing
    if(effectNumber == 6)
    {
        float bright = brightness(img.pixels[loc]);
      
        if(bright > 127)
        {
          rr = r*bright - 20;
          gg = g*bright - 20;
          bb = b*bright - 20;
        }
       
        else
        {
          rr = r/bright + 20;
          gg = g/bright + 20;
          bb = b/bright + 20;
        }
         
      imgNew.pixels[loc] = color(rr,gg,bb);
     }
    }
  }

  imgNew.updatePixels(); //updating the pixels of new image after adding effects.
}
    


int HORIZONTAL = 0;
int VERTICAL   = 1;
int UPWARDS    = 2;
int DOWNWARDS  = 3;
boolean clicked = false;

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
    if(currentImage == inactiveImage || currentImage == null)
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
    if(currentImage == activeImage || currentImage == null)
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
    if(currentImage != null)
    {
      //float imgHeight = (extents.x*currentImage.height)/currentImage.width;
      float imgWidth = (extents.y*currentImage.width)/currentImage.height;
      
      
      pushStyle();
      imageMode(CORNER);
      //tint(imageTint);
      image(currentImage, pos.x, pos.y, imgWidth, extents.y);
      stroke(bgColor);
      noFill();
      rect(pos.x, pos.y, imgWidth,  extents.y);
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
      if(activeImage != null)
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
      if(inactiveImage != null)
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


 

  void set(boolean val)
  {
    on = val;
    if (on)
    {
      bgColor = activeColor;
      if(activeImage != null)
        currentImage = activeImage;
    }
    else
    {
      bgColor = inactiveColor;
      if(inactiveImage != null)
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
   boolean get()
  {
    return on;
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
      if(orientation == HORIZONTAL)
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
      if(i >= names.length)
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
      if(buttons[i].getName().equals(buttonName))
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
      if(buttons[i].get())
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
      if(buttons[i].get())
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
      if(buttons[i].mousePressed())
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
      if(buttons[i].mouseDragged())
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
      if(buttons[i].mouseReleased())
      {
        for(int j = 0; j < buttons.length; j++)
        {
          if(i != j)
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
    if(orientation == HORIZONTAL)
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
    pushStyle();
    textAlign(LEFT, TOP);
    fill(lineColor);
    text(name, pos.x, pos.y);
    stroke(lineColor);
    noFill();
    if(orientation ==  HORIZONTAL){
      rect(pos.x+textWidth, pos.y, extents.x-textWidth, extents.y);
    } else {
      rect(pos.x, pos.y+textWidth, extents.x, extents.y-textWidth);
    }
    noStroke();
    fill(bgColor);
    float sliderPos; 
    if(orientation ==  HORIZONTAL){
        sliderPos = map(val, minimum, maximum, 0, extents.x-textWidth-4); 
        rect(pos.x+textWidth+2, pos.y+2, sliderPos, extents.y-4);
    } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textWidth-4); 
        rect(pos.x+2, pos.y+textWidth+2, extents.x-4, sliderPos);
    } else if(orientation == UPWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textWidth-4); 
        rect(pos.x+2, pos.y+textWidth+2 + (extents.y-textWidth-4-sliderPos), extents.x-4, sliderPos);
    };
    popStyle();
  }

  
  boolean mouseDragged()
  {
    if (super.mouseDragged())
    {
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textWidth, pos.x+extents.x-4, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-4, minimum, maximum));
      } else if(orientation == UPWARDS){
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
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textWidth, pos.x+extents.x-10, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textWidth, pos.y+extents.y-10, minimum, maximum));
      } else if(orientation == UPWARDS){
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
      if(orientation == HORIZONTAL)
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
    if(i >= 0 && i < sliders.length)
    {
      sliders[i].set(v);
    }
  }
  
  float get(int i)
  {
    if(i >= 0 && i < sliders.length)
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
      if(sliders[i].mouseDragged())
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
      if(sliders[i].mouseReleased())
      {
        return true;
      }
    }
    return false;
  }
}



