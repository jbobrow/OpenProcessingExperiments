
PImage station;
Sprite astro; 
 
float xpos; 
float ypos; 
float drag = 30.0; 
 
void setup() 
{ 
  size(400,252); 
  station = loadImage("station.jpg");
  astro = new Sprite("astro.gif"); 
  xpos = width/2; 
  ypos = height/2; 
} 
 
void draw() 
{ 
cursor(CROSS); 
  background(station); 
 
  float difx = mouseX - xpos; 
  if(abs(difx) > 1.0) { 
    xpos = xpos + difx/drag; 
    xpos = constrain(xpos, astro.swidth/2, width-astro.swidth/2-1); 
  }  
  
  float dify = mouseY - ypos; 
  if(abs(dify) > 1.0) { 
    ypos = ypos + dify/drag; 
    ypos = constrain(ypos, astro.sheight/2, height-astro.sheight/2-1); 
  }  
  
  astro.display(xpos-astro.swidth/2, ypos-astro.sheight/2); 
} 
 

class Sprite 
{ 
  int wh;       
  int[] px;      
  int swidth;   
  int sheight;  
  PImage img;   
	 
  Sprite(String imageName) { 
    loadSprite(imageName); 
    swidth = img.width; 
    sheight = img.height; 
    wh = swidth*sheight; 
    px = new int[wh]; 
    
    img.loadPixels();
    for(int i=0; i < wh; i++) { 
      px[i] = img.pixels[i]; 
    } 
  } 
  void loadSprite(String name) { 
    img = loadImage(name); 
  } 
  void display(float x, float y) { 
    int pix; 
    loadPixels();
    for(int i=0; i < wh; i++) { 

      if(px[i] != 0x00FFFFFF) { 
        pix = (int)x+((int)y*width)+(i%swidth)+((i/swidth)*width); 
        if(pix < width*height && pix > 0) { 
          pixels[pix] = px[i]; 
        } 
      } 
    } 
    updatePixels();
  } 
} 
 

