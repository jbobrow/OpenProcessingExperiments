
/*
PMM2
1337399
Frieze pattern number 1.
*/
  void setup()
  {
    size(500, 100);
    background(0);
    
    smooth();   
  }
   
  void draw()
  {
    stroke(255);
    for(int i =20; i <500; i= i+100)
    {
      
      pattern(i, 20);
       
    }
    
    for(int i =40; i <500; i= i+100)
    {
      
      pattern2(i, 20);
       
    }
    
    println("x:  " + mouseX);
    println("y:  " + mouseY);
     
  }
  
  void pattern(int x, int y)
  {
    strokeWeight(5);
    
    line(x, y, x + 25, y);
    line(x+25, y, x+25, y+25);
    line(x+25, y+25, x, y+25);
    
    line(x, y+35, x + 25, y+35);
    line(x+25, y+35, x+25, y+60);
    line(x+25, y+60, x, y+60);
    
  }
  
  void pattern2(int x, int y)
  {
    strokeWeight(5);
    line(x+15, y, x + 40, y);
    line(x+15, y, x+15, y+25);
    line(x+15, y+25, x+40,y+25); 
    
    line(x+15, y+35, x+40, y+35);
    line(x+15, y+35, x+15, y+60);
    line(x+15, y+60, x+40, y+60);
   
    
    
  }


