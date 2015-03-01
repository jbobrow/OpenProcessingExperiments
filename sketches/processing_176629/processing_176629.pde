
PImage HP;

//setup 
void setup () {
  size (500, 697);
  HP = loadImage ("HP.jpg");
  loop();
  smooth();
  PFont hoefler = loadFont ("Hoefler.vlw");
   colorMode (HSB, width, height, 100);
}

//drawing image to screen
void draw (){

  image (HP, 0, 0);

//Harry, the boy who lived
//body/robes
stroke (#000000);
fill (#000000);
rect (350, 350, 45, 100);

//head
fill (#F0AC85);
noStroke ();
ellipse (372, 325, 50, 50);

//scarf
fill (#830D00);
rect (372, 350, 20, 40);
rect (350, 350, 46, 10);
stroke (#FAC70D);
strokeWeight (3);
line (373, 390, 390, 380);
line (373, 380, 390, 370);
line (373, 370, 390, 360);
line (349, 360, 360, 349);
line (360, 360, 371, 349);
line (371, 360, 383, 349);
line (383, 360, 395, 349);

//lightning scar
stroke (#030202);
strokeWeight (2);
line (372, 310, 370, 315);
line (370, 315, 374, 313);
line (374, 313, 372, 320);

//glasses
line (368, 325, 376, 325);
fill (#F5F5F5);
ellipse (363, 325, 12, 12);
ellipse (381, 325, 12, 12);

//arms and legs
strokeWeight (15);
line (350, 370, 305, 325);
line (400, 370, 415, 420);
line (360, 450, 360, 500);
line (385, 450, 385, 500);


//spell
if (mousePressed) {
      fill (mouseX, mouseY, 100);
      stroke (mouseX, mouseY, 100);
        strokeWeight (20);
        point (300, 285);
        noStroke();
     ellipse (200, 245, 20, 20);
     ellipse (275, 270, 10, 10);
     ellipse (150, 220, 15, 15);
     ellipse (300, 260, 5, 5);
     ellipse (375, 240, 20, 20);
     ellipse (390, 210, 10, 10);
     ellipse (382, 185, 15, 15);
     ellipse (312, 240, 14, 14);
     ellipse (250, 225, 12, 12);
     ellipse (130, 180, 15, 15);
  PFont hoefler = loadFont ("Hoefler.vlw");
    textFont (hoefler);
    textSize (80);
    textAlign (CENTER);
     text ("Always", 250, 200);
  
}
    //wand
     stroke (#5D2400);
     strokeWeight (7);
      line (305, 330, 300, 290);
}





