

String palette = "#$AXWFSDDFxrflacswfd:;`,. ";
PImage img;
int cW = 5;
int cH = 5;

void setup()
{
  background(0);
  img = loadImage("girl.gif");
  size(img.width * cW,img.height * cH);
  //colorMode(RGB, palette.length());
  textFont(createFont("",5)); 
}

void draw()
{
 for (int i=0; i<img.width; i++)
  for (int j=0; j<img.height; j++)
  {
     color c = img.get (i,j);
     int avg =  ((c >> 16) & 0xFF + (c >> 8) & 0xFF + c & 0xFF ) /3;          
     fill(c * mouseY);
     text(palette.charAt(avg*palette.length()/255), i*cW, j*cH ); 
  }
}

