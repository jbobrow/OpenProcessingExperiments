
size (1200, 600);
background (255);
int i;
float posY;
float posX;

for (i=0; i<500; i++)
  {
    posY = i * 50;
    posX= i * 800;
   line(0, 0, i*5, posX);
    line(300, 0, i*5, posY);
    line(600, 0, i*5, posY);
    line(900, 0, i*5, posY);
    line(1200, 0, i*5, posY);
    
    line(i*5, 0, 1200, posY); 
    line(i*5, 0, 600, posY);
    
    
    
    
    
      
  }
