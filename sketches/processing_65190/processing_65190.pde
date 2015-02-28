
/******************************************
*  Keaty
*    
*  self-portrait, smoking
*
*  These shapes include:
*  + a lot of quadrilaterals
*  + also some lines and ellipses

******************************************/

void setup() {
  
  size(400, 525); //size(width, height); in pixels
  smooth(); //this turns on anti-aliasing
}

void draw() {
  
  background(#FF6A6A);
  //glasses color
  fill(#00CED1);
  stroke(#00CED1);
  // quadrilateral left frame
  quad(75, 150, 100, 225, 200, 225, 225, 150);
  // quadrilateral right frame
  quad(200, 150, 225, 225, 325, 225, 350, 150);
  // quadrilateral arms
  quad(73, 150, 73, 175, 352, 175, 352, 150);
  // quadrilateral nose
  quad(200, 175, 200, 195, 225, 195, 225, 175);
  //lens color
  fill(#008080);
  stroke(#222222);
  // quadrilateral left lens
  quad(95, 160, 110, 215, 190, 215, 205, 160);
  // quadrilateral right lens
  quad(220, 160, 235, 215, 315, 215, 330, 160);
  // shine
  fill(#CDC0B0);
  stroke(#222222);
  // quadrilateral left lens shine
  quad(195, 160, 110, 215, 190, 215, 205, 160);
  // quadrilateral right lens shine
  quad(320, 160, 235, 215, 315, 215, 330, 160);
  // quadrilateral cigarette white
  fill(#FAF0E6);
  stroke(#FCF2F9);
  quad(230, 320, 260, 405, 347, 400, 250, 310);  
  // quadrilateral cigarette filter
  fill(#E38217);
  stroke(#FCF2F9);
  quad(230, 320, 240, 350, 282, 340, 250, 310);  
  // ellipse cigarette coal
  fill(#B13E0F);
  stroke(#B13E0F); 
  ellipse(305, 405, 90, 25);
  // hair curve
  fill(#6B4226);
  stroke(#ED9121);
  bezierDetail(1);
  bezier(185, 20, 10, 10, 90, 90, 15, 80);
  stroke(#6B4226);
  bezierDetail(3);
  bezier(25, 20, 10, 10, 90, 90, 15, 80);
  stroke(#ED9121);
  bezierDetail(12);
  bezier(385, 20, 10, 10, 90, 90, 15, 80);
  bezierDetail(1);
  bezier(185, 20, 10, 110, 20, 90, 15, 80);
  stroke(#ED9121);
  bezierDetail(3);
  bezier(25, 20, 10, 10, 90, 90, 15, 80);
  stroke(#ED9121);
  bezierDetail(12);
  bezier(385, 60, 10, 10, 90, 90, 15, 80);
  // ear buds
  fill(#ffffff);
  stroke(#444444);
  ellipse(40, 205, 40, 60);
  // music
  stroke(#ffffff); 
  line(40, 185, 40, 500);
  stroke(#444444); 
  line(43, 235, 43, 500);
  fill(#222222);
  ellipse(32, 160, 4, 4);
  line(34, 160, 34, 140);
  line(43, 235, 43, 500);
  fill(#222222);
  ellipse(42, 150, 4, 4);
  line(44, 150, 44, 130);
}


