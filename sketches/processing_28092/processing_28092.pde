
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
    line(x+20, y+10, x+20, y);
    line(x+20, y, x, y);
    line(x, y, x, y+55);
    line(x, y+55, x+15, y+55);
    line(x+15, y+55, x+15, y+25);
    line(x+15, y+25, x+25, y+25);
    
    
  }
  
  void pattern2(int x, int y)
  {
    strokeWeight(5);
    line(x+20, y+25, x+10, y+25);
    line(x+20, y+25, x+20, y+55);
    line(x+20, y+55, x+35, y+55);
    line(x+35, y+55, x+35, y);
    line(x+35, y, x+15, y);
    line(x+15, y, x+15, y+10);
    
  }


