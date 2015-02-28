

size (640, 480);

smooth();

strokeJoin(BEVEL);

strokeCap(ROUND);

strokeWeight(2);

background (255);




// Back Handle

fill(219);

arc (320, 90, 80, 180, 3.14, TWO_PI);

fill(255);

arc (320, 90, 70, 170, 3.14, TWO_PI);

// Perspective around bag

line (475, 90, 160, 90);

fill(230, 0, 0);

triangle (160, 90, 160, 100, 185, 100);

beginShape();

vertex(450, 450);
vertex(465, 410);
vertex(480, 390);
vertex(475, 90);
vertex(435, 95);
vertex(450, 100);

endShape(CLOSE);


// Front Handle

fill(219);

ellipse (300, 100, 80, 180);

fill(255);

ellipse (300, 100, 70, 170);


// Area behind front handle

fill(219);

arc (320, 90, 80, 180, 3.14, 4.1);

fill(255);

arc (320, 90, 70, 170, 3.14, 4.2);

line (265, 90, 335, 90);



fill(255, 0, 0);

rect (150, 100, 300, 350);

strokeWeight(1);

fill(0, 0, 255);

ellipse (300, 300, 190, 190);

fill(255);

ellipse (300, 300, 180, 180);

fill(255, 0, 0);

ellipse (300, 300, 170, 170);

fill(255);

ellipse (300, 300, 155, 155);

fill(0, 0, 255);

ellipse (300, 300, 150, 150);


//make Bavarian crest

fill (255);

quad(232, 293, 240, 255, 255, 290, 247, 320);
quad(255, 290, 263, 252, 278, 287, 270, 317);
quad(278, 287, 286, 249, 301, 284, 293, 314);
quad(301, 284, 309, 246, 324, 281, 316, 311);
quad(324, 281, 332, 243, 347, 278, 339, 308);

beginShape();
vertex(347, 278); 
vertex(352, 243); 
vertex(364, 260); 
vertex(370, 275);
vertex(362, 305);
endShape();


beginShape();
vertex(241, 347);
vertex(247, 320);
vertex(262, 355); 
vertex(254, 360);
endShape();

beginShape();
vertex(262, 355); 
vertex(270, 317); 
vertex( 285, 352);
vertex(274, 372);
vertex(269, 371);
endShape();


quad(285, 352, 293, 314, 308, 349, 300, 375);
quad(308, 349, 316, 311, 331, 346, 322, 373);

beginShape();
vertex(331, 346);
vertex(339, 308);
vertex(354, 343); 
vertex(352, 358);
vertex(342, 365);
endShape();

beginShape();
vertex(354, 343);
vertex(362, 305);
vertex(370, 332); 
vertex(360, 350);
endShape();

beginShape();
vertex(354, 343);
vertex(339, 308);
vertex(354, 343); 
vertex(352, 358);
vertex(342, 365);
endShape();

beginShape();
vertex(331, 346);
vertex(339, 308);
vertex(354, 343); 
vertex(352, 358);
vertex(342, 365);
endShape();

