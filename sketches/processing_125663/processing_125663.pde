
PImage img;
PImage img2;
PImage img3;

void setup()
{size(500,500);
img=loadImage("aus.jpg");
img2=loadImage("Streichholz.png");
img3=loadImage("an.jpg");
}
void draw()
{
  imageMode(CORNER);
  background(255);
  image(img,0,0);

imageMode(CENTER);
image(img2,mouseX,mouseY);
 if(mouseX>=241 && mouseX<=277)
 if (mouseY>=94 && mouseY<=139)
 {imageMode(CORNER);
 image(img3,0,0);
 }
}


