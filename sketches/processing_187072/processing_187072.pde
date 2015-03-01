
int x;
int y;
PImage img;

void setup()
{
  size(615,409);
  String url= "http://i.imgur.com/NKsfz6m.jpg?1";
   img = loadImage(url);
  image(img, 0, 0);
  img.updatePixels();
}
 
void draw()
{
  loadPixels();
  color pixel = get(mouseX,mouseY);
  noStroke();
  fill(pixel);
 if(mousePressed==true && mouseButton ==LEFT) {
  x=mouseX-(mouseX%15);
  y=mouseY-(mouseY%15);
  rect(x,y,15,15);
  }
  if(mousePressed==true && mouseButton ==RIGHT){
   String url= "http://i.imgur.com/NKsfz6m.jpg?1";
   img = loadImage(url);
  image(img, 0, 0);
  }
}
