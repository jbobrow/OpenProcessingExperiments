
/**************************************************************************************
* Assignment 1
 * Name:          Alicja Kielczewska
 * Email:         akielcze@haverford.edu
 * Course:        CS 110 - Section 2
 * Submitted:     1/26/2012
 *
 * This is a sketch of Toad, my favorite character from the Mario games.
 His distinctive features are his Mushroom-top hat and matching vest.
 I used many different techniques to create Toad. Most of his body is 
 made up of a series of arcs and ellipses. His arms are made up of lines 
 with a heavy strokeWeight. His smile is made up of a bezier curve. His two-tone
 vest is made up of a custom shape and triangle. I had difficulties with making 
 the hat seem as through it is three-dimensional and look like it is being worn 
 on its hat rather than just sitting on top of his head. I had to work with layering
 and create some parts of his hat before making his head and other parts of his hat
 afterward. I also had trouble choosing points for bezier curves. 
*************************************************************************************/
void setup () {
  size (500, 500);
  background (0, 0, 200);

  //Toad's shoes 

  smooth();
  fill (72, 35, 14);
  ellipse (200, 450, 80, 45);
  ellipse (300, 450, 80, 45);
  stroke (90, 44, 17);
  fill (90, 44, 17);
  ellipse (185, 450, 40, 30);
  ellipse (295, 455, 40, 30); 
  fill (120, 60, 40);
  ellipse (185, 450, 25, 18);
  ellipse (295, 455, 25, 18);
  fill (160, 120, 100);
  ellipse (180, 450, 15, 10);
  ellipse (290, 450, 15, 10);

  //Toad's white pants

  fill (200, 200, 205);
  arc (250, 380, 105, 140, 0, 3.14);
  stroke (200, 200, 205);
  fill (255, 255, 255);
  arc (240, 380, 75, 130, 0, 3.14);

  //Toad's torso

  fill (250, 190, 150);
  arc (250, 380, 105, 140, 3.14, 6.28);

  //Toad's arms

  stroke (250, 190, 150);
  strokeWeight (15);
  line (220, 330, 170, 390);
  line (275, 330, 325, 390);

  //Toad's hands 

  ellipse (175, 390, 5, 10);
  ellipse (320, 390, 5, 10);

  //Toad's head

  strokeWeight (1);
  fill (200, 200, 205);
  arc (202, 270, 70, 20, 0, 3.14);
  arc (295, 270, 70, 20, 0, 3.14);
  fill (250, 190, 150);
  stroke (0);
  ellipse (250, 290, 90, 80);

  //Toad's hat (some parts are done in the head section)

  fill (200, 200, 205);
  arc (250, 270, 180, 220, 3.14, 6.28);
  fill (255, 255, 255);
  stroke (200, 200, 205);
  arc (228, 270, 130, 200, 3.14, 6.28);
  fill (240, 0, 0);
  stroke (0);
  ellipse (250, 210, 80, 80);
  stroke (240, 0, 0);
  strokeWeight (4);
  bezier (180, 200, 170, 220, 160, 250, 157, 270);
  bezier (320, 200, 330, 220, 340, 250, 343, 270);
  strokeWeight (1);
  bezier (180, 200, 190, 180, 226, 165, 235, 160);

  //Toad's vest 

  beginShape ();
  vertex (230, 328);
  vertex (200, 400);
  vertex (200, 345);
  vertex (220, 322);
  endShape (CLOSE);
  beginShape ();
  vertex (268, 328);
  vertex (298, 400);
  vertex (298, 345);
  vertex (279, 322);
  endShape (CLOSE);
  fill (235, 220, 60);
  triangle (200, 400, 230, 400, 230, 328);
  triangle (298, 400, 268, 400, 268, 328);


  //Toad's face

  stroke (0);
  fill (0);
  ellipse (230, 285, 8, 18);
  ellipse (270, 285, 8, 18);
  fill (255);
  ellipse (230, 280, 4, 4);
  ellipse (270, 280, 4, 4);
  noFill ();
  bezier (230, 310, 240, 320, 260, 320, 270, 310);
}



