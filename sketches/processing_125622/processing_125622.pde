
PImage img;
PImage img2;
PImage img3;


void setup()
{
  size(700,600);
  img = loadImage("Mandarineglueck.jpg");
  img2 = loadImage("Hand.png");
  img3 = loadImage("Mandarinenschale.jpg");
}


void draw()
{
  imageMode(CENTER);
  image(img,350,300);
  
  
  image(img2,mouseX,mouseY);
  noTint();
 
 
  {
  if (mousePressed == true) {
    image(img3,350,300);
    noTint();
  }
  
  {
    if (mouseX > 180)
    { tint(255,153,204);
    }
    
}
}
}



