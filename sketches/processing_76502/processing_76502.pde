
import processing.opengl.*;

PImage wholeImage;
int sizeOfTile;


ImagePart[][] imageParts;

void setup() 
{
    wholeImage= loadImage("art.png");

  for(int x=1;x<wholeImage.width/4.0;x++)
  if(wholeImage.width%x==0)
  sizeOfTile=x;
  
  sizeOfTile=144;
  
  size(720,482, P3D);
  print(int((wholeImage.height-wholeImage.height%sizeOfTile))+50);
  shapeMode(CENTER);
  makeParts();
 
}

void makeParts()
{
  imageParts=new ImagePart[wholeImage.width/sizeOfTile][wholeImage.height/sizeOfTile];
  for(int x=0;x<imageParts.length;x++)
  for(int y=0;y<imageParts[0].length;y++)
  {
    ImagePart temp = new ImagePart(x,y);
    imageParts[x][y]=temp;
  }
 
}

void draw() 
{
  
  backgroundTranslateScaleRotate();  
  drawParts();
}

int d=1;
void backgroundTranslateScaleRotate()
{
 background(50,50,50);
 
 rotateX((sin(frameCount/100.0))/(2.0));
 
 
}

void drawParts()
{
 for(int x=0;x<imageParts.length;x++)
 for(int y=0;y<imageParts[0].length;y++)
 {
 pushMatrix();
 imageParts[x][y].drawImage();
 popMatrix();
 }
 
}

class ImagePart
{
  int x;
  int y;
  PImage partOfImage;
  
  ImagePart(int x,int y)
  {
    this.x=x;
    this.y=y;
    partOfImage=wholeImage.get(x*sizeOfTile,y*sizeOfTile,sizeOfTile,sizeOfTile);
  }
  
  void drawImage()
  {    
  image(partOfImage,x*sizeOfTile,y*sizeOfTile);
  if(random(0,1)>.995)
  if(x<imageParts.length-1&&x>0&&y>0&&y<imageParts[0].length-1&&(-1.5*PI-frameCount/200.0)<-2*PI)
  swap();
  }
  
  void swap()
  {
   PImage temp = partOfImage;
   int a=int(random(-2,2));
   int b=int(random(-2,2));
   partOfImage=imageParts[x+a][y+b].partOfImage; 
   imageParts[x+a][y+b].partOfImage=temp;
  }
}



