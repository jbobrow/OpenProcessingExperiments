
//import megamu.shapetween.*;
//Tween anim1, anim2;
int numImages = 12;
int index = 0;
int newindex = 1;
int transparent1 = 255;
int transparent2 = 0;
int fadeSpeed = 4;
PImage[] images = new PImage[numImages];
float centerX, centerY;
int startingtime;
int time = 0;
int sec = 0;
int offsetw = 0;
int pointsize = 20;
boolean picture1 = false;
boolean picture2 = true;
boolean pause = false;

void setup()
{
  size(640,480);
  centerX = width/2;
  centerY = height/2;
  
  imageMode(CENTER);
  for(int i = 0; i < numImages; i++)
  {
    images[i] = loadImage(i + ".jpg");
    //images[i] = makeTransparent(images[i],50);
  }
  startingtime = millis();
}

void draw()
{
  if(!pause)
  {
    background(0,0,0);
    fill(0);
    time = 60*millis()/1000;
    sec = (millis() - startingtime)/1000; 
    PImage temp;
    tint(255,255,255,transparent1);
    //temp = images[index];
    image(images[index], centerX, centerY);
    if(images[index].height > height){ images[index].resize(0, 480);}
    //if(transparent1 > 0){offsetw = calcImageWidthOffset(temp,images[index]);}
    tint(255,255,255,transparent2);
    //temp = images[newindex];
    image(images[newindex],centerX,centerY);
    if(images[newindex].height > height){images[newindex].resize(0, 480);}
    //if(transparent2 > 0){offsetw = calcImageWidthOffset(temp,images[index]);}
  }
  if(sec > 2)
  {
    if(picture1)
    {
      transparent1+=fadeSpeed;
      transparent2-=fadeSpeed;
      if(transparent1 > 255)
      {
        transparent1 = 255;
        transparent2 = 0;
        newindex = index + 1;
        if(newindex > numImages - 1)
        {newindex = 0;}
        picture1 = false;
        picture2 = true;
        restartTimer();
      }
    }
    else if(picture2)
    {
      transparent1-=fadeSpeed;
      transparent2+=fadeSpeed;
      if(transparent2 > 255)
      {
        transparent2 = 255;
        transparent1 = 0;
        index = newindex + 1;
        if(index > numImages - 1)
        {index = 0;}
        picture1= true;
        picture2 = false;
        restartTimer();
      }
    }
  }
  
  if(key == 'P' || key == 'p')
  {
    pause = true;
    int pint = 0;
    if(picture1)
    {pint = newindex;}
    else if(picture2)
    {pint = index;}
    
    PImage temp = images[pint];
       // println(temp.height);
      int x = int(random(temp.width));
      int y = int(random(temp.height));
      int loc = x + y*temp.width;
      
      // Look up the RGB color in the source image
      loadPixels();
      float r = red(temp.pixels[loc]);
      float g = green(temp.pixels[loc]);
      float b = blue(temp.pixels[loc]);
      noStroke();
      
      // Draw an ellipse at that location with that color
      fill(r,g,b,100);
     float psize = random(pointsize) + 5;
      ellipse(x,y,psize,psize);
  }
  else
  {
    pause = false;
  }
}

int calcImageWidthOffset(PImage img1, PImage img2)
{
  return img2.width - img1.width;
}
int calcImageHeightOffset(PImage img1, PImage img2)
{
  return img2.height - img1.height;
}

void restartTimer()
{
   startingtime = millis();
}

void resizeWidthImage(PImage img)
{
}

 
PImage makeTransparent(PImage src, int a) {
  int w = src.width;
  int h = src.height;
  PImage tmp = createImage(w, h, ARGB);
   
  tmp.copy(src, 0, 0, w, h, 0, 0, w, h);
  tmp.loadPixels();
  for (int i = 0; i < tmp.pixels.length; i++) {
    color c = tmp.pixels[i];
    tmp.pixels[i] = color( (c >> 16) & 0xFF, (c >> 8) & 0xFF, c & 0xFF, a);
  }
  tmp.updatePixels();
   
  return tmp;
}


