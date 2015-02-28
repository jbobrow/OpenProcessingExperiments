
PImage img1; PImage img2; PImage img3;
PImage img4; PImage img5; PImage img6;
PImage img7; PImage img8; PImage img9;
PImage bg; float r1; float r2;

PImage[] images;

void setup() 
  {
    bg=loadImage("bg.png");
    size(600, 300);
    background(0);
    smooth();
  
    images = new PImage[9];
  
    images[0]=loadImage("01.png");   images[1]=loadImage("02.png");   images[2]=loadImage("03.png");
    images[3]=loadImage("04.png");   images[4]=loadImage("05.png");   images[5]=loadImage("06.png");   
    images[6]=loadImage("07.png");   images[7]=loadImage("08.png");   images[8]=loadImage("09.png");   
  }

void draw()
  {
    for(int i=0; i<2000; i++)
    {
      image(bg, 0, 0);
      
      r1 = random(500); r2 = random(200); image(images[(int)random(0, 9)], r1, r2);
      r1 = random(500); r2 = random(200); image(images[(int)random(0, 9)], r1, r2);
      r1 = random(500); r2 = random(200); image(images[(int)random(0, 9)], r1, r2);
      r1 = random(500); r2 = random(200); image(images[(int)random(0, 9)], r1, r2);          
      r1 = random(500); r2 = random(200); image(images[(int)random(0, 9)], r1, r2);
      r1 = random(500); r2 = random(200); image(images[(int)random(0, 9)], r1, r2);
      r1 = random(500); r2 = random(200); image(images[(int)random(0, 9)], r1, r2);    
      r1 = random(500); r2 = random(200); image(images[(int)random(0, 9)], r1, r2);
      r1 = random(500); r2 = random(200); image(images[(int)random(0, 9)], r1, r2);
    }
  }
  


