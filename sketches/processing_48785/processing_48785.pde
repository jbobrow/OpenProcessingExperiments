
public class Spot{
  
  private float x;
  private float y;
  private int diam;
  private int r;
  private int g;
  private int b;
  private float i;
  public float dn;
 
 public Spot(float x, float y)
 {
   this.x = x;
   this.y = y;
   diam = int(random(10));
   r = int(random(255));
   b = int(random(255));
   g = int(random(255));
   i=0;
   dn=random(1.00);
 }
 
 public void display(){
   fill(r,g,b,200);
   ellipse(x,y,diam,diam);
   if(diam > 30){
     diam = 0;
   }
   else{
     diam++;
   }
   if(keyPressed==true){
     if(key==' ')
     {
       x+=noise(i)*5-2.3;
       y+=noise(i)*5-2.3;
       i+=dn;
     }
   }
   
 }
 public float getX()
 {
   return x;
 }
 public float getY()
 {
   return y;
 }
}

