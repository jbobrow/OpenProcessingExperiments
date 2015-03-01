
//BOB ESPONJA


void setup (){
size (600, 600);
}


void draw (){
background(255);
  
              //Cabeza
fill (#FEFF24);
stroke (#7F8907);
strokeWeight (2);
quad (mouseX-100, mouseY-100, mouseX+100, mouseY-100, mouseX+80, mouseY+80, mouseX-80, mouseY+80);
 
 
              //Ojos
fill (255);
stroke (0);
ellipse (mouseX-33, mouseY-30, 70, 65);
ellipse (mouseX+33, mouseY-30, 70, 65);
 
fill(#0463D3);
strokeWeight (2);
ellipse (mouseX-25, mouseY-15, 20, 20);
ellipse (mouseX+30, mouseY-15, 20, 20);
 
fill(0);
ellipse (mouseX-25, mouseY-15, 8, 8);
ellipse (mouseX+30, mouseY-15, 8, 8);

              //Boca
noFill();
arc (mouseX, mouseY-20, 150, 100, radians (20), radians(160));
arc (mouseX-69, mouseY, 10, 5, radians (180), radians (320));
arc (mouseX+68, mouseY, 10, 5, radians (220), radians (360));
 
             //Nariz
fill (#FEFF24);
stroke(#7F8907);
arc (mouseX-1, mouseY-7, 17, 25, radians (-19), radians (70));
arc (mouseX, mouseY-9, 16, 10, radians (170), radians(359));
arc (mouseX-3, mouseY-8, 8, 12, radians (110), radians (220));
 

 
               //Mofletes
stroke (#FF701C);
arc (mouseX-69, mouseY-10, 25, 20, radians (170), radians (385));
arc (mouseX+70, mouseY-10, 25, 20, radians (155), radians (370));
 
fill (#FF701C);
strokeWeight(0);
ellipse (mouseX-74, mouseY-10, 5, 2);
ellipse (mouseX-69, mouseY-15, 5, 2);
ellipse (mouseX-63, mouseY-10, 5, 2);
 
ellipse (mouseX+65, mouseY-10, 5, 2);
ellipse (mouseX+70, mouseY-15, 5, 2);
ellipse (mouseX+75, mouseY-10, 5, 2);
 
  
                //Dientes
strokeWeight (2);
fill (255);
stroke (0);
quad (mouseX-18, mouseY+29, mouseX-5, mouseY+30, mouseX-5, mouseY+42, mouseX-18, mouseY+41);
quad (mouseX+4, mouseY+30, mouseX+17, mouseY+29, mouseX+17, mouseY+41, mouseX+4, mouseY+42);
 
  
                //Corbata
fill (#FF0900);
beginShape();
vertex (mouseX-5, mouseY+80);
vertex (mouseX+10, mouseY+80);
vertex (mouseX+13, mouseY+85);
vertex (mouseX+8, mouseY+90);
vertex (mouseX-3, mouseY+90);
vertex (mouseX-7, mouseY+85);
vertex (mouseX-5, mouseY+80);
endShape();
 
beginShape ();
vertex (mouseX-3, mouseY+90);
vertex (mouseX+8, mouseY+90);
vertex (mouseX+15, mouseY+110);
vertex (mouseX+1, mouseY+120);
vertex (mouseX-10, mouseY+110);
vertex (mouseX-3, mouseY+90);
endShape ();
 
      //Cuello
noFill();
arc (mouseX-15, mouseY-5, 120, 200, radians (90), radians (120));
line (mouseX-5, mouseY+80, mouseX-15, mouseY+95);
arc (mouseX+20, mouseY-5, 120, 200, radians (60), radians (90));
line (mouseX+10, mouseY+80, mouseX+20, mouseY+95);


               //Barbilla
stroke (#FFAAC9);
arc (mouseX, mouseY+59, 15, 12, radians (200), radians (340));
arc (mouseX-16, mouseY+54, 18, 12, radians (25), radians (175));
arc (mouseX+16, mouseY+54, 18, 12, radians (5), radians (155));

}
