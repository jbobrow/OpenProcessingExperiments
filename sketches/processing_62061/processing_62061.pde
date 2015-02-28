
public class Animator extends NApplet {
  
  int lineX_T=0;

  void setup ()
  {
    size (400,195);
  }

  void draw ()
  {
    stroke(0,20,100);
    strokeWeight(2);
    line (lineX_T,mouseY,lineX_T,pmouseY); 
    lineX_T ++;

   
    if (lineX_T > width) 
    {
      lineX_T=0;
      background (200);
    }
  }
}


