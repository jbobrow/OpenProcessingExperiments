
void setup () {
  size(600,600);
}

void draw () {
  background (255,255,255);
  
  /*mouseX = 300
    mouseY = 300*/
    
    
  /*nagel 1 rechts*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(mouseX+191,mouseY-97,mouseX+190,mouseY-88,mouseX+175,mouseY-96);  
  
  /*nagel 2 rechts*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(mouseX+209,mouseY-83,mouseX+196,mouseY-60,mouseX+193,mouseY-85);
  
  /*nagel 3 rechts*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(mouseX+210,mouseY-56,mouseX+164,mouseY-57,mouseX+188,mouseY-83);
  
  /*arm rechts*/
  fill (46, 82, 78);
  ellipseMode (CENTER);
  ellipse (mouseX+110,mouseY+-70,190,70);
  
  /*nagel 1 links*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(mouseX-189,mouseY+-88,mouseX-173,mouseY+-96,mouseX-186,mouseY-99);  
  
  /*nagel 2 links*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(mouseX-196,mouseY+-85,mouseX-193,mouseY+-54,mouseX-210,mouseY+-83);
  
  /*nagel 3 links*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(mouseX-169,mouseY+-57,mouseX-195,mouseY+-82,mouseX-208,mouseY+-52);
  
  /*arm links*/
  fill (46, 82, 78);
  ellipseMode (CENTER);
  ellipse (mouseX-110,mouseY-70,190,70);
  
  /*nagel 1 rechts*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(mouseX+145,mouseY+118,mouseX+145,mouseY+109,mouseX+122,mouseY+114);  
  
  /*nagel 2 rechts*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(mouseX+142,mouseY+118,mouseX+138,mouseY+131,mouseX+158,mouseY+124);
  
  /*nagel 3 rechts*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(mouseX+144,mouseY+122,mouseX+120,mouseY+134,mouseX+149,mouseY+139);
  
  /*voet rechts*/
  fill (250, 228, 185);
  ellipseMode (CENTER);
  ellipse (mouseX+85,mouseY+125,130,40);
  
  /*nagel 1 links*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(mouseX-146,mouseY+121,mouseX-139,mouseY+113,mouseX-149,mouseY+110);  
  
  /*nagel 2 links*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(mouseX-143,mouseY+130,mouseX-137,mouseY+119,mouseX-160,mouseY+125);
  
  /*nagel 3 links*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(mouseX-133,mouseY+138,mouseX-151,mouseY+138,mouseX-139,mouseY+116);
  
  /*voet links*/
  fill (250, 228, 185);
  ellipseMode (CENTER);
  ellipse (mouseX-85,mouseY+125,130,40);
 
  
  /*buik*/
  fill (46, 82, 78);
  ellipseMode (CENTER);
  ellipse (mouseX,mouseY,305,260);
  
  /*binnenkant buik*/
  fill (250, 228, 185);
  ellipseMode (CENTER);
  ellipse (mouseX-0,mouseY-13,235,225);
  
  /*hoofd*/
  fill (46, 82, 78);
  ellipseMode (CENTER);
  ellipse (mouseX-0,mouseY-165,160,120);
  
  /*gezicht*/
  fill (250, 228, 185);
  ellipseMode (CENTER);
  ellipse (mouseX-0,mouseY-157,118,106);
  
  /*driehoekje gezicht*/
  noStroke (); 
   fill (46, 82, 78);
  triangle(mouseX+0,mouseY-179,mouseX+50,mouseY-225,mouseX+-45,mouseY-215);
  
  /*oren links*/
 fill (46, 82, 78);
 triangle(mouseX+-60,mouseY-240,mouseX+-20,mouseY-218,mouseX+-65,mouseY-195);
 
 /*oren rechts*/
 fill (46, 82, 78);
 triangle(mouseX+60,mouseY-240,mouseX+65,mouseY-195,mouseX+20,mouseY-218);

 /*mond*/
 stroke(0);
 strokeWeight (3);
 line(mouseX+25,mouseY-140,mouseX-25,mouseY-140);
 
 /*oog links*/
 stroke(0);
 strokeWeight (3);
 line(mouseX+-15,mouseY-167,mouseX-38,mouseY-170);
 
 /*oog rechts*/
 stroke(0);
 strokeWeight (3);
 line(mouseX+15,mouseY-167,mouseX+38,mouseY-170);
 
 /*tand links*/
 fill (255);
 stroke(0);
 strokeWeight (1);
 triangle(mouseX+-15,mouseY-150,mouseX+-10,mouseY-141,mouseX+-20,mouseY-141);
 
  /*tand rechts*/
 fill (255);
 stroke(0);
 strokeWeight (1);
 triangle(mouseX+15,mouseY-150,mouseX+10,mouseY-141,mouseX+20,mouseY-141);
 
 println("snorlax");
}
