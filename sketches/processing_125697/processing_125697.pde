
//Stopmotion sequence
PImage Bild9;
PImage Bild10;
PImage Bild11;
PImage Bild12;
PImage Bild13;
 

int numFrames = 9;
int frame = 0;

//Manual sequence
PImage[] images = new PImage[numFrames];
 
int counter1 = 0;
int counter2 = 0;
int lastTime;
 
 
void setup()
{
  size(1000, 900);
 
 
  images[0]  = loadImage("Bild1.jpg");
  images[1]  = loadImage("Bild2.jpg");
  images[2]  = loadImage("Bild3.jpg");
  images[3]  = loadImage("Bild4.jpg");
  images[4]  = loadImage("Bild5.jpg");
  images[5]  = loadImage("Bild6.jpg");
  images[6]  = loadImage("Bild7.jpg");
  images[7]  = loadImage("Bild8.jpg");
 
  Bild9 = loadImage("Bild9.jpg");
  Bild10 = loadImage("Bild10.jpg");
  Bild11 = loadImage("Bild11.jpg");
  Bild12 = loadImage("Bild12.jpg");
  Bild13 = loadImage("Bild13.jpg");
 
  counter1 = 8;
  lastTime=millis();
}

 
void draw()
{  
translate(-300, 0);
    
  if (frame<8) {
    image(images[frame], 0, 0);
    lastTime=millis();
  }
  else {
    if ( counter1 == 9)
    {
      image(Bild9, 0, 0);
    }
 
    else if (counter1 == 10)
    {
      image(Bild10, 0, 0);
    }
 
    else if (counter1 == 11)
    {
      image(Bild11, 0, 0); 
    }
 
    else if (counter1 == 12)
    {
      image(Bild12, 0, 0);
    }
 
    else if (counter1 == 13)
    {
      image(Bild13, 0, 0);
    }
    if ( millis() - 200 > lastTime ) {
      counter1=counter1+1;
      lastTime=millis();
    }
  }
}
 
 
 

void mousePressed()
{
  counter2=counter2+1;
  
  if (mousePressed && (mouseX>150 && mouseX<610) && (mouseY>180 && mouseY<670) && counter2<=5)
  {
    changeImage();
  }
  else if (mousePressed && (mouseX>600 && mouseX<1000) && (mouseY>200 && mouseY<650) && counter2>5)
  {
    changeImage();
  }
}
 
 
 
void changeImage()
{
  if (frame<8)
  {
    frame++;
  }
}


