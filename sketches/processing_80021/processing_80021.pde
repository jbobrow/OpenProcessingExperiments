
PImage bild;
PImage bild2;


void setup(){  
  
  size(800,800);
  
  bild = loadImage("guitar.jpg");
  bild2 = loadImage("P-1-baer-blumen-stehend.jpg");
  
}

void draw(){
  //tint(r, g, b)  Farbfüllung
  //image( bildVariable, x, y);

  background(255,0,0);
  noTint(); //no colour change for images
  
  
  if (mouseX > 200 && mouseX < 400 && 
      mouseY > 200 && mouseY < 400) {
    
        tint(255, 255, 0);
        image(bild, 200, 200);
        
      } 
      else 
  {
    
  tint(183, 31, 31);
  image(bild, 200, 200);
    
  }
  
  
  
  
  //------------------------Bild2
  
   if (mouseX > 400 && mouseX < 600 && 
      mouseY > 200 && mouseY < 400) {
    
        //image(bild, 400, 200);
        tint(255, 255, 0);
        image(bild, 10 + random(380,420), 30 + random(160,220));
        
      } 
      else 
  {
    
  tint(0, 255, 0);
  image(bild, 400, 200);
    
  }
  
  
  
  
  //------------------------- Bild 3
  if (mouseX > 200 && mouseX < 400 && 
      mouseY > 400 && mouseY < 800) {
  
       tint(0, 255, 0);
      image(bild, mouseX, mouseY);
      }
      else
      {
        
       tint(0, 255, 0);
      image(bild, 200, 400);
      }
      
      //Bild 4
      
  if(mouseX > 400 && mouseX < 600 && mouseY > 400 && mouseY < 800 && mousePressed)
      {  
        tint(66, 66, 203);
        image(bild, 400, 400);
      }
  else{
    tint(183, 31, 31);
    image(bild, 400, 400); 
  }
}


