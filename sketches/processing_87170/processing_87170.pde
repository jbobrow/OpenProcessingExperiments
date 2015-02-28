
void setup () {
  size (500,400);
  smooth ();
  background (17, 67, 70);
  int Triangle_scale = 200;
  int centerx=width/2;
  int centery=height/2;
  int ax=centerx;
  int bx=centerx-Triangle_scale;
  int cx=centerx+Triangle_scale;
  int ay=centery-Triangle_scale;
  int by=centery+Triangle_scale;
  int cy=by;
  triangle(ax,ay,bx,by,cx,cy);
for(int i=Triangle_scale; i>0; i=i-15)
  { 
     bx=centerx-i;
     cx=centerx+i;
     ay=centery-i;
     by=centery+i;
     cy=by;
     fill(6,139,147);
     triangle(ax,ay,bx,by,cx,cy);
  }
   
// Left Side
fill(70,38,17);
strokeWeight(2);
  beginShape ();
  vertex(171,45);
  vertex(180,35);
  vertex(211,36);
  vertex(231,54);
  vertex(231,108);
  vertex(211,125);
  vertex(179,125);
  vertex(171,117);
  vertex(171,45);
  endShape ();
  line(180, 36, 180, 125);
  line(211, 36, 211, 125);
  
  //Center
  strokeWeight(1);
  fill(147,71,21);
  quad(231, 54, 231, 108, 272, 108, 272, 53);
  line(242, 54, 232, 108);
  line(260, 53, 270, 108);
  
  
  beginShape (); // Right Side
  strokeWeight(2);
  fill(70,38,17);
  vertex(271,54);
  vertex(292,36);
  vertex(324,36);
  vertex(332,45);
  vertex(333,116);
  vertex(323,125);
  vertex(292,126);
  vertex(271,107);
  vertex(271,54);
  endShape ();
  
  line(292, 36, 292, 125);
  line(323, 36, 323, 125);
 
  
  //Handle + Grip
  strokeWeight(1);
  fill(147, 89, 50);
  quad(243, 108, 260, 108, 260, 360, 243, 360);
   
  
 // Rope
  strokeWeight(1);
  line(243, 278, 260, 288);
  line(243, 288, 260, 298);
  line(243, 298, 260, 308);
  line(243, 308, 260, 318);
  line(243, 318, 260, 328);
  line(243, 328, 260, 338);
  line(243, 338, 260, 348);
  line(243, 348, 260, 358);
  
 // Rope
  line(260, 288, 243, 296);
  line(260, 298, 243, 306);
  line(260, 308, 243, 316);
  line(260, 318, 243, 326);
  line(260, 328, 243, 336);
  line(260, 338, 243, 346);
  line(260, 348, 243, 356);
 
  // Bolts
  fill(17,67,70);
  ellipse(251, 63, 15, 15);
  ellipse(238, 103, 5, 5);
  ellipse(265, 103, 5, 5);
  
  //arc(252, 369, 10, 10, 90, 180);
  strokeWeight(1);
  fill(147, 89, 50);
  arc(251.5, 360,  17, 20, radians(0), radians(180));

 


}







