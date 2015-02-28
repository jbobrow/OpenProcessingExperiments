
//import processing.pdf.*;

void setup() {
size(300,600);
noLoop();
//beginRecord(PDF, "filename.pdf"); 
}


void draw() {
background(19);
smooth();
fill(120);
ellipse(150,100,60,60);
stroke(120);
strokeWeight(4);
noFill();
ellipse(150, 130, 120,120);

noStroke();
fill(19);
ellipse(150,108,40,40);

noFill();
stroke(120);
ellipse(150,192,250,250);

strokeWeight(1);


line(170,190, 190, 312);
line(160,190,170,316);

line(150, 190, 150, 318);

line(140, 190, 130, 316);
line(130, 190, 110, 312);

line(120,180, 90, 303);
line(180, 180, 210, 303);


ellipse(50,50, 30,30);
ellipse(50,50, 40, 40);
ellipse(250, 50, 30, 30);
ellipse(250, 50, 40,40);
ellipse(150, 25, 15, 15);
ellipse(150, 25, 25, 25);

noStroke();
fill(120, 40, 8);
ellipse(50,50,6, 6);
ellipse(250,50, 6, 6);
ellipse(150,25, 2, 2);

stroke(120);
line(50,70, 50, 500);
line(250, 70, 250, 500);

noFill();
ellipse(50,520, 40, 40);
ellipse(50, 520, 30, 30);
ellipse(250, 520, 40, 40);
ellipse(250,520, 30, 30);


fill(120, 40, 8);
noStroke();
ellipse(50, 520, 6, 6);
ellipse(250, 520, 6, 6);

stroke(120,40,8, 200);
line(52, 272, 150, 500);
line(248, 272, 150, 500);

fill(100,30,35);
noStroke();
triangle(80, 440, 150, 320, 220, 440);
fill(19);
ellipse(150, 370, 30, 30);
ellipse(150, 395, 15, 15);
ellipse(150, 412, 5, 5);

stroke(120);
ellipse(150, 560, 25,25);
ellipse(150,560, 15,15);

fill(120, 40, 8);
noStroke();
ellipse(150,560, 2, 2);

//endRecord();
}




