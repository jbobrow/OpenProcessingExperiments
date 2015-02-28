
//Eli N-M, Mr.Simon CP1, 4/5
PImage T;
PImage F;
int x=130;
int y=50;
void setup()
{
  size(500,500);
  F=loadImage("http://1.bp.blogspot.com/_HIHTixqX3Vc/SKGBgWvomFI/AAAAAAAAA00/DJmfyXw3v7Q/s400/feather-detail.jpg"); //feather
  T=loadImage("http://stepintomywebsite.webs.com/ticklish picture.jpg"); //person
}
void draw()
{
  background(126,75,23);
  image(T,x,y,213,406);
  image(F,pmouseX,pmouseY,50,50);
  if(mousePressed==true)
  {
  x=x+int(random(-3,3));
  y=y+int(random(-3,3));
  fill(255);
  strokeWeight(2);
  smooth();
  ellipse(100,50,100,50);
  line(140,65,165,90);
  fill(0);
  textAlign(CENTER);
  text("HAHAHAHA!!",100,55);
  }
}
