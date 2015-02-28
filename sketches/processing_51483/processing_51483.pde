
/*********************************
 Assignment 01
 Name: Hannah Organick
 Email: horganick@brynmawr.edu
 Course:  CS 110 - Section 02
 Submitted: 1/26/12
 
 This sketch is a reproduction of Van Gogh's "Bedroom in Arles" 
 (the third version, September 1889).  A second program with a 
 photograph of this painting was used to locate the major points 
 in the painting (for example, the coordinates of the lines 
 denoting the corners between walls or the corners between the walls
 and the floor) and then these points were used as a starting place 
 from which to draw the shapes found in this program.
 
 The most difficult part of this sketch was coloring the area 
 surrounding the arc function (which was placed on the sideboard of the 
 bedframe).  I wanted the arc to be concaved up and have the area underneath
 it be part of the bedframe.  However, coloring in the arc filled its
 sector when what I wanted to color was basically a triangle with 
 the smallest side concaved inward.  In order to get the sideboard of the bed 
 to look like this, I drew several polygons in the bedframe color as close
 as I could to the arc (which was not filled in). It probably would have been 
 easier though to have made the main sideboard piece bigger than needed, and put
 a red, filled in arc on  top of it with more regular shaped patches of red and 
 white sheets on top of the extra sideboard right next to the sector.  
 
 **********************************/

void setup() {

  background(255, 255, 255, 255);
  size(599, 500);
  smooth();
  strokeJoin(ROUND);

  /*********************************
   Walls
   The walls, floor, and doors of the room were created by 
   drawing adjoining polygons and filling each with a different color. 
   Details were added to the doors by drawing "open" quadrilaterals 
   on top of the main door panels.   
   **********************************/

  stroke(0);
  strokeWeight(2);

  //BackWall
  fill(176, 196, 222);
  quad(100, 0, 380, 0, 390, 235, 110, 250);

  fill(224, 255, 255);
  //LeftWall
  beginShape();
  vertex(50, 0);
  vertex(100, 0);
  vertex(110, 250);
  vertex(50, 300);
  endShape(CLOSE);

  //RightWall
  beginShape();
  vertex(380, 0);
  vertex(555, 0);
  vertex(560, 345);
  vertex(390, 235);
  endShape(CLOSE);

  fill(100, 149, 237, 175); 
  //LeftDoor
  beginShape();
  vertex(0, 0);
  vertex(0, 370);
  vertex(50, 300);
  vertex(50, 0);
  endShape(CLOSE);

  //RightDoor
  beginShape();
  vertex(555, 0);
  vertex(599, 0);
  vertex(600, 360);
  vertex(560, 345);
  endShape(CLOSE);

  strokeWeight(3);
  stroke(10, 60, 50);
  //LeftDoorDetails
  beginShape();
  vertex(30, 0);
  vertex(32, 139);
  vertex(0, 144);
  endShape();

  beginShape();
  vertex(0, 161);
  vertex(31, 154);
  vertex(33, 325);
  endShape();

  //RightDoorDetails
  beginShape();
  vertex(599, 4);
  vertex(580, 10);
  vertex(580, 120);
  vertex(599, 122);
  endShape();

  beginShape();
  vertex(599, 136);
  vertex(582, 137);
  vertex(584, 179);
  vertex(599, 178);
  endShape();

  beginShape();
  vertex(599, 195);
  vertex(579, 197);
  vertex(585, 315);
  vertex(599, 317);
  endShape();

  //Floor
  stroke(0);
  strokeWeight(2);
  fill(210, 105, 30);

  beginShape();
  vertex(0, 370);
  vertex(50, 300);
  vertex(110, 250);
  vertex(390, 235);
  vertex(560, 345);
  vertex(598, 360);
  vertex(598, 499);
  vertex(0, 499);
  endShape(CLOSE);

  /*********************************
   Window
   The window was created by first drawing a green pentagon 
   on top of the back wall.  The frame was made by increasing
   the stroke weight of this pentagon from 2 (which was used for 
   the wall panels) to 7.  Then lines of varying stroke weights 
   were drawn on top of the green pentagon to look like the wooden 
   strips between panes of glass. 
   *********************************/

  fill(175, 250, 0, 180);
  stroke(30, 30, 30);
  strokeWeight(7);
  beginShape();
  vertex(170, 0);
  vertex(171, 142);
  vertex(215, 144);
  vertex(257, 136);
  vertex(255, 0);
  endShape();

  stroke(30, 30, 30);
  strokeWeight(9);
  line(210, 0, 215, 143);

  strokeWeight(3);
  line(172, 12, 213, 9);
  strokeWeight(4);
  line(214, 6, 256, 9);

  strokeWeight(3.5);
  line(173, 51, 213, 48);
  line(215, 46, 255, 50);

  strokeWeight(3);
  line(173, 93, 214, 92);
  strokeWeight(3.5);
  line(214, 91, 255, 92);

  /*********************************
   Bed
   The bed was created working from back to front and then outwards. 
   First the headboard was drawn, then the sheets and pillows on top of 
   that, then the footboard, and finally, the sideboard.  
   *********************************/

  //Headboard
  fill(238, 173, 14);	
  strokeWeight(2);

  beginShape();
  vertex(435, 173);
  vertex(432, 133);
  vertex(427, 127);
  vertex(413, 130);
  vertex(411, 139);
  vertex(320, 144);
  vertex(320, 136);
  vertex(313, 132);
  vertex(304, 134);
  vertex(304, 244);
  vertex(313, 255);
  vertex(312, 244);
  endShape();

  //Sheets (White)
  fill(255, 255, 200);
  stroke(0);
  strokeWeight(1);

  beginShape();
  vertex(330, 244);
  vertex(315, 198);
  vertex(314, 186);
  vertex(324, 161);
  vertex(357, 148);
  vertex(380, 147);
  vertex(403, 174);
  vertex(372, 177);
  vertex(330, 222);
  endShape(CLOSE);

  //Sheets (Red)
  fill(255, 20, 30);
  stroke(0);
  strokeWeight(1);

  beginShape();
  vertex(380, 300);
  vertex(340, 280);
  vertex(330, 244);
  vertex(330, 225);
  vertex(340, 200);
  vertex(350, 190);
  vertex(373, 176);
  vertex(386, 174);
  vertex(430, 270);
  endShape(CLOSE);

  //Left Pillow
  fill(255, 255, 230);
  stroke(0);
  strokeWeight(1);

  beginShape();
  vertex(320, 150);
  vertex(340, 147);
  vertex(356, 140);
  vertex(377, 168);
  vertex(330, 180);
  endShape(CLOSE);

  //Right Pillow
  beginShape();
  vertex(368, 139);
  vertex(413, 146);
  vertex(426, 169);
  vertex(385, 169);
  endShape(CLOSE);

  //FootBoard
  fill(238, 173, 14);	
  strokeWeight(2);
  stroke(0);

  beginShape();
  vertex(562, 140);
  vertex(553, 138);
  vertex(545, 142);
  vertex(542, 156);
  vertex(394, 171);
  vertex(393, 158);
  vertex(382, 156);
  vertex(375, 159);
  vertex(376, 390);
  vertex(386, 410);
  vertex(390, 417);
  vertex(406, 419);
  vertex(405, 381);
  vertex(548, 356);
  vertex(548, 372);
  vertex(563, 385);
  vertex(577, 382);
  endShape(CLOSE);

  curve(550, 260, 394, 171, 542, 156, 560, 350 );

  noStroke();
  beginShape();
  vertex(394, 170);
  vertex(394, 180);
  vertex(542, 180);
  vertex(542, 155);
  endShape();

  /*********************************
   Sideboard
   The sideboard was tricky to recreate due to the arc on the 
   top of the panel.  The board needed to be filled in completely, 
   but this could not be done by simply filling in the arc function 
   because doing so filled in the arc sector (which would be in the
   red sheet area) and not the area on the other side of the arc
   (the sideboard).  To fix this, the arc was NOT filled in, and 
   polygons were drawn very close to the arc to cover the red sheet 
   and make it appear as though the main sideboard panel and the panel
   directly beneath the arc were one shape.  
   *********************************/

  fill(238, 173, 14);
  //Opposite of Arc Cover Ups
  noStroke();
  beginShape();
  vertex(375, 360);
  vertex(375, 257);
  vertex(371, 260);
  vertex(367, 262);
  vertex(363, 260);
  vertex(362, 261);
  vertex(361, 261);
  vertex(360, 261);
  vertex(359, 261);
  vertex(358, 259);
  endShape(CLOSE);

  beginShape();
  vertex(345, 260);
  vertex(355, 260);
  vertex(376, 360);
  endShape();

  triangle(350, 260, 360, 261, 376, 360);

  noFill();
  strokeWeight(2.5);
  stroke(0);

  arc(360, 215, 72, 94, 1.111, 1.84);

  //Main Sideboard Panel
  fill(238, 173, 14);	
  strokeWeight(2);
  stroke(2);

  beginShape();
  vertex(350, 260);
  vertex(311, 186);
  vertex(310, 239);
  vertex(376, 360);
  endShape();

  /*********************************
   Paintings
   The paintings were created by first drawing quadrilateral frames
   and then drawing smaller quadrilateral "canvases" on top of them 
   in different colors.  Triangles with no fill placed directly above
   the frames were used to immitate hanging wires.  
   *********************************/

  fill(0, 0, 0, 0);
  strokeWeight(.7);
  triangle(120, 60, 130, 25, 145, 60);
  fill(48, 48, 48);
  rect(115, 60, 40, 50);
  fill(210, 225, 210);
  rect(117, 62, 36, 46);

  fill(0, 0, 0, 0);
  strokeWeight(.7);
  triangle(300, 50, 320, 20, 350, 50);
  fill(238, 173, 14);
  strokeWeight(1);	
  rect(290, 50, 70, 50);
  fill(113, 192, 229);
  rect(294, 54, 62, 42);

  fill(238, 173, 14);
  quad(408, 0, 422, 70, 470, 62, 458, 0);
  quad(483, 0, 498, 60, 547, 52, 535, 0);

  fill(250, 250, 170);
  quad(430, 90, 438, 136, 466, 133, 457, 85);
  quad(470, 95, 481, 135, 543, 130, 532, 84);

  fill(92, 172, 238);
  beginShape();
  vertex(431, 0);
  vertex(415, 5);
  vertex(427, 64);
  vertex(462, 58);
  vertex(449, 0);
  endShape();

  fill(79, 148, 205);
  quad(490, 0, 503, 54, 539, 48, 527, 0);

  /*********************************
   Table
   The back table leg of the table was drawn first, then the body 
   and front legs were drawn in one piece and placed in front of the
   first leg.  Next, the surface of the table was drawn, and from
   these coordinates, a second shape was drawn to give the tabletop
   the appearance of having thickenss.  The code for the topmost surface
   was then moved underneath the code for this second shape.
   
   *********************************/
  fill(238, 173, 14);
  strokeWeight(2);

  beginShape();
  vertex(178, 215);
  vertex(181, 269);
  vertex(188, 266);
  vertex(189, 212);
  endShape();

  beginShape();
  vertex(117, 184);
  vertex(119, 276);
  vertex(126, 277);
  vertex(130, 271);
  vertex(129, 210);
  vertex(149, 228);
  vertex(150, 292);
  vertex(154, 300);
  vertex(160, 299);
  vertex(161, 223);
  vertex(208, 218);
  vertex(210, 282);
  vertex(213, 286);
  vertex(220, 284);
  vertex(221, 193);
  endShape();

  strokeWeight(1);
  beginShape();
  vertex(162, 190);
  vertex(164, 215);
  vertex(205, 210);
  vertex(204, 186);
  endShape();

  strokeWeight(1);
  beginShape();
  vertex(103, 179);
  vertex(103, 182);
  vertex(148, 202);
  vertex(235, 194);
  vertex(235, 190);
  endShape();

  strokeWeight(2);
  quad(103, 179, 148, 199, 235, 191, 181, 173);

  fill(255, 255, 255);
  strokeWeight(.5);
  ellipse(186, 203, 4, 4);

  /*********************************
   Chair
   The chair was created in much the same was as the table.  
   Wooden panels farther away from the viewer were drawn first, 
   the middle/front panels and cushion were drawn next, and the front right 
   chair leg (which is the closest object to the viewer) was drawn last.  
   The chair cushion was drawn in the same way as the table top 
   in order to give it the appearance of thickness (see table section
   comments).
   *********************************/

  fill(238, 173, 14);
  strokeWeight(2);

  //Chairback
  beginShape();
  vertex(46, 286);
  vertex(42, 194);
  vertex(37, 192);
  vertex(30, 195);
  vertex(32, 233);
  vertex(38, 286);
  endShape();

  beginShape();
  vertex(31, 198);
  vertex(30, 195);
  vertex(25, 196);
  vertex(19, 201);
  vertex(14, 209);
  vertex(10, 217);
  vertex(9, 219);
  vertex(8, 227);
  vertex(10, 238);
  vertex(14, 237);
  vertex(19, 229);
  vertex(25, 222);
  vertex(31, 217);
  vertex(33, 212);
  endShape(CLOSE);

  beginShape();
  vertex(35, 222);
  vertex(25, 233);
  vertex(13, 251);
  vertex(15, 261);
  vertex(26, 245);
  vertex(36, 235);
  vertex(37, 236);
  endShape(CLOSE);

  quad(36, 244, 16, 267, 16, 281, 37, 258);

  beginShape();
  vertex(9, 222);
  vertex(3, 220);
  vertex(0, 225);
  vertex(1, 231);
  vertex(5, 246);
  vertex(10, 275);
  vertex(11, 327);
  vertex(9, 373);
  vertex(10, 394);
  vertex(15, 396);
  vertex(19, 392);
  vertex(20, 370);
  vertex(21, 316);
  vertex(20, 273);
  vertex(17, 252);
  vertex(13, 230);
  endShape(CLOSE);


  //Back Right Chair Leg
  beginShape();
  vertex(101, 286);
  vertex(102, 378);
  vertex(99, 380);
  vertex(96, 380);
  vertex(94, 379);
  vertex(86, 286);
  endShape();

  ellipse(94, 287, 15, 6);


  //Back Left Chair Leg
  beginShape();
  vertex(42, 318);
  vertex(43, 370);
  vertex(41, 372);
  vertex(38, 372);
  vertex(36, 370);
  vertex(34, 320);
  endShape();

  //Chair Cushion
  fill(154, 205, 50);

  beginShape();
  vertex(16, 317);
  vertex(18, 326);
  vertex(35, 338);
  vertex(56, 342);
  vertex(72, 341);
  vertex(88, 332);
  vertex(94, 316);
  vertex(94, 300);
  endShape();

  beginShape();
  curveVertex(46, 271);
  curveVertex(45, 277);
  curveVertex(42, 280);
  curveVertex(36, 281);
  curveVertex(26, 286);
  curveVertex(22, 293);
  curveVertex(20, 309);
  curveVertex(16, 317);
  curveVertex(39, 332);
  curveVertex(56, 336);
  curveVertex(74, 336);
  curveVertex(77, 333);
  curveVertex(84, 329);
  curveVertex(89, 322);
  curveVertex(95, 312);
  curveVertex(96, 294);
  curveVertex(89, 290);
  curveVertex(88, 283);
  curveVertex(76, 276);
  curveVertex(55, 273);
  endShape(CLOSE);

  //Front Right Chair Leg
  fill(238, 173, 14);

  beginShape();
  vertex(79, 331);
  vertex(82, 421);
  vertex(76, 422);
  vertex(72, 418);
  vertex(67, 331);
  endShape(CLOSE);

  ellipse(74, 329, 11, 7);
  
}


