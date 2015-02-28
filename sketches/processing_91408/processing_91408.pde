
 float gray = 0.0;
 int [] x = { 50, 61, 83, 69, 71, 50, 29, 31, 17, 39};
 int [] y = { 18, 37, 43, 60, 82, 73, 82, 60, 43, 37};
 
 
 int [] x2 = new int[5]; 
 int [] y2 = new int[5];
 
 
 void setup () {
   
 size (400,400);
 background (255); 
 
 
 }
 
 void draw () {
   for (int i= 0; i < 400; i++)
   {
     float percent = (float)i /400; 
     stroke (255 * percent, 0, 0);
     line (0, i, 400, i);
   }  
   for (int i = 0; i < 400; i += 40)
   {
     stroke (255); 
     line (0, i, 400, i);
     line (i, 0, i, 400);
   }
   
   
   pushMatrix (); 
   translate (100, 0); 
   rotate (radians(90)); 
   drawShapes (0);
   popMatrix (); 
   

   
 }
   
 void drawShapes (float offset)
 {
 beginShape ();
   for (int i = 0; i < x.length; i++)
   {
     vertex(x[i] + offset, y [i] + offset);
   }
   endShape (); 
 }



