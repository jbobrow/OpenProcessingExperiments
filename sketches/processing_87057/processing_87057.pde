
// estebangreg
//still old tv
PImage img;
int side=5; //better side=8
color colorin;
float up;
int wide,high;
void setup()
{
  img=loadImage("Shiffman.jpg");  
  wide=275; //int wide=int(img.width*side);
  high=275; //int high=int(img.height*side);
  size(wide, high);
  frameRate(15);
}
void draw()
{
  background(0);
  stroke(255);
  fill(255);
  for(int j=0;j<img.height*side;j+=side)
  {
    for(int i=0;i<img.width*side-side;i+=side)
    {
      colorin=img.get(i/side,j/side);
      up=(blue(colorin)/256)*side;
      strokeWeight(up);
      line(i,j,i+side,j);
    }
  }  
}



