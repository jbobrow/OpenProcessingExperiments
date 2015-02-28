
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;
PImage img11;
PImage img12;

void setup()
{
  size(600, 400);
  img = loadImage("600_400.jpg");
  img2 = loadImage("Blase.png");
  img3 = loadImage("Blase_3.png");
  img4 = loadImage("Blase_4.png");
  img5 = loadImage("Blase_5.png");
  img6 = loadImage("Blase_6.png");  
  img7 = loadImage("Blase_7.png");
  img8 = loadImage("Blase_8.png");
  img9 = loadImage("Blase_9.png");
  img10 = loadImage("Blase_10.png");
  img11 = loadImage("Blase_11.png");  
  img12 = loadImage("Blase_12.png");

  
}

void draw()
{  
  
  background(255);
  
  image(img, 0, 0);
  
 if (second()>=5)
  {
  image(img2, -30, 0);
  }

   if (second()>=10)
  {
  image(img3, 0, 0);
  }
  
     if (second()>=15)
  {
  image(img4, 0, 0);
  }
  
     if (second()>=20)
  {
  image(img5, 0, 0);
  }
  
     if (second()>=25)
  {
  image(img6, 20, 0);
  }
  
       if (second()>=30)
  {
  image(img7, 10, 20);
  }
     
       if (second()>=35)
  {
  image(img8, -40, 0);
  }
    
    
       if (second()>=40)
  {
  image(img9, 50, 0);
  }
  
   
       if (second()>=45)
  {
  image(img10, 100, 0);
  }
    
       if (second()>=50)
  {
  image(img11, 60, 0);
  }
  
    
       if (second()>=55)
  {
  image(img12, 20, 0);
  }
}



