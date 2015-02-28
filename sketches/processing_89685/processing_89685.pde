
//By Garrett Clark 
//This is the internet!!!

PImage webImg;
PImage[] pImages;
String[] webImages;
int x,y;

void setup() {
  size(640,480);
  x = -40;
  y=-40;
  pImages = new PImage[60];
  webImages  = new String[60];
  for(int i=0; i <= 59; i++)
  {
    //String url = "http://designinbits.com/cats/c"+i+".jpg";
    
    webImages[i] = "http://designinbits.com/cats/c"+i+".jpg";
    pImages[i] = loadImage(webImages[i], "jpg");
    /*
    if(x>=640) {
      x=-40;
      y+=40; 
    }
    if(y>=480){
    y=-40;
    }
    image(pImages[i],x+=40,y);
    */

  }


}

void draw() {
      if(x>=640) {
      x=-40;
      y+=40; 
    }
    if(y>=480){
    y=-40;
    }
    for(int i=0; i <= 59; i++)
  {
    image(pImages[int(random(0,59))],x+=40,y);
  }
 
}


