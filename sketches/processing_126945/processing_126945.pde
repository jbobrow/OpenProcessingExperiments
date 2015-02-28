
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
void setup() {
  size(500,448);
  img1= loadImage("cc1.png");
  img2= loadImage("cc2.png");
  img3= loadImage("cc3.png");
  img4= loadImage("cc4.png");
  img5= loadImage("cc5.gif");
}
void draw () {
background(255);
  image(img1,0,0);
  if (mouseX >= 200)
    {
  image(img2, 0, 0);
    }
      
  if (mouseX >= 300)
    {
  image(img3, 0, 0);
  image(img5,300,80);

    }
      
  if (mouseX >= 450)
    {
  image(img4, 0, 0);
  image(img5,-50,60);
    }

  
}



