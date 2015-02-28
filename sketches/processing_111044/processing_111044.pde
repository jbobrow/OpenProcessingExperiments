
PImage masseffect3Image; 
PImage phoneImage;
PImage catImage;
boolean filterApplied = false;

void setup()
{
  
  size(600,650);
  phoneImage = requestImage("phone.jpg");
  catImage = requestImage("cat.jpg");
  
  masseffect3Image = requestImage("masseffect3.jpg");

}

void draw()
{



  if (masseffect3Image.width > 0)
  {
    image(masseffect3Image, 0, 0);
    
    if (filterApplied == false)
    {
      masseffect3Image.filter(INVERT);
      filterApplied = true;
    }
    
    if (phoneImage.width > 0)
{
 image(phoneImage, 0, 500);
  
}

    if (catImage.width > 0)
   {
    
     image(catImage, 500,500);
     
   }
   
  
  
    
    float x = 10;
    float y = 550;
    float prevx = x;
    float prevy = y;
    strokeWeight(2);
    stroke(#000000);
  
  while (x < 545)
  
  {
    
   x += 5;
   if (x > 520)
   {
     y = 550;
   }
   else
   {
     y += random(-10,10);
   }
  line(prevx, prevy, x, y);
  prevx = x;
  prevy = y;
    
  }
  
   for (int i = 0; i < 500; i = i + 50)
   {
    
     line(0, i, 450, i);
     
   }
   
      for (int i = 0; i < 500; i = i + 50)
   {
    
     line(i, 0, i, 450);
     
   }


  }
}



