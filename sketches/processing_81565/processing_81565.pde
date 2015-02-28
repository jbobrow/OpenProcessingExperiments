
PImage img;
PImage bg;
int h,a,i,r=500;
void setup()
{
size(550, 550);
smooth();
bg = loadImage("HAIR.jpg");
img = loadImage("COMB.png");
frameRate(1000);

}
void draw () {
    background(bg);
if (mousePressed==true){
    imageMode(CORNER);
  image(img, mouseX, mouseY, 164, 339); 
noFill();
stroke(0,0,0,100);
bezier(146, 45, mouseX, mouseY, 125, 125,456, 192);
  }
}



