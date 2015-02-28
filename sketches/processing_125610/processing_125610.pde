
PImage bg; 
PImage img2; 
PImage img3; 
PImage img4; 
PImage img5; 

void setup()
{
  size(700, 800);
  bg = loadImage("BG.jpg");
  img2 = loadImage("Kind.png");
  img3 = loadImage("oben.png");
  img4 = loadImage("unten.png");
}

void draw()
{
  imageMode(CENTER);
  image(bg, width/2, height/2);
  image(img2, width/2, height/2);

 if (mousePressed == true)
  {
    image(img2, width/2, height/2);
  }
  
 else{
   if (mouseY > 400)
  {
    
    image(img4, width/2, mouseY);
    image(img3, width/2, height/2);
  }
  
  else if (mouseY <= 400)
  {
    image(img4, width/2, height/2);
    image(img3, width/2, mouseY); 
  }
 }
}






