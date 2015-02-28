
// create workspace
size(600, 600);
smooth();
background(255);
//load background image
//PImage b;
//b = loadImage("Self Portrait.jpg");
//background(b);

//////////////////////////////
fill(0);
noStroke();
triangle(400, 350, 400, 310, 410, 350);
triangle(380, 350, 400, 340, 405, 390);

triangle(200, 350, 210, 310, 240, 320);
triangle(212, 398, 210, 310, 240, 310);
triangle(205, 370, 210, 330, 240, 340);
/////////////////////////////////
//left ear

 fill(#FAE5B1);
 bezier(210, 240, 180, 280, 200, 320, 210, 330);
 
//right ear
 fill(#FAE5B1);
 bezier(410, 240, 420, 280, 420, 320, 400, 330);
 ///////////////////////////

fill(0);
//left head
 //noFill();
// fill(0);
 bezier(205, 315,  115, 100,  270, 80,  295, 68);

//right head
 //noFill();
//fill(0);
 bezier( 295, 68, 480, 80, 415, 280, 405, 315);

/////////////////////////
 //inner left hair
 //noFill();
 fill(#FFF6DE);
 bezier( 240, 140, 220, 190, 210, 200, 210, 315);

//inner right hair
//noFill();
 fill(#FFF6DE);
 bezier( 365, 150, 400, 190, 400, 250, 405, 315);
 
 // upper head
noStroke();
fill(#FFF6DE);
//noFill();
bezier( 210, 315, 190, 40, 410, 60, 405, 315);
stroke(0);


 
/////////////////////////////////
 
 //left face
 //noFill();
 fill(#FFF6DE);
 bezier(210, 315,  200, 360,  240, 440,  295, 440);

//right face
 //noFill();
 fill(#FFF6DE);
 bezier(405, 315, 400, 380, 380, 440, 295, 440);
 
//fill face
noStroke();
fill(#FFF6DE);
ellipse(306, 323, 195, 190);
ellipse(305, 364, 150, 150);
stroke(0);
///////////////////////////////////////////
//front hair
fill(0);

triangle(255, 170, 265, 120, 210, 150);
triangle(275, 200, 240, 100, 295, 120);
triangle(290, 185, 285, 100, 330, 120);
triangle(310, 175, 300, 100, 360, 140);
triangle(350, 170, 320, 100, 390, 140);
triangle(295, 68, 260, 130, 350, 130);

//outside hair
triangle(265, 72, 200, 140, 300, 150);
triangle(305, 45, 210, 140, 300, 150);
triangle(325, 55, 210, 140, 300, 150);
triangle(370, 70, 290, 70, 320, 150);
triangle(390, 90, 290, 70, 320, 150);
triangle(400, 105, 290, 70, 320, 150);


noFill();



///////////////////////////
/*/right eye upper
 noFill();
 bezier(380, 275, 360, 270, 365, 260, 335, 278);

//right eye bottom
 noFill();
 bezier(380, 275, 370, 290, 330, 280, 335, 278);

//right eye
 fill(100);
 ellipse(358, 276, 18, 18);
*/
///////////////////////////

///////////////////////////
//left eye bottom
 //noFill();
 fill(255);
bezier(280, 277, 260, 284, 270, 285, 235, 278);

//left eye upper
 //noFill();
 fill(255);
bezier(280, 277, 268, 260, 240, 271, 235, 278);
//left eye
 fill(0);
 ellipse(261, 275.5, 16, 15);
 
 
 ///////////////////////////
//right eye bottom
 //noFill();

 fill(255);
bezier(330, 277, 350, 284, 355, 285, 375, 278);

//right eye upper
 //noFill();
 fill(255);
//bezier(280, 277, 270, 290, 250, 285, 235, 278);
bezier(330, 277, 340, 258, 365, 271, 375, 278);
//right eye
 fill(0);
 ellipse(350, 275, 16, 15);

//////////////////////////////

 //right nose
 noFill();
 //fill(#FFF6DE);
 bezier(315, 300, 320, 330, 333, 330, 323, 345);
 fill(0);
 ellipse(295, 341, 10, 6);
 
 //left nose
 noFill();
 //fill(#FFF6DE);
 bezier(299, 300, 290, 330, 277, 330, 287, 345);
 fill(0);
 ellipse(316, 341, 10, 6);
 
 //////////////////////////////
 //bottum month
 //noFill();
 noStroke();
 fill(#FCC1A6);
 bezier(270, 384, 315, 410, 315, 400, 340, 384);
 
 //top month
 fill(#FCC1A6);
 bezier(290, 384, 320, 370, 320, 370, 340, 384);
 
  //top month
 fill(#FCC1A6);
 bezier(270, 384, 300, 370, 300, 370, 310, 384);
 
 //middle month
 stroke(0);
 fill(#F59A4F);
 bezier(270, 384, 280, 388, 330, 388, 338, 384);
 

///////////////////
//left eyebrow
noFill();
strokeWeight(2);
strokeCap(ROUND);
bezier(328, 250, 350, 230, 370, 251, 375, 250);
bezier(327, 248, 350, 230, 370, 251, 375, 250);

bezier(282, 250, 260, 230, 240, 251, 235, 250);
bezier(283, 248, 260, 230, 240, 251, 235, 250);


 /* the background statement sets the background of your sketch to a 
 specified color. It is also used to "clear" or reset your drawing window.  */
 
 /* when passed one number (between 0 - 255) it sets the background 
 to the specified grey.  */
 
 /* background(value1, value2, value3) sets the background to a color.
 note the three commas. background(hex) also works if you want to use 
 a web color.  */ 
 
 /* Go to "Tools > Color Selector" in the processing application to 
 use a color picker that will provide you with an RGB breakdown for colors.  */
 
 
 //background(196, 49, 49);
 
 // note that a new background command overwrites any previous background calls 

