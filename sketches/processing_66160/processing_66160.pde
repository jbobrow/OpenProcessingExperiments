
void setup(){
  size(425,400);
  background(232, 205, 164);
  ellipseMode(RADIUS);
  noFill();
  noStroke();
  smooth();
  
  //some background shading
  fill(186, 187, 219, 70);
  ellipse(425, 400, 380, 295);
  //spiral at bottom of painting
  //line form
    stroke(0);
    bezier(275, 250, 363, 249, 411, 317, 275, 400); //outside right
    bezier(275, 250, 156, 259, 192, 379, 263, 362); //outside left
    bezier(263, 362, 317, 350, 331, 328, 319, 300); //inside right
    bezier(319, 300, 285, 265, 247, 299, 249, 325); //final inside curlycue
  //circle at end
    fill(0);
    noStroke();
    ellipse(249,325,15,15);
  //circle midway on right
    ellipse(335, 352, 10, 10); //black base
    //reddish fill
    fill(216,74,22);
    arc(335, 352, 10, 10, -0.76, 2.3);
  
  //spiral at top
  //line form
    stroke(0);
    noFill();
    bezier(262, 0, 258, 10, 248, 27, 238, 63); //first ellipse to second, top
    bezier(238, 63, 224, 115, 230, 164, 265, 175); //down to third circle
    bezier(265, 175, 327, 194, 400, 120, 350, 63); //outside right
    bezier(350, 63, 326, 24, 205, 95, 275, 150); //inside left
    bezier(275, 150, 295, 175, 351, 131, 348, 106); //inside right
    bezier(348, 106, 351, 79, 286, 71, 300, 113); //final curlycue
  //circle at end
    noStroke();
    fill(0);
    ellipse(300, 113, 14, 13);
  //circle at top
    ellipse(262, 0, 25, 25); //black base
    //reddish fill
    fill(216, 74, 22);
    arc(262, 0, 25, 25, 0, 1.93);
  //smaller circle below big one
    fill(0);
    ellipse(238, 63, 10, 8);
    //reddish fill
    fill(216, 74, 22);
    arc(238, 63, 10, 8, -1.3, 1.7);
  //smaller circle near bottom of spiral
    fill(216, 74, 22);
    ellipse(265, 175, 9, 9); //reddish base
    //black fill
    fill(0);
    arc(265, 175, 9, 9, 0.3, 3.5);
    
  //red sliver in top left corner
    fill(216, 74, 22);
    arc(0, 0, 5, 14, 0, PI/2);
   
  //three-part shape along left side
  //long line at top with three circles on it
     stroke(0);
     noFill();
     bezier(106, 0, 66, 102, 97, 196, 69, 238); //main line
     fill(0);
     bezier(69, 238, 64, 276, 14, 298, 0, 256); //filled-in bottom
  //line joining two filled-in sections at bottom left
     noFill();
     bezier(69, 238, 117, 225, 132, 240, 144, 275);
  //filled in wedge at bottom
     fill(0);
     bezier(144, 275, 106, 307, 99, 385, 150, 400);
  //line continues up on the right side
     noFill();
     bezier(144, 275, 187, 176, 165, 166, 175, 63);
  //circle at top of left arm
  //kill me now 
     noStroke();
     fill(0);
     ellipse(92, 54, 15, 15); //black base
     fill(216, 74, 22);
     arc(92, 54, 15, 15, 1.8, 4.9); //reddish fill
  //middle circle on left arm
     fill(0);
     ellipse(85, 125, 14, 12); //black base
     fill(216, 74, 22);
     arc(85, 125, 14, 12, -(PI/2), PI/2); //reddish fill
  //bottom circle on left arm
     fill(216, 74, 22);
     ellipse(82, 185, 14, 12); //reddish base
     fill(0);
     arc(82, 185, 14, 12, -(PI/2), PI/2); //black fill
  //top circle on right arm
     fill(0);
     ellipse(172, 125, 14, 12); //black base
     fill(216, 74, 22);
     arc(172, 125, 14, 12, 1.55, 4.72); //reddish fill
  //bottom, bigger circle on right arm
     fill(0);
     ellipse(173, 183, 24, 20); //black base
     fill(216, 74, 22);
     arc(173, 183, 24, 20, -1.57, 1.67); //reddish fill
  //circle on middle bridge
     fill(0);
     ellipse(113, 237, 12, 12); //black base
     fill(216, 74, 22);
     arc(113, 237, 12, 12, 0.3, 3.5); //reddish fill
 
   //corner line
   //line in corner
     noFill();
     stroke(0);
     bezier(53, 0, 25, 66, 21, 28, 0, 100);
  //first circle
     noStroke();
     fill(0);
     ellipse(25, 45, 10, 10); //black base
     fill(216, 74, 22);
     arc(25, 45, 10, 10, -0.7, 2.3); //reddish fill
  //circle on left, cut off
     fill(0);
     bezier(0, 75, 27, 86, 17, 112, 0, 113);//black base
     fill(216, 74, 22);
     triangle(0, 75, 0, 113, 6, 78);//reddish sliver

  //eye shape at bottom
     //black part
     fill(0);
     stroke(0);
     bezier(50, 375, -76, 251, -135, 311, -147, 375); //top half
     bezier(50, 375, -87, 456, -144, 381, -144, 375); //bottom half
     noFill();
     bezier(0, 325, 8, 320, 19, 302, 7, 290); //top eyelash
     bezier(13, 345, 37, 340, 47, 325, 47, 300); //middle eyelash
     bezier(28, 360, 75, 358, 76, 338, 75, 315); //bottom eyelash
     //yellow part
     noStroke();
     fill(255, 226, 0);
     bezier(47, 375, 18, 373, 16, 316, -60, 375);//top half
     triangle(47, 375, 0, 375, 0, 390);
   
   //blue triangle
     fill(68, 70, 137);
     triangle(380, 400, 400, 400, 416, 375);
     
   //stars
   //left star
   stroke(0);
   line(175, 210, 218, 240);
   line(218, 210, 175, 240);
   line(175, 225, 218, 225); //horz
   line(197, 210, 197, 250); //vert
   //right star
   line(352, 170, 413, 238);
   line(352, 238, 413, 170);
   line(352, 204, 413, 204); //horz
   line(382, 165, 381, 238); //vert

   //barbells
   //top left
   fill(0);
   ellipse(137, 3, 15, 15);
   ellipse(137, 55, 15, 11);
   line(137, 3, 137, 55);
   //top right (with line)
   ellipse(360, 10, 12, 12);
   line(360, 10, 340, 0);
   //far right corner
   ellipse(410, 7, 8, 8);
   //far right side, vertical
   ellipse(418, 67, 15, 12);
   ellipse(418, 137, 12, 12);
   line(418, 67, 418, 137);
   //far right, beneath star
   ellipse(389, 255, 10, 10);
   ellipse(390, 320, 15, 13);
   line(392, 255, 392, 320);
   //horizontal, between stars
   ellipse(273, 207, 10, 9);
   ellipse(325, 211, 9, 8);
   line(273, 207, 325, 211);
}



