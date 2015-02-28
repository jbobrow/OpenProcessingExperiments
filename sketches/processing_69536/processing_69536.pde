
/*****************************************
 * Assignment 01
 * Name:  Stephanie Bredbenner
 * E-mail: sbredbenne@brynmawr.edu
 * Course: CS 110 - Section 01
 * Submitted: 9/10/2012
 * My sketch for assignment 1, for which I coded a Bryn Mawr
   lantern (using ellipses, quads, lines and triangles) that 
   switches between the class colors depending on 
   which quadrant the mouse is in. 
***********************************************/
void setup (){
  
  //set up
    size (500, 500);
    background (255);
    smooth ();
    strokeWeight (12);
    stroke (0);
  
  //top of lantern, no color change
    fill (0);
    triangle (90,165, 410,165, 250,60);
    fill(255);
    ellipse (250,50, 75, 70);
    }
  
void draw () {
  
  //color changes
    if (mouseX > width/2 && mouseY > height/2) {
    fill (255, 8, 8);
    }
    if (mouseX > width/2 && mouseY < height/2) {
    fill (24, 109, 242);
    }
    if (mouseX < width/2 && mouseY > height/2) {
    fill (30, 162, 16);
    }
    if (mouseX < width/2 && mouseY < height/2) {
    fill (15, 13, 144);
    }
   
  //outline of lantern
    quad (100,170, 400,170, 360,450, 140,450); 
 
  //owl legs
    quad (190,400, 200,420, 190,450, 190,450);
    quad (300,420, 310,400, 310,450, 305,450);

  //owl body and wings
    ellipse (250,310, 150, 260);
    triangle (325,310, 365,220, 355,380);
    triangle (170,310, 130,220, 145,380);
  
  //owl head
    triangle (290,190, 310,230, 380,170);
    triangle (220,190, 180,230, 120,170);
    ellipse (220,230, 40, 40);
    line (220,210, 220,240);
    ellipse (280,230, 40, 40);
    line (280,210, 280,240);
    triangle (245,250, 255,250, 250,265);
    }

