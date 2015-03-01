
size (400, 400);
background(255);


              //Marco
strokeWeight (8);
rect (20, 20, 360, 360);



              //Cabeza
fill (#FEFF24);
stroke (#7F8907);
strokeWeight (2);
quad (100, 100, 300, 100, 280, 280, 120, 280);


              //Ojos
fill (255);
stroke (0);
ellipse (167, 170, 70, 65);
ellipse (233, 170, 70, 65);

fill(#0463D3);
strokeWeight (2);
ellipse (175, 185, 20, 20);
ellipse (230, 185, 20, 20);

fill(0);
ellipse (175, 185, 8, 8);
ellipse (230, 185, 8, 8);

             //Nariz
fill (#FEFF24);
strokeWeight (2);
stroke(#7F8907);
arc (200, 193, 17, 25, radians (-19), radians (70));
arc (200, 191, 16, 10, radians (170), radians(360));
arc (197, 192, 8, 12, radians (110), radians (220));

              //Boca
noFill();
stroke(0);
arc (200, 180, 150, 100, radians (20), radians(160));
arc (131, 200, 10, 5, radians (180), radians (320));
arc (268, 200, 10, 5, radians (220), radians (360));

               //Mofletes
fill (#FEFF24);
stroke (#FF701C); 
arc (131, 190, 25, 20, radians (170), radians (385));
arc (270, 190, 25, 20, radians (155), radians (370));

fill (#FF701C);
strokeWeight(0);
ellipse (126, 190, 5, 2);
ellipse (131, 185, 5, 2);
ellipse (137, 190, 5, 2);

ellipse (265, 190, 5, 2);
ellipse (270, 185, 5, 2);
ellipse (275, 190, 5, 2);

 
                //Dientes
fill (255);
stroke (0);
quad (182, 229, 195, 230, 195, 242, 182, 241);
quad (204, 230, 217, 229, 217, 241, 204, 242); 


               //Barbilla
noFill ();
stroke (#FFAAC9);
arc (200, 259, 15, 12, radians (200), radians (340));
arc (184, 254, 18, 12, radians (25), radians (175));
arc (216, 254, 18, 12, radians (5), radians (155));

                //Corbata
fill (#FF0900);
stroke (0);
strokeWeight (2);
beginShape();
vertex (195, 280);
vertex (210, 280);
vertex (213, 285);
vertex (208, 290);
vertex (197, 290);
vertex (193, 285);
vertex (195, 280);
endShape();

beginShape ();
vertex (197, 290);
vertex (208, 290);
vertex (215, 310);
vertex (201, 320);
vertex (190, 310);
vertex (197, 290);
endShape ();

      //Cuello
 noFill();
arc (185, 195, 120, 200, radians (90), radians (120));
line (195, 280, 185, 295);
arc (220, 195, 120, 200, radians (60), radians (90));
line (210, 280, 220, 295);
