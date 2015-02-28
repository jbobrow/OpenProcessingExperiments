
class Knob
{
 
 private int x,y,d;
 private float position; 
  
 public Knob(int x, int y, int d)
 {
     this.x = x;
     this.y = y;
     this.d = d;
     position = 0;
 }
 
 public void render()
 {
   
   //pushMatrix();
   //translate(x,y);
   fill(#ffee00);
   ellipse(0,0,d,d);
   //fill(255);
   //rotate(radians(position));
   //ellipse(0,-d/3,d/10,d/10);
   //popMatrix();
 }
 
 public void setPosition(int change)
 {
   position = position + change;
  println(position);
 }
  
}

