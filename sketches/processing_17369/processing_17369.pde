
class Image
{
  PImage img;
  boolean active = false;
  float [] ImgSize;
  float changeSize;
  float moving;
  float positionx;
  int opacity;
  float slide_sizeY;
  int positionOpacity; //gives the opacity value which depends on the position
  
  
  Image (int i)
  {
    ImgSize = new float [2];
    img = loadImage ("Slideshow"+i+".jpg");
    
    
      float multiply = 600.0/img.height;
      ImgSize[0] = img.width*multiply;
      ImgSize[1] = 600.0;
    
      slide_sizeY = slide_size/ImgSize[0]*ImgSize[1];
  }
  
  void display_middel()
  {
    tint(255, 255);
    image (img, width/2, float(height/2), ImgSize[0], ImgSize[1]);
    positionx=width/2;
    changeSize=1;
    opacity=255;
  }
  
  void display_right()
  {
    tint (255, 95);
    image (img, width-(ImgSize[0]*0.2/2+20), height/2, ImgSize[0]*0.2, ImgSize[1]*0.2);
    positionx = width-(ImgSize[0]*0.2/2+20);
    changeSize=0;
    opacity=95;
  }
  
  void display_left()
  {
    tint (255, 95);
    image (img, ImgSize[0]*0.2/2+20, height/2, ImgSize[0]*0.2, ImgSize[1]*0.2);
    positionx = ImgSize[0]*0.2/2+20;
    changeSize=0;
    opacity=95;
  }
  
  void move_middelL()
  {
    moving = (width/2-(ImgSize[0]*0.2/2+20))/8;
    positionx = positionx - moving;
    changeSize = changeSize + 0.1;
    opacity = opacity + 20;
    tint(255,opacity);
    image (img, positionx, height/2, ImgSize[0]*(0.2+changeSize), ImgSize[1]*(0.2+changeSize));
  }
   
   void move_middelR()
  {
    moving = (width/2-(ImgSize[0]*0.2/2+20))/8;
    positionx = positionx + moving;
    changeSize = changeSize + 0.1;
    opacity = opacity + 20;
    tint(255,opacity);
    image (img, positionx, height/2, ImgSize[0]*(0.2+changeSize), ImgSize[1]*(0.2+changeSize));
  }
  
    void move_left()
  {
    moving = (width/2 - (ImgSize[0]*0.2/2+20))/8;
    positionx = positionx - moving;
    changeSize = changeSize - 0.1;
    opacity=opacity-20;
    tint(255,opacity);
    image (img, positionx, height/2, ImgSize[0]*changeSize, ImgSize[1]*changeSize);
  }
  
   void move_right()
  {
    moving = (width/2 - (ImgSize[0]*0.2/2+20))/8;
    positionx = positionx + moving;
    changeSize = changeSize - 0.1;
    opacity=opacity-20;
    tint(255,opacity);
    image (img, positionx, height/2, ImgSize[0]*changeSize, ImgSize[1]*changeSize);
  }
  
    void move_outL()
  {
    moving = (ImgSize[0]*0.2/2+20+ImgSize[0]*0.2/2+20)/8;
    positionx = positionx - moving;
    image (img, positionx, height/2, ImgSize[0]*0.2, ImgSize[1]*0.2);
  }
  
  void move_inL()
  {
    moving = (ImgSize[0]*0.2/2+20+ImgSize[0]*0.2/2+20)/8;
    positionx = positionx - moving;
    tint(255,95);
    image (img, positionx, height/2, ImgSize[0]*0.2, ImgSize[1]*0.2);
  }
  
  void move_outR()
  {
    moving = (ImgSize[0]*0.2/2+20+ImgSize[0]*0.2/2+20)/8;
    positionx = positionx + moving;
    image (img, positionx, height/2, ImgSize[0]*0.2, ImgSize[1]*0.2);
  }
  
  void move_inR()
  {
    moving = (ImgSize[0]*0.2/2+20+ImgSize[0]*0.2/2+20)/8;
    positionx = positionx + moving;
    tint(255,95);
    image (img, positionx, height/2, ImgSize[0]*0.2, ImgSize[1]*0.2);
  }
  
  void display_slide()
  {
    tint(255,positionOpacity);
    image (img, positionx, (screen.height/2)-(slide_sizeY/2)+40, slide_size, slide_sizeY);
  }
}

