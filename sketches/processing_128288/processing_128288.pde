
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;

void setup() {
  size(500,500);
  img1 = loadImage("hand.png");
  img2 = loadImage("1.jpg");
  img3 = loadImage("2.jpg");
  img4 = loadImage("3.jpg");
  img5 = loadImage("4.jpg");
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
  
    if (mousePressed == true )
    { image(img6,mouseX-150,mouseY-100);
    }
    else
   {  image(img1,mouseX-150,mouseY-100);
    noTint();
   }

  // && mouseY >= 150 && mouseY < 300 && mouseX >= 300 && mouseX <= 420 
}


