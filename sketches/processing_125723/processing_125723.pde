
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;

void setup() {
  size(500,500);
  img1 = loadImage("hand.png");
  img2 = loadImage("IMG_06671.jpg");
  img3 = loadImage("IMG_06701.jpg");
  img4 = loadImage("IMG_06731.jpg");
  img5 = loadImage("IMG_06751.jpg");
  img6 = loadImage("loeffel.png");

}

void draw()
{
  background(0);
  imageMode(CORNER);
  image(img2,0,0);
  
  if (mouseX >= 125 && mouseX <250)
  {
  image(img3,0,0);
}
 if (mouseX >= 250 && mouseX <375 )
  {
  image(img4,0,0);
}
 if (mouseX >= 375 && mouseX <500)
  {
  image(img5,0,0);
}
 image(img1,mouseX,mouseY);
    noTint();
  
    if (mousePressed == true && mouseY >= 25 && mouseY < 200 && mouseX >= 240 && mouseX <= 325 )
    { image(img6,mouseX,mouseY);
    }
     
  
}


