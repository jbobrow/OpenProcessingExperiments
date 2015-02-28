
size(600,600);
background(#fdfbe7);
smooth();
 
//Hair
fill(#472e21);
noStroke();
ellipse(320, 215, 360, 320);

beginShape();
vertex(142, 200);
vertex(373, 255);
vertex(371, 346);
vertex(340, 545);
vertex(279, 530);
vertex(210, 555);
vertex(157, 545);
vertex(105, 450);
vertex(120, 315);
endShape(CLOSE);

beginShape();
vertex(342, 195);
vertex(500, 200);
vertex(515, 346);
vertex(520, 500);
vertex(479, 550);
vertex(410, 555);
vertex(357, 545);
vertex(300, 460);
vertex(320, 291);
endShape(CLOSE);

//Face
noStroke();
fill(#fbdcbb);
ellipse(300, 280, 230, 370);
rect(185, 180, 230, 80);

//Neck  
rect(300, 440, 54, 140);

//Ear
ellipse(180, 320, 60, 60); //left
ellipse(425, 335, 75, 65); //right
fill(#e2c4a4);
ellipse(180, 320, 6, 14); 
ellipse(425, 335, 10, 25); 

//Bang
fill (#472e21); 
beginShape();
vertex(345,95);
vertex(320,220);
vertex(340,265);
vertex(270,215);
vertex(240,180);
vertex(185,255);
vertex(180,183);
vertex(215,125);
vertex(260,95);
endShape(CLOSE);
 
beginShape();
vertex(315,90);
vertex(302,190);
vertex(365,250);
vertex(360,200);
vertex(415,280);
vertex(420,270);
vertex(430,140);
vertex(375,120);
endShape(CLOSE);

//Eyebrows
noStroke();
fill(#2d1b11);
ellipse(235, 250, 51, 51);
ellipse(365, 267, 51, 51);
fill(#fbdcbb);
ellipse(236, 254, 55, 50);
ellipse(364, 273, 55, 50);

//Left_eye
fill (#2d1b11);
ellipseMode (CENTER);
ellipse (252,290,20,20);
fill (000000);
ellipse (252,290,10,10);
noFill ();
stroke (000000);
strokeWeight(2);
arc (236,285,50,15,PI,TWO_PI);

//Right_eye
fill (#472e21);
ellipseMode (CENTER);
ellipse (358,299,20,20);
fill (000000);
ellipse (358,299,10,10);
noFill ();
stroke (000000);
strokeWeight(2);
arc (343,294,50,15,PI,TWO_PI);

//Nose
noFill();
stroke(#67452a);
strokeWeight(2);
arc(270, 345, 30, 25, radians(100), radians(260));

//Mouth
fill(#f8b7ba);
stroke(#ff7070);
strokeWeight(6);
arc(305, 385, 55, 40, radians(-25), radians(160));

//Blush
fill(#ffc1b5);
noStroke();
ellipse(220, 333, 33, 20);
ellipse(360, 342, 33, 20);

fill(#fe9797);
noStroke();
triangle(219, 328, 220, 339, 215, 338);
triangle(215, 325, 213, 335, 208, 336);

triangle(355, 335, 361, 348, 355, 348);
triangle(364, 334, 370, 345, 365, 346);

//Collar
fill(#7accc8);
stroke(#1cbbb4);
strokeWeight(1);
quad(210,550,250,535,312,580,190,580);
quad(412,540,435,550,455,580,310,580);
triangle(310, 580, 245, 540, 295, 500);
triangle(310, 580, 415, 540, 355, 500);


