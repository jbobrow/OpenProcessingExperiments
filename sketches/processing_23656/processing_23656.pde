
size(600,400); // canvas size 600x400px
background(252,247,235);
smooth();

//(Playing with Kristina's Tri sketch code here)
//draw a triangle in all the squares
fill(237,218,201, 100);
for (int x1 = 0; x1 <= width; x1 += 30) {
 for (int y1 = 0; y1 <= height ; y1 += 20) {
   noStroke();
   triangle (x1 , y1,  (x1 + 30), ( y1-20),  (x1 +30) , y1);  
 }
}
 


//MUSIC LINES
noFill();
strokeWeight(6); //lineweight 6 pixels
stroke(77, 46, 30);

bezier(580, 140, 260, 240, 200, 30, 15, 140);
//creates a line from point 1, 580,140 to point 2, 15,140
//point 1 curves at 260,240, Point 2 curves at 200, 30

bezier(580, 170, 290, 270, 210, 60, 15, 170);
//creates a line from point 1, 580,170 to point 2, 15,170
//point 1 curves at 29,270, Point 2 curves at 210, 60

bezier(580, 200, 320, 300, 220, 90, 15, 200);
//creates a line from point 1, 580, 200 to point 2, 15, 200
//point 1 curves at 320,300, Point 2 curves at 220, 90

bezier(580, 230, 350, 330, 230, 120, 15, 230);
//creates a line from point 1, 580,230 to point 2, 15,230
//point 1 curves at 350,300, Point 2 curves at 230, 120

bezier(580, 260, 380, 360, 240, 150, 15, 260);
//creates a line from point 1, 580, 260 to point 2, 15,260
//point 1 curves at 380,360, Point 2 curves at 240, 150

//NOTE 1
strokeWeight(7);
stroke(255,58,18);       //note stem color
line(130, 210, 90, 100); //note stem 1
noStroke();
fill(255, 58,18);   // fill note body 1
ellipse(100, 220, 70,60); //note body 1
fill(77, 46, 30);
ellipse(80, 220, 10,10); //left eye
ellipse(118, 215, 10,10); //right eye

fill(165, 22,67);         //mouth fill
ellipse(100, 235, 10,10); //mouth

fill(252, 181, 200);
ellipse(80, 235, 10,10); //right blush
ellipse(125, 228, 10,10); //left blush

//NOTE 2
strokeWeight(7);
stroke(43, 217, 222);     //note stem 2 color
line(220, 260, 170, 115); //note stem 2

noStroke();
fill(43, 217, 222); // fill note body 2
ellipse(190, 270, 70,60); //note body 2

fill(77, 46, 30);
ellipse(170, 270, 10,10); //left eye
ellipse(200, 265, 10,10); //right eye

fill(165, 22,67);        //mouth fill
ellipse(190, 285, 10,3); //mouth

fill(252, 181, 200);
ellipse(210, 275, 10,10); //right blush
ellipse(165, 285, 10,10); //left blush



//NOTE 3 & 4

strokeWeight(7);
stroke(255, 205, 64);       //note stem color
line(315, 217, 270, 80); //note stem 3
line(410, 290, 360, 145); //note stem 3

noStroke();
fill(255, 205, 64);   // fill note body 3,4
ellipse(285, 230, 70,60); //note body 3
ellipse(380, 290, 70,60); //note body 4
quad(380, 195, 360, 145, 269, 79, 283, 126);

//EYES
fill(77, 46, 30);
ellipse(285, 240, 10,10); //note 3 left eye
ellipse(310, 240, 10,10); //note 3 right eye

ellipse(350, 280, 10,10); //note 4 left eye
ellipse(380, 280, 10,10); //note 4 right eye

//MOUTHS
fill(165, 22,67);         //mouth fill
ellipse(295, 252, 10,5);  //note 3 mouth
ellipse(390, 300, 10,10); //note 4 mouth

fill(252, 181, 200);
ellipse(270, 245, 10,10); //note 3 left blush
ellipse(400, 285, 10,10); //note 4 left blush
ellipse(345, 295, 10,10); //note 4 right blush


//NOTE 5
strokeWeight(7);
stroke(237, 72, 135);     //note stem 5 color
line(520, 260, 470, 140); //note stem 5

noStroke();
fill(237, 72, 135); // fill note body 5
ellipse(490, 270, 70,60); //note body 5

fill(77, 46, 30);
ellipse(470, 270, 10,10); //left eye
ellipse(500, 270, 10,10); //right eye

fill(165, 22,67);        //mouth fill
ellipse(485, 290, 10,15); //mouth

fill(252, 181, 200);
ellipse(460, 285, 10,10); //note 5 left blush
ellipse(505, 285, 10,10); //note 5 right blush
