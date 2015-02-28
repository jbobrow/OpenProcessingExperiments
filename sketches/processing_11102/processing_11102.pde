
String fileName = "jme";
String fileExt = ".jpg";
PImage source;

int minRadius;
int fiddle;

void setup()
{
  size(1024,683);
  //name of the image we want.
   source = loadImage(fileName + fileExt);
  //size(source.width,source.height);
  //print(source.width);
  //print(source.height);
  //stroke(255,0,0);
  stroke(100);
  background(255);
  background(source);
  smooth();

  minRadius = 40;
  fiddle = minRadius /2;
}

void draw(){
  image(source,0,0);
  fill(255,230);
  rect(0,0,width,height);
  noFill();
  for (int y = 0; y < height; y +=(minRadius/5)){
    squiggles(0,y, minRadius/2,0);
  }
}

void squiggles(int xb, int yb, int xd, int yd)
{
 // let's draw our way across this thing by breaking the picture into boxes to analyse
 
 // those boxes will have a calculation of brightness
 // for each box, create a bezier curve with a number of points that are related to the
 // brightness curve
 noFill();
 beginShape();
 int dir = -1;
 int x = xb;
 int y = yb;
 //we will check brightness every step pixels and then put a vertex
 for( x = xb; x < width; x += xd){
   dir *= -1;
   
   float bright = getAverageAmbientBrightness(x,yb);
   y = yb + dir * int(bright * minRadius );
   curveVertex(x, y);
   //float bright = getAverageAmbientBrightness(x,yb);
   //y += dir * int(bright * minRadius);
 }
   

 endShape();
 noLoop();
}

float getAverageAmbientBrightness(int x, int y){
  float bright = 0;
  //don't ever optimize unless you notice slowdown
  //I noticed slowdown
  int lim = y + fiddle;
  for(int curY = y - fiddle; curY < lim; curY++){
    bright += brightness(source.get(x,curY));
  }
  //actually, let's return darkness...
  return (255 - (bright/minRadius))/255;
}

