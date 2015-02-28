
//int sizeX = 20;
//int sizeY = 20;


void setup()



{
 rectMode(CENTER);
 size(300, 300);
 background(255);
 noStroke();
 fill(0);
 smooth();
}

void draw()
{
float x = mouseX;
float y = mouseY;



 for (int r = 10; r < width; r +=20)
{
  for(int c = 10; c < height; c+=20)
  {

    pushMatrix();
    translate(r, c);
    
    rotate(radians(45));
    rectMode(CENTER);
    
    rect(0, 0, 20, 20);
    
    //rect(0,0, sizeX, sizeY); 
    
    popMatrix();
    
  } 
}
}
                
                                
