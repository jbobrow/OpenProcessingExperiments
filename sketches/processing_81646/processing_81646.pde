
import geomerative.*;

ArrayList SVGlist;
RShape svg1, svg2, svg3;
float theta = 0;
int diam = 10;
float myRotate, myScale; 

void setup() { 
   RG.init(this);
   size (900,900,P3D);
   background(#ffb400);
   smooth();
   
   
   svg1 = RG.loadShape("art_03.svg"); 
   svg2 = RG.loadShape("art_02.svg"); 
   svg3 = RG.loadShape("art_01.svg");
   
    myRotate = radians (   (int) random(4)* 90  );
    myScale = (int)(random(2) +1) * 1;
  
  
} 
   
   void draw() {
     
     
     //background(0);
   
   pushMatrix();
   translate(width/2,height/2);
   rotateX(theta );
      rotateY(theta );
      rotateZ(sin(theta) );
      scale(18);
      
      RG.shape(svg1, 0, 0);
      
      
      popMatrix();
      
      
      
      theta = theta + 0.01;
     
   }
      
      
   void mousePressed() {
     
     background(#ffb400);
     
     redraw();
   }

