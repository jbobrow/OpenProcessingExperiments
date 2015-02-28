
  void setup () {
 size ( 500,500);
}
  void draw () {
   background (255);
   
   translate (width/2,height/2);
  fill(186,188,188);
   ellipse (0,0,280,280);

 
for (int i=0; i<360; i+=30) { 
 pushMatrix();
 rotate(radians(i)); 
translate(0, 130); 
fill (#05FAF4);

ellipse(0, 0, 20, 20);
popMatrix();
}
   pushMatrix();
   translate (0,0);
  float sec = map(second(),0,60,0,360);
   rotate(radians(sec));
   translate ( 0,0-50);
   fill (0);
   ellipse (0,0, 10,100);
 popMatrix();

 pushMatrix();
  float min = map(minute(),0,60,0,360);
   rotate(radians(min));
   translate ( 0,-50);
   stroke (#434343);
   ellipse (0,0, 10,-90);
 popMatrix();

   pushMatrix();
   float h = map(hour(),0,12,0,360);
rotate(radians(h));
   translate ( 0,-50);
   strokeWeight (5);
   stroke (#717171);
   ellipse (0,0, 10,-70);
 popMatrix();
  

  }

