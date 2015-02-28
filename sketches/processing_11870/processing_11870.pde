
//SKETCH : "Nightfall". Sunset striking an 8-Bit city.
//WILL COMPRISE OF 1.) background color shapes, 2.) middle dark-
//thin lines, and 3.) foreground transparent color shapes.


void setup () {
size (640, 360);
background (205, 150, 0);
smooth ();
ellipseMode (CENTER);
rectMode (CENTER);
stroke (255, 100);
strokeWeight (1);

//****BACKGROUND SHADE****//
beginShape ();
fill (255, 150, 25);
vertex (0, 300);
vertex (100, 340);
vertex (230, 280);
vertex (230, 247);
vertex (280, 260);
vertex (400, 200);
vertex (400, 0);
vertex (0, 0);
vertex (0, 300);
endShape (CLOSE);

beginShape ();
fill (255, 150, 25);
vertex (165, 360);
vertex (480, 200);
vertex (400, 175);
vertex (400, 0);
vertex (640, 0);
vertex (640, 260);
vertex (440, 360);
vertex (165, 360);
endShape (CLOSE);

//****THELINES****

//ROOF of west building
line (-20, 120, 100, 80);
line (100, 80, 240, 120);
line (240, 120, 100, 180);
line (100, 180, -20, 140);
line (100, 180, 100, 220);
line (100, 220, 240, 160);
line (240, 160, 240, 120);
line (100, 220, -20, 180);
//BODY of west building
line (230, 165, 230, 280);
line (100, 220, 100, 340);
line (100, 340, 0, 300);
line (100, 340, 230, 280);
//DETAILS of west building
line (140, 320, 140, 260);
line (140, 260, 180, 243);
line (180, 243, 180, 303);
line (143, 320, 143, 254);
line (143, 254, 177, 240);
line (177, 240, 177, 303);
line (120, 212, 120, 255);
line (120, 255, 200, 220);
line (200, 220, 200, 179);
line (123, 212, 123, 250);
line (123, 250, 197, 218);
line (197, 218, 197, 178);
//NORTH building BG    
line (0, 20, 60, 40);
line (60, 40, 170, 0);
line (60, 40, 60, 93);
line (0, 30, 60, 50);
line (60, 50, 170, 10);
//EAST building roof
line (200, 0, 280, 20);
line (280, 20, 325, 0);
//EAST building body
line (170, 0, 170, 100); 
line (280, 0, 280, 260);
line (280, 260, 230, 245);
line (280, 260, 400, 200);
line (400, 200, 400, 0);
//EAST building details
line (300, 60, 300, 40);
line (300, 40, 380, 0);
line (380, 0, 380, 20);
line (380, 20, 300, 60);
line (300, 80, 300, 60);
line (300, 60, 380, 20);
line (380, 20, 380, 40);
line (380, 40, 300, 80);
line (300, 100, 300, 80);
line (300, 80, 380, 40);
line (380, 40, 380, 60);
line (380, 60, 300, 100);
line (300, 120, 300, 100);
line (300, 100, 380, 60);
line (380, 60, 380, 80);
line (380, 80, 300, 120);
line (300, 140, 300, 120);
line (300, 120, 380, 80);
line (380, 80, 380, 100);
line (380, 100, 300, 140);
line (300, 180, 300, 160);
line (300, 160, 380, 120);
line (380, 120, 380, 140);
line (380, 140, 300, 180);
line (300, 220, 300, 200);
line (300, 200, 380, 160);
line (380, 160, 380, 180);
line (380, 180, 300, 220);
//SIDEWALK
line (160, 360, 480, 200);
line (160, 363, 480, 203);
line (480, 200, 480, 203);
line (480, 200, 400, 175);
line (440, 360, 640, 260);


//****THEPAINT****
noStroke();

//WEST-NORTH BUILDING

beginShape ();
fill (0, 150, 150, 100);
vertex (-20, 180);
vertex (100, 220);
vertex (230, 165);
vertex (100, 260);
vertex (0, 225);
endShape(CLOSE);

beginShape ();
fill (0, 200, 200, 100);
vertex (105, 180);
vertex (105, 340);
vertex (0, 300);
vertex (0, 145);
endShape(CLOSE);

beginShape ();
fill (200, 255, 150, 100);
vertex (125, 260);
vertex (215, 220);
vertex (215, 175);
vertex (125, 215);
endShape(CLOSE);

beginShape ();
fill (200, 255, 150, 100);
vertex (130, 325);
vertex (190, 300);
vertex (190, 235);
vertex (130, 260);
endShape(CLOSE);

beginShape ();
fill (0, 200, 200, 100);
vertex (160, 100);
vertex (100, 80);
vertex (0, 115);
vertex (0, 0);
vertex (160, 0);
vertex (160, 100);
endShape(CLOSE);

beginShape ();
fill (0, 150, 150, 100);
vertex (60, 40);
vertex (60, 90);
vertex (0, 115);
vertex (0, 0);
vertex (180, 0);
vertex (60, 40);
endShape(CLOSE);

beginShape ();
fill (0, 150, 150, 100);
vertex (100, 340);
vertex (60, 360);
vertex (0, 360);
vertex (0, 300);
vertex (100, 340);
endShape (CLOSE);

beginShape ();
fill (255, 255, 255, 100);
vertex (0, 20);
vertex (60, 40);
vertex (180, 0);
vertex (180, 10);
vertex (60, 50);
vertex (0, 30);
vertex (0, 20);
endShape (CLOSE);

beginShape ();
fill (255, 255, 255, 75);
vertex (100, 175);
vertex (245, 115);
vertex (245, 165);
vertex (100, 225);
vertex (100, 175);
endShape ();

beginShape ();
fill (255, 255, 255, 75);
vertex (280, 20);
vertex (335, 0);
vertex (280, 0);
vertex (280, 20);
endShape ();

beginShape ();
fill (0, 150, 150, 100);
vertex (380, 0);
vertex (280, 60);
vertex (160, 25);
vertex (160, 0);
vertex (205, 0);
vertex (280, 20);
vertex (330, 0);
vertex (380, 0);
endShape (CLOSE);

beginShape ();
fill (0, 100, 100, 100);
vertex (280, 260);
vertex (225, 280);
vertex (225, 240);
endShape (CLOSE);

beginShape ();
fill (100, 200, 200, 80);
vertex (280, 20);
vertex (280, 260);
vertex (230, 250);
vertex (230, 185);
vertex (240, 180);
vertex (240, 120);
vertex (160, 100);
vertex (160, 0);
vertex (280, 0);
vertex (280, 20);
endShape (CLOSE);

beginShape ();
fill (200, 255, 150, 100);
vertex (385, -5);
vertex (385, 20);
vertex (305, 60);
vertex (305, 35);
endShape (CLOSE);


beginShape ();
fill (200, 255, 150, 100);
vertex (385, 15);
vertex (385, 35);
vertex (305, 75);
vertex (305, 55);
endShape (CLOSE);

beginShape ();
fill (200, 255, 150, 100);
vertex (385, 55);
vertex (385, 75);
vertex (305, 115);
vertex (305, 95);
endShape (CLOSE);

beginShape ();
fill (200, 255, 150, 100);
vertex (385, 130);
vertex (385, 150);
vertex (305, 190);
vertex (305, 170);
endShape (CLOSE);

beginShape ();
fill (200, 255, 150, 100);
vertex (385, 155);
vertex (385, 175);
vertex (305, 215);
vertex (305, 195);
endShape (CLOSE);

beginShape ();
fill (200, 255, 150, 100);
vertex (380, 260);
vertex (460, 220);
vertex (630, 260);
vertex (550, 300);
endShape (CLOSE);

beginShape ();
vertex (480, 195);
vertex (640, 120);
vertex (640, 70);
vertex (415, 175);
endShape (CLOSE);

beginShape ();
fill (150, 150, 0, 100);
vertex (380, 280);
vertex (580, 180);
vertex (455, 150);
vertex (640, 60);
vertex (640, 255);
vertex (520, 315);
endShape (CLOSE);

beginShape ();
fill (100, 100, 0, 100);
vertex (360, 360);
vertex (640, 220);
vertex (640, 360);
endShape (CLOSE);

beginShape ();
fill (100, 100, 0, 100);
vertex (640, 100);
vertex (400, 40);
vertex (400, 0);
vertex (640, 0);
endShape (CLOSE);

} //VOID SETUP

