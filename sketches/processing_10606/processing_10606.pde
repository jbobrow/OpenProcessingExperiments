
void setup()
  {
  size (500,500);

  rectMode(CORNER);
     strokeWeight(20); 
     strokeCap(SQUARE);
  
  }
  
  void draw()
    {
      

      translate(5,5);
      
      
      
     //width 
      
    for (int i=0; i<width; i=i+51)
    {

    line (0,i,width-i,i);
    }
    
    
    
    //height
    
    for (int a=0; a<height; a=a+50)
    {
    line (a,0,a,height-a+50);
    }
    
    

    
    
    }
  

