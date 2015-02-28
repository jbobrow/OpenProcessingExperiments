
/*
 Konkuk University
 SOS iDesign

Name: Your Name <<------ Write your full name here!
 ID: Your ID <<--------- Write your ID here!

*/

PImage img;

void setup(){
size (600, 600);
 // noLoop();
smooth();
//img = loadImage ("giyung.png"); 
 }

void draw(){
println(mouseX + " : " + mouseY);
//image (img, 0, 0);

strokeWeight(3);
fill (255, 193, 158);
beginShape();
vertex (40, 222);
vertex (87, 227);
vertex (110, 188);
vertex (159, 193);
vertex (191, 151);
vertex (231, 162);
vertex (259, 127);
vertex (301, 148);
vertex (332, 116);
vertex (373, 139);
vertex (403, 110);
vertex (438, 137);
vertex (471, 108);
vertex (508, 137);
vertex (541, 114);
vertex (516, 310);
vertex (516, 339);
vertex (519, 350);
vertex (528, 374);
vertex (531, 396);
vertex (525, 427);
vertex (512, 452);
vertex (491, 470);
vertex (472, 485);
vertex (413, 513);
vertex (414, 512);
vertex (377, 520);
vertex (316, 525);
vertex (260, 520);
vertex (214, 504);
vertex (189, 488);
vertex (168, 468);
vertex (153, 477); //ear
vertex (145, 478);
vertex (126, 471);
vertex (114, 461);
vertex (104, 442);
vertex (103, 422);
vertex (116, 405);
vertex (127, 403); //ear
vertex (97, 349);
vertex (74, 305);
vertex (40, 222);
endShape(CLOSE);
strokeWeight(4);
noFill ();
beginShape();

endShape(CLOSE);


bezier (237, 307, 228, 273 ,298, 239, 304, 263);
bezier (408, 256, 402, 236, 459, 226, 464, 241);

fill(255);
strokeWeight(3);
beginShape();
vertex (304,346);
vertex (328,346);
vertex (346,354);
vertex (353,372);
vertex (348, 384);
vertex (326, 391);
vertex (307, 397);
vertex (286, 404);
vertex (268,395);
vertex (267, 379);
vertex (279,359);
vertex (290,354);
vertex (304,346);
endShape(CLOSE);

beginShape();
vertex (455,316);
vertex (473,319);
vertex (486,332);
vertex (485,349);
vertex (433,367);
vertex (416,360);
vertex (417, 344);
vertex (426,329);
vertex (436,323);
vertex (455,316);
endShape(CLOSE);
strokeWeight(3);
beginShape();
fill(0);
vertex (417,397);   //nose
vertex (428,398);
vertex (425,409);
endShape(CLOSE);

float mx1 = constrain (mouseX, 288, 342); 
float my1 = constrain (mouseY, 363, 377); 
float mx2 = constrain (mouseX, 433, 477); 
float my2 = constrain (mouseY, 333, 342); 

ellipse (mx1,my1, 6, 6);
ellipse (mx2,my2, 6, 6);



ellipse (252, 436, 3, 3);
ellipse (307,424, 3, 3);
ellipse (299,459, 3, 3);
ellipse (486,383, 3, 3);
ellipse (514,369, 3, 3);
ellipse (508,405, 3, 3);

fill(103,0,0);
ellipse (417, 467, 50, 30);
fill(243, 97, 166);
ellipse (411, 473, 30, 15);

if(mousePressed){
  
  fill(random(255),random(255),random(255));
  ellipse (411, 473, 30, 15);

}

}
void keyPressed(){


 }

