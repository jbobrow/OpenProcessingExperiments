
PImage img1;
PImage img2;
PImage img3;
PImage img4;


void setup()
{
size(800, 600);  
img1 = loadImage("hintergrund.png");
img2 = loadImage("blatt01.png");
img3 = loadImage("blatt02.png");
img4 = loadImage("blatt03.png");

}

void draw()
{
  
  image(img1, 0, 0); //image(img, mouseX, mouseY, 500, 400);
  
  
  if (mouseX >= 50)
    {
  image(img2, 50, 100);
    }
    
  if (mouseX >= 300)  
    {
  image(img3, 300, 100);
    }
    
  if (mouseX >= 500)
    {
  image(img4, 599, 100);
    }


  if(mousePressed)
{
  tint(230, 50, 50);
}

 else
 {
   noTint();
 }


}


