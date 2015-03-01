
void setup() {
  size(400,400);
  smooth();
  frameRate(1);
}
void draw() {
  int a = 50;
  int b = 49;
  boolean bool;
  background(0);
  while(a+b < 100)
  {
    if((a+b) % 2 == 0)
    {
      bool = true;
    }  
    else
    {
      bool = false;
    }
    
    if (bool == true) {
        ellipse(a+50,a+50,a+50,a+50);
        }
    else{
       ellipse(a+100,a+100,a+100,a+100);
        }
    a=a-1;
    b=b-2;    
  }     
}



 
      
      
      
    


