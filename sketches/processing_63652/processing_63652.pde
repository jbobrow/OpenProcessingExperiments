
int value = -50;
float i = 0 ;
float j = 0 ;

void setup()
{
  size (800,800);
}


void draw()
{ background (230);
  
  display();
}

void display() 
{
 

  
  noStroke();
   
   for(int i = 0; i < 8; i++) 
   { 
       
        fill(226,149,255); 
        triangle(0,0,50,50+value,0,50);
        fill(209,126,255); 
        triangle(0,50,50,50+value,50,100+value);
        fill(223,255,129);
        triangle(50,50+value,100,0,100,50);
        fill(214,255,93);
        triangle(50,50+value,100,50,50,100+value);
         
         
        pushMatrix(); 
        
            for(int j = 0; j < 15; j++) 
            { 
           
            fill(223,255,129);
            triangle(0,0,50,50+value,0,50);
            fill(209,126,255); 
            triangle(0,50,50,50+value,50,100+value);
            fill(226,149,255);  
            triangle(50,50+value,100,0,100,50);
            fill(214,255,93);
            triangle(50,50+value,100,50,50,100+value);
            translate(0, 51);   
           }  
        popMatrix(); 
    translate(100, 0); 
     } 
     
       
   }
   
void mouseDragged ()
{
  value=value+1;
  if ( value > 0)
  {
    value=-50;
  }
}
