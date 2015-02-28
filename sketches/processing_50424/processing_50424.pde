
/*
*Assignment # 1
*Nancy Toure
*ntoure@brynmawr.edu
*CS 110 Section 2
*Submitted: 1/25/2012
This program contains the code instructions for creating 
a Bryn Mawr latern. Most of the codes I used were ellipses,
lines, and triangles. The latern is representing the green latern
that is for freshmen. The owl in the middle of the latern is the 
mascot of Bryn Mawr. This program was very diffucult to make
because I had to get use to using graph paper and making a scale
that would be easy for me to create the latern with.
*/


void setup () {
 size(500, 700);
 background(255);
}

void draw (){
 
 
 //glass pane behind owl
fill(0, 255, 0);
 beginShape();
 vertex(75, 200);
 vertex(150, 550);
 vertex(350, 550);
 vertex(425, 200);
 endShape();
 
 //top of latern
 stroke(0);
 strokeWeight(10);
 noFill();
 ellipse(250, 50, 50, 40);
 
 
 //part of latern
 stroke(0);
 strokeWeight(25);
 strokeJoin(BEVEL);
 fill(0);
 triangle(250, 75, 25, 200, 475, 200);
 

//exterior of latern
fill(255);
strokeWeight(30);
smooth();
line(75, 200, 150, 600);
line(350, 600, 425, 200);
line(150, 550, 350, 550);

//owls body
stroke(0);
strokeWeight(20);
strokeJoin(BEVEL);
noFill();
ellipse(250, 375, 200, 300);

//ears of owl
stroke(0);
strokeWeight(15);
strokeJoin(BEVEL);
noFill();
triangle(100, 200, 150, 300, 200, 225);


//ears of owl
stroke(0);
strokeWeight(15);
strokeJoin(BEVEL);
noFill();
triangle(400, 200, 300, 225, 350 , 300);  

//eyes of owl
stroke(0);
strokeWeight(15);
ellipse(200, 300, 75, 75);
ellipse(300, 300, 75, 75);

//eyes of owl
stroke(0);
strokeWeight(15);
line(200, 275, 195, 325);

//eyes of owl
stroke(0);
strokeWeight(15);
line(300, 275, 310, 325);


//nose of owl
stroke(0);
strokeWeight(15);
strokeJoin(MITER);
triangle(275, 330, 225, 330, 250, 410);

//wings of owl
stroke(0);
strokeWeight(15);
line(150, 300, 100, 375);
line(100, 350, 150, 440);

//wings of owl
stroke(0);
strokeWeight(15);
line(350, 300, 400, 375);
line(400, 350, 350, 430);

//legs of owl
stroke(0);
strokeWeight(15);
line(200, 500, 150, 550);
line(225 ,525, 200, 550);


//legs of owl
stroke(0);
strokeWeight(15);
line(275, 525, 300, 550);
line(300, 500, 350, 550);

if (mousePressed){
   //glass pane behind owl
fill(0, 255, 0);
 beginShape();
 vertex(75, 200);
 vertex(150, 550);
 vertex(350, 550);
 vertex(425, 200);
 endShape();
  
  
}
  
}














