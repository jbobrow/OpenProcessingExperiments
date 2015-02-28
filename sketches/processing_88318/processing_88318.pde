
//prisca ohito, hw2 48-257 2.4.13, 
//copyright by prisca a ohito 2013;

//Set up
size(400, 400);

float x, y;
x = 200;
y = 200;

strokeWeight(.015*x);
stroke(103, 75, 61);

// Face
beginShape();
fill(227, 178, 133);
ellipse(x, x, x*2, y*2);
endShape(CLOSE);

//Cheeks
fill(256, 150, 150);
ellipse(x/2, y, x/(4), y/(4));
ellipse(x*1.5, y, x/(4), y/(4));

// Lips
beginShape();
curveVertex(x/2, y*1.5);
curveVertex(x/2, y*1.5);
curveVertex(x - 65,  y*1.625);
curveVertex(x + 65,  y*1.625);
curveVertex(x*1.5, y * 1.5);
curveVertex(x*1.5, y * 1.5);
endShape(CLOSE);

// Moustache
fill(153);
beginShape(QUADS);
vertex(x/2, x*1.5);
vertex(x - 60, y*5/4);
vertex(x + 60, y*5/4);
vertex(x*1.5, y*1.5);
endShape(CLOSE);

// glasses
fill(255);
quad(x/2, y-10, x/2 + 75, y-10, x/2 + 75, y-50, x/2, y-50);
quad(x+100, y-10, x + 25, y-10, x + 25, y-50, x+100, y-50);
line(x-75, y-45, x+75, y-45);

// nose
noFill();
beginShape();
vertex(x-50 , y+30);
vertex(x+23 , y+30 );
vertex(x, y - 30 );
endShape();


// "A" for Akello
fill(200, 200, 200);
strokeWeight(3);   //  Thicker
triangle(x/2, y*1.5, x, y*1.15, x*1.5, y*1.5);
