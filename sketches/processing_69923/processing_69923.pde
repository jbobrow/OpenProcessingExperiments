
//Eric Beasley
//GAM240 Assignment 1a
//September 10, 2012

background(255);
size(500,500);
strokeWeight(4);
line(300,0,300,299); //largest quadrant

//ine(0,299,300,300);

//line(300,200,500,200); //upper horizontal line



strokeWeight(4);
point(260,10);
point(260,20);
point(260,30);
point(260,40);
point(260,50);
point(260,60);
point(260,70);
point(260,80);
point(260,90);

point(170,310);
point(170,320);
point(170,330);
point(170,340);
point(170,350);
point(170,360);
point(170,370);
point(170,380);
point(170,390);

fill(#03A2B8);
//rect(130,100,170,200);
quad(130,100,300,100,300,299,130,299);

fill(255);
triangle(131, 101, 200, 100, 131, 170);
triangle(260, 299, 300, 260, 300, 299);

fill(#2F575C);
rect(300,50,200,150);
fill(#003137);
rect(300,280,200,150);

fill(#82F0FF);
rect(300,150,50,160);
rect(350,150,50,160);


fill(#E6FCFF);
rect(0,0,150,100);

fill(#82F0FF);
rect(100,400,200,110);

fill(#2F575C);
rect(0,160,45,200);

noFill();
rect(0,0,498,498);
rect(45,100,55,400);


