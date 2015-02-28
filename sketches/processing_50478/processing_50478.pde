
/*

ERIC™              Assignment 1
Happy Garfields    CS 110 - Section 01

Outline of program:
  * Set style of sketch: canvas size, colors, ...
  * Presentation of sketch
  * Draw Garfields
     * Draw 1st Garfield using variables x and y
     * Replicate 1st Garfield (by setting new values for x and y)
       to create 2nd Garfield. Most of the codes are the same.

*/

void setup (){
 
  // style
    size (900,450); smooth (); textSize (27); noStroke();
    color bgcolor = color (200); background (bgcolor);
    color textcolor = color (128); color skin = color (255,153,0);
  
  // presentation
    fill (textcolor);
    text ("You told me one circle wasn't enough, so I drew two Garfields!", 30,40);
  
  
  
  
    float x; float y; // set variables x, y to help replicate Garfield later  
    
/* 1st Garfield */
  
    // style
      x = 235; y = 270;
      stroke (0);
      strokeWeight (4);
      rectMode (CENTER);
  
    // circular face border
      fill (skin); ellipse (x,y, 300,300);
  
    // paint Garfield
      noStroke();
      fill (255,255,153); rect (x+6,y-15, 194,90);
      fill (255); arc (x,y-125, 105,255, 1, 2.2);
      fill (skin);
        quad (x,y-125, x,y-170, x-50,y-190, x-70,y-190);
        quad (x,y-125, x,y-170, x+50,y-190,x+70,y-190);
      stroke(0);

    // mouth
      fill (255);
      beginShape ();
      vertex (x,y+11);
      bezierVertex (x-20,y+30, x-70,y+30, x-90,y-30);
      vertex (x-90,y+80);
      bezierVertex (x-100,y+150, x+100,y+150, x+100,y+70);
      vertex (x+100,y-30);
      bezierVertex (x+70,y+40, x+30,y+30, x,y+11);
      endShape ();
    
      stroke(0); fill(255,0);
      curve (x,y-200, x-90,y+45, x+100,y+40, x,y-200); // mouth - middle line
      
      fill (0); // teeth
      line (x,y-125, x,y+131); // center line (of whole face, too)
      line (x-60,y+13, x-60,y+120);
      line (x-30,y+25, x-30,y+130);
      line (x+35,y+25, x+35,y+125);
      line(x+70,y+15, x+70,y+115);
    
    // ears
      fill(skin);
      
      beginShape (); // middle-right of ears
      vertex (x-93,y-207);
      bezierVertex (x-90,y-210, x-25,y-195, x,y-170);
      endShape ();
    
      beginShape (); // middle-left of ears
      vertex (x+93,y-207);
      bezierVertex (x+90,y-210, x+25,y-195, x,y-170);
      endShape ();

      beginShape (); // right ear
      vertex (x-75,y-100);
      bezierVertex (x-200,y-200, x-90,y-270, x-5,y-130);
      endShape ();
    
      beginShape (); // left ear
      vertex (x+75,y-100);
      bezierVertex (x+200,y-200, x+90,y-270, x+5,y-130);
      endShape ();
    
    // beards
      fill(255,255,153);
    
      beginShape (); // right beards
      vertex (x-93,y-39);
      bezierVertex (x-170,y, x-100,y-110, x-79,y-60);
      endShape ();

      strokeWeight (3);
        beginShape (); // right beards detail
        vertex (x-93,y-39);
        bezierVertex (x-114,y-33, x-113,y-45, x-100,y-47);
        endShape ();
      strokeWeight (4);
    
      beginShape (); // left beards
      vertex (x+103,y-36);
      bezierVertex (x+170,y, x+100,y-110, x+79,y-60);
      endShape ();
      
      strokeWeight (3);
        beginShape (); // right beards detail
        vertex (x+103,y-36);
        bezierVertex (x+114,y-35, x+114,y-40, x+105,y-45);
        endShape ();
      strokeWeight (4);
 
     // eyes
      fill (255);
    
      beginShape (); // right eye
      vertex (x,y-125);
      bezierVertex (x-100,y-180, x-100,y+30, x-18,y);
      endShape ();
    
      beginShape (); // left eye
      vertex (x,y-125);
      bezierVertex (x+100,y-180, x+100,y+30, x+18,y);
      endShape ();

    // pupils
      fill (0);
      ellipse (x-20,y-45, 12,25);
      ellipse (x+20,y-45, 12,25);
    
    // nose
      fill (245,194,194);
      ellipse (x,y, 36,22);
    
    // insert dots
      PImage dots; imageMode(CENTER); dots = loadImage ("dots.png");
      image (dots, x+8,y-25, 465,419);
      

      

/* 2nd Garfield */

    // style
      x = 665; y = 270;
      stroke (0);
      strokeWeight (4);
      rectMode (CENTER);
  
    // circular face border
      fill (skin); ellipse (x,y, 300,300);
  
    // paint Garfield
      noStroke();
      fill (255,255,153); rect (x+6,y-15, 194,90);
      fill (255); arc (x,y-125, 105,255, 1, 2.2);
      fill (skin);
        quad (x,y-125, x,y-170, x-50,y-190, x-70,y-190);
        quad (x,y-125, x,y-170, x+50,y-190,x+70,y-190);
      stroke(0);

    // mouth
      fill (255);
      beginShape ();
      vertex (x,y+11);
      bezierVertex (x-20,y+30, x-70,y+30, x-90,y-30);
      vertex (x-90,y+80);
      bezierVertex (x-100,y+150, x+100,y+150, x+100,y+70);
      vertex (x+100,y-30);
      bezierVertex (x+70,y+40, x+30,y+30, x,y+11);
      endShape ();
    
      stroke(0); fill(255,0);
      curve (x,y-200, x-90,y+45, x+100,y+40, x,y-200); // mouth - middle line
      
      fill (0); // teeth
      line (x,y-125, x,y+131); // center line (of whole face, too)
      line (x-60,y+13, x-60,y+120);
      line (x-30,y+25, x-30,y+130);
      line (x+35,y+25, x+35,y+125);
      line(x+70,y+15, x+70,y+115);
    
    // ears
      fill(skin);
      
      beginShape (); // middle-right of ears
      vertex (x-93,y-207);
      bezierVertex (x-90,y-210, x-25,y-195, x,y-170);
      endShape ();
    
      beginShape (); // middle-left of ears
      vertex (x+93,y-207);
      bezierVertex (x+90,y-210, x+25,y-195, x,y-170);
      endShape ();

      beginShape (); // right ear
      vertex (x-75,y-100);
      bezierVertex (x-200,y-200, x-90,y-270, x-5,y-130);
      endShape ();
    
      beginShape (); // left ear
      vertex (x+75,y-100);
      bezierVertex (x+200,y-200, x+90,y-270, x+5,y-130);
      endShape ();
    
    // beards
      fill(255,255,153);
    
      beginShape (); // right beards
      vertex (x-93,y-39);
      bezierVertex (x-170,y, x-100,y-110, x-79,y-60);
      endShape ();

      strokeWeight (3);
        beginShape (); // right beards detail
        vertex (x-93,y-39);
        bezierVertex (x-114,y-33, x-113,y-45, x-100,y-47);
        endShape ();
      strokeWeight (4);
    
      beginShape (); // left beards
      vertex (x+103,y-36);
      bezierVertex (x+170,y, x+100,y-110, x+79,y-60);
      endShape ();
      
      strokeWeight (3);
        beginShape (); // right beards detail
        vertex (x+103,y-36);
        bezierVertex (x+114,y-35, x+114,y-40, x+105,y-45);
        endShape ();
      strokeWeight (4);
 
     // eyes
      fill (255);
    
      beginShape (); // right eye
      vertex (x,y-125);
      bezierVertex (x-100,y-180, x-100,y+30, x-18,y);
      endShape ();
    
      beginShape (); // left eye
      vertex (x,y-125);
      bezierVertex (x+100,y-180, x+100,y+30, x+18,y);
      endShape ();

    // pupils
      fill (0);
      ellipse (x-20,y-45, 12,25);
      ellipse (x+20,y-45, 12,25);
    
    // nose
      fill (245,194,194);
      ellipse (x,y, 36,22);
    
    // insert dots
      imageMode(CENTER); dots = loadImage ("dots.png");
      image (dots, x+8,y-25, 465,419); 

   // special: add a little shine to the teeth
   x = 766; y = 279;
   strokeWeight(3); fill(0,0);
   bezier (x-40,y+10, x-42,y+35, x-43,y+35, x-55,y+50);
   bezier (x-55,y+50, x-42,y+65, x-43,y+65, x-40,y+90);
   bezier (x-40,y+90, x-37,y+65, x-38,y+65, x-25,y+50);
   bezier (x-25,y+50, x-38,y+35, x-37,y+35, x-40,y+10);
   
}

