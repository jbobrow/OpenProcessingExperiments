
int x;

int y;



PImage myImage5; 
PImage myImage6; 
PImage myImage7; 
PImage myImage8; 
 
int yPosition = 200; 
int xPosition = 700; 
int speed = -8; 
 
void setup (){ 
  size(1000,1000); 

  
  myImage5 = loadImage("pic5.jpg"); 
  myImage6 = loadImage("pic6.jpg"); 
  myImage7 = loadImage("pic7.jpg"); 
  myImage8 = loadImage("pic8.jpg"); 

} 
 
void draw (){  
  background(0); 
 


 
   
   tint (255, 200); 
   image(myImage8, 0, -500);   
  
    
   tint (-55, 30, 120); 
   image(myImage8, -700, 400); 
   
     tint (100, -50, 450); 
   image(myImage8, 500, -50); 
   
   tint (-100, 40);
   image(myImage8, 200, 200);
     yPosition = yPosition + speed; 
   
   if (yPosition > width){ 
    speed = speed * -1; 
  } else if (yPosition < 00){ 
    speed = speed * -1; 
  }  
 
    
  
     tint (255, 100); 
   image(myImage7, xPosition, 100); 
    
   xPosition = xPosition + speed; 
   
   if (xPosition > width){ 
    speed = speed * -20; 
  } else if (xPosition < 0){ 
    speed = speed * -10; 
  }  
  
    tint (255, 55); 
   image(myImage6, xPosition - 400, -200); 
    
   xPosition = xPosition + speed; 
   
   if (xPosition > width){ 
    speed = speed * -2; 
  } else if (xPosition < 0){ 
    speed = speed * -30; 
    
    
  }  
   
     tint (20, 30); 
   image(myImage5, -200, yPosition); 
    
   yPosition = yPosition + speed; 
   
   if (yPosition > width){ 
    speed = speed * -1; 
  } else if (yPosition < 0){ 
    speed = speed * -1; 
  }  
     tint (255, 75); 
   image(myImage7, -100, yPosition- 65); 
    
   yPosition = yPosition + speed; 
   
   if (yPosition > width){ 
    speed = speed * -1; 
  } else if (yPosition < 0){ 
    speed = speed * -1; 
  }  
} 


