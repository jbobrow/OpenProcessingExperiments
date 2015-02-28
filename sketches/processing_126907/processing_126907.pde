
int monsterX;
int monsterY;

void setup () {
  size(600,600);
  monsterX = 300;
  monsterY = 300;
}

void draw () {
  background (255,255,255);
  
  /*monsterX = 300
    monsterY = 300*/
    
    
  /*nagel 1 rechts*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(monsterX+191,monsterY-97,monsterX+190,monsterY-88,monsterX+175,monsterY-96);  
  
  /*nagel 2 rechts*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(monsterX+209,monsterY-83,monsterX+196,monsterY-60,monsterX+193,monsterY-85);
  
  /*nagel 3 rechts*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(monsterX+210,monsterY-56,monsterX+164,monsterY-57,monsterX+188,monsterY-83);
  
  /*arm rechts*/
  fill (46, 82, 78);
  ellipseMode (CENTER);
  ellipse (monsterX+110,monsterY+-70,190,70);
  
  /*nagel 1 links*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(monsterX-189,monsterY+-88,monsterX-173,monsterY+-96,monsterX-186,monsterY-99);  
  
  /*nagel 2 links*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(monsterX-196,monsterY+-85,monsterX-193,monsterY+-54,monsterX-210,monsterY+-83);
  
  /*nagel 3 links*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(monsterX-169,monsterY+-57,monsterX-195,monsterY+-82,monsterX-208,monsterY+-52);
  
  /*arm links*/
  fill (46, 82, 78);
  ellipseMode (CENTER);
  ellipse (monsterX-110,monsterY-70,190,70);
  
  /*nagel 1 rechts*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(monsterX+145,monsterY+118,monsterX+145,monsterY+109,monsterX+122,monsterY+114);  
  
  /*nagel 2 rechts*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(monsterX+142,monsterY+118,monsterX+138,monsterY+131,monsterX+158,monsterY+124);
  
  /*nagel 3 rechts*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(monsterX+144,monsterY+122,monsterX+120,monsterY+134,monsterX+149,monsterY+139);
  
  /*voet rechts*/
  fill (250, 228, 185);
  ellipseMode (CENTER);
  ellipse (monsterX+85,monsterY+125,130,40);
  
  /*nagel 1 links*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(monsterX-146,monsterY+121,monsterX-139,monsterY+113,monsterX-149,monsterY+110);  
  
  /*nagel 2 links*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(monsterX-143,monsterY+130,monsterX-137,monsterY+119,monsterX-160,monsterY+125);
  
  /*nagel 3 links*/
  fill (255);
  stroke(0);
  strokeWeight (1);
  triangle(monsterX-133,monsterY+138,monsterX-151,monsterY+138,monsterX-139,monsterY+116);
  
  /*voet links*/
  fill (250, 228, 185);
  ellipseMode (CENTER);
  ellipse (monsterX-85,monsterY+125,130,40);
 
  
  /*buik*/
  fill (46, 82, 78);
  ellipseMode (CENTER);
  ellipse (monsterX,monsterY,305,260);
  
  /*binnenkant buik*/
  fill (250, 228, 185);
  ellipseMode (CENTER);
  ellipse (monsterX-0,monsterY-13,235,225);
  
  /*hoofd*/
  fill (46, 82, 78);
  ellipseMode (CENTER);
  ellipse (monsterX-0,monsterY-165,160,120);
  
  /*gezicht*/
  fill (250, 228, 185);
  ellipseMode (CENTER);
  ellipse (monsterX-0,monsterY-157,118,106);
  
  /*driehoekje gezicht*/
  noStroke (); 
   fill (46, 82, 78);
  triangle(monsterX+0,monsterY-179,monsterX+50,monsterY-225,monsterX+-45,monsterY-215);
  
  
  /*oren links*/
 fill (46, 82, 78);
 triangle(monsterX+-60,monsterY-240,monsterX+-20,monsterY-218,monsterX+-65,monsterY-195);
 
 /*oren rechts*/
 fill (46, 82, 78);
 triangle(monsterX+60,monsterY-240,monsterX+65,monsterY-195,monsterX+20,monsterY-218);

 /*mond*/
 stroke(0);
 strokeWeight (3);
 line(monsterX+25,monsterY-140,monsterX-25,monsterY-140);
 
 /*oog links*/
 stroke(0);
 strokeWeight (3);
 line(monsterX+-15,monsterY-167,monsterX-38,monsterY-170);
 
 /*oog rechts*/
 stroke(0);
 strokeWeight (3);
 line(monsterX+15,monsterY-167,monsterX+38,monsterY-170);
 
 /*tand links*/
 fill (255);
 stroke(0);
 strokeWeight (1);
 triangle(monsterX+-15,monsterY-150,monsterX+-10,monsterY-141,monsterX+-20,monsterY-141);
 
  /*tand rechts*/
 fill (255);
 stroke(0);
 strokeWeight (1);
 triangle(monsterX+15,monsterY-150,monsterX+10,monsterY-141,monsterX+20,monsterY-141);
 

 /*bewegend omhoog*/
  monsterY = monsterY - 3;
   /*bewegend met muis*/
  monsterX = mouseX;
 /*herhaling*/
  if (monsterY==-150){
     monsterY=900;
 }
 println("snorlax");
}
