
int x,y;
boolean c;
void setup() {
  size(490,490);
  noStroke();
  smooth();
}
void draw()
{
      background(0);
      fill(0,5);
      rect(-10,-10,900,900);
      for (int  i =0; i < mouseX; i++){
      fill(255);
      rect(x+random(width), y+random(height), 20,20);
      fill(255);
     }
}  
void mouseDragged()
 {
   for(int i=0 ; i<150;i++)
   {
    fill(150,21,250);
    smooth();
    ellipse(x+random(width), y+random(height), 20,20);  
   }
 } 
 
 


