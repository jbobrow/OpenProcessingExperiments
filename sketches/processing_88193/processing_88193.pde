
 void setup()
 {
   size(400,400);
 }
 
 void draw()
 {
  // background(5);
   pushMatrix();
   translate(200,200);
   rotate(mouseX);
   scale(.75);
   rect(0,0,100,100);
   ellipse(0,0,100,100);
   popMatrix();
   
 }

