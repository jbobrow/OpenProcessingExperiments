

                
               // Move the mouse across the image
// to change its value
 


int a = 1;
int b = 2;
int c = 8;
int d = 10;
 
void draw() {
fill (a);
rect (10,10 , 40, 40);
fill (b);
rect (30, 30, 60, 60);
fill (c);
rect (20, 20, 50, 50);
fill (d);
rect (60, 60, 80, 80);
                

}
 
void mouseMoved() {
  a = a + 2;
  if (a > 255) {
    a = 0;
 
     
   }
   
 
  b = b + 2;
  if (b >160){
    b = 0;
 
     
    
  }
   
  c= c+ 2;
  if (c >330) {
    c = 0;
    }
  
  d= d+ 2;
  if (d >300) {
    d= 0;
  }
  
}
 
