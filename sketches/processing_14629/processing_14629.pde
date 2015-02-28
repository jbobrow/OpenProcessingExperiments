
graphicObject media;
graphicObject message; 
graphicObject img;
graphicObject language;

PFont font;

//int ty = 250;
int ty= -2;
float ts = 150;
int count;

void setup() {
  size(640,480);
  
  smooth();
  frameRate(120);
  textAlign(CENTER);

  //font= loadFont("Arial-BoldMT-120.vlw");  
  // textSize(150);
  // fill(0);

  // text("MESSAGE",0,300);
  media = new graphicObject("media_k.png", 0, 0, 640, 240); 
  message = new graphicObject("message_k.png", 0, 238, 640, 240); 
  img = new graphicObject("image_k.png", 0, 475, 640, 240); 
  language = new graphicObject("language_k.png", 0, 710, 640, 240); 
  
  media.setY(message.y+message.h-2);
  language.setY(media.y+media.h-2);
  img.setY(language.y+language.h-3);
  
  font= loadFont("Arial-BoldMT-120.vlw");
  textSize(ts);
  frameRate(30);
}


void draw() {
  
  count = second() % 8 ;
  
  // if (count==0){
    //show one image
    // else
    // other image 
  
  
  background(255);
    
  
 if (frameCount % 60 == 0) {
    textSize(ts);
     ts = ts + 20;
 }
  
  
  fill(0);
 

  
  switch (count) {
    case 0:
    case 1:
    
      ts =150;
      textSize(ts);
    
      text("MEDIA",width/2,height/2+50);
      break;
      
    case 2:
    case 3:
      text("MESSAGE",width/2,height/2+50);
      break;
      
    case 4:
    case 5:
      text("IMAGE",width/2,height/2+50);
      break;
  
  
    case 6:
    case 7:
    textSize(120);
      text("LANGUAGE",width/2,height/2+50);
      break;
  
      
    }
    
    
     fill(230);
    noStroke();
    rect(0,0,640,80);
    rect(0,400,640,80);
    
    
    
    message.display();
    media.display();
    language.display();
    img.display();
 
    message.setY (message.y+ty);
    media.setY(media.y+ty);
    language.setY(language.y+ty);
    img.setY(img.y+ty);
    
    if(message.y<=-240)
    {
        message.setY(img.y+img.h-2);
    }
    else if(media.y<=-240)
    {
        media.setY(message.y+message.h-2);
    }
    else if(language.y<=-240)
    {
        language.setY(media.y+media.h-2);
    }
    else if(img.y<=-240)
    {
        img.setY(language.y+language.h-3);
    }
    
   
    
    
    
  }

class graphicObject
{
   int x;
   int y;  
   int w;
   int h;
   PImage img;
   String URL;
  
  graphicObject (String url, int x0, int y0, int W, int H)
  {
    URL = url;
    img = loadImage (URL);
    x = x0;
    y = y0;
    w = W;
    h = H;
  }
  
  void display() //draw the image at (x, y)
  {
    image(img, x, y, w,h);
  }
  
  void setY(int newY) //set the y coordinate to a new coordnate
  {
    y = newY;
  }
}



