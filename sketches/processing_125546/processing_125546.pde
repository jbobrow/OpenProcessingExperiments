
PImage img; 
PImage img2;  
PImage img3; 
PImage img4; 

float counter = 0; 

void setup()
{
  size(900, 600); 
  img = loadImage("CC7.jpg"); 
  img2 = loadImage("CC13.png"); 
  img3 = loadImage("CC14.png");
  img4 = loadImage("CC15.png"); 
}

void draw() 
{
  background(0);
  imageMode(CORNER);  
  image(img, 0, 0);
  
  imageMode(CENTER); 
  image(img2, mouseX, mouseY, 500, 333);
  
  if (mousePressed == true)
    {
        tint(0, 153, 204, mouseX);  
      
    }
    else
    {
        noTint(); 
    }
     translate(width/2, height/2);
     
     
  if (mouseX>=700)
  {
  pushMatrix();
  translate(350, sin(counter)*100);
  image(img3, 0, -200); 
  popMatrix();
  
  counter += 0.05;
  
  }
  else if (mouseX<=900) 
  {
  counter += 0.0005;
  }
  
  if (mouseX >=450)
  {
  pushMatrix();
  translate(80, sin(counter)*100);
  image(img3, 0, -200); 
  popMatrix();
  
  counter += 0.05;
  
  }
  else if (mouseX<=450)
  {
  counter += 0.0005;
  }
  
  if (mouseX >=150)
  {
  pushMatrix();
  translate(-200, sin(counter)*100);
  image(img3, 0, -200); 
  popMatrix();
  
  counter += 0.05;
  
   }
  else if (mouseX <=150)
  {
  counter += 0.0005;
  }
}


