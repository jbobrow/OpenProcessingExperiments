
Galaxy a, b, c; 

void setup()
{ 
  size (800,450); 
  background(0); 
  smooth(); 
  noStroke(); 
  a = new Galaxy(500); 
  b = new Galaxy(500);
  c = new Galaxy(500);
  a.show(); 
  b.show();
  c.show();

} 
 
 
 
void draw()
{ 
  background(0); 
  fill(244,248,255); 
  a.galaxy(1,.3); 
  fill(245,230,130);
  b.galaxy(1,.2);
  fill(#87CEFF);
  b.galaxy(2,.2);
  

 
} 
 

class Galaxy
{ 
  int numberOfstars = 1000;  
  Star[] star = new Star[numberOfstars]; 
 
   Galaxy(int n)
   { 
      numberOfstars = n; 
    } 

      void show()
      { 
     
        for (int i=0; i<numberOfstars; i++)
        { 
          star[i]= new Star(random(0,width),random(0,height));      
        } 
 
  } 

 
  void galaxy(int b, float c)
   { 
      for (int d=0; d<numberOfstars; d++)
       { 
        star[d].move(b,c);  
       } 
 
  } 
 
  
class Star
{ 
 
    float x,y,z,p,p2; 
 
 
    Star(float x2,float y2 )
    
    { 
      p=x2;  
      y=y2;  
 
    } 
 
   
    void move(int j,float k)
    { 
      float p2 = p - x; 
      ellipse(p2,y,j,j);  
      
        if (p2 < 0)
        { 
          p = p + width;  
        } 
          
            if (p2 > width)
            { 
              p = p - width;  
            } 
     
      x  = x + k; 
    } 
    
  } 
 
 
} 
 
 


