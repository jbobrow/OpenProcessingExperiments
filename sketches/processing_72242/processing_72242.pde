
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
 
RShape txt;
String input = "SQUARE";

void setup()
{
  size(800,350);
  RG.init(this);
  RFont bebas = RG.loadFont("bebas.TTF");
  txt =RG.getText(input);
  txt = RG.centerIn(txt, g, 70);
  smooth();
}
 
void draw()
{
  background (40);
  pushMatrix();
  noStroke();
  fill(0);
  translate (width/2,height/2);
  textAlign(CENTER);
  RG.shape (txt);
  popMatrix();
   
  
   
 for (float i=0;i<0.9999;i+=0.001)
 {
   RPoint pt =txt.getPoint(i);
   pushMatrix();
    translate (width/2,height/2);
   
      pushMatrix();
         translate (pt.x,pt.y);
         noStroke();
        
         float r = random (40,mouseX/3.5);
         float g = random (50,mouseX/3.5);
         float b = random (50,mouseX/3);
         fill(r,g,b);
         rect (15,15,10,10);
       popMatrix();
   popMatrix();
  
 }
  
}

