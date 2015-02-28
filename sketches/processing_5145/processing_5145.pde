


void setup()
{
  size(800,500);
  frameRate(30);
  background(0);
  noLoop();
  smooth();
}

public class Drawer{
 
 public void drawEllipse(int n) {
   if(n == 0){
   } else {
     drawCircle(n+1);
   drawEllipse(n-1); 
 }
 }
 
 public void drawCircle(int n) {
   noStroke();
 fill(random(10,233),random(10,233),random(10,233),random(10,233));
  ellipse(random(0,800),random(0,800),n,n); 
 }
  
}



void draw()
{
 Drawer dr = new Drawer();
 dr.drawEllipse(180);
}


