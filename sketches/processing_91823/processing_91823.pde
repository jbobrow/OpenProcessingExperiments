
//processing is a programming language
// has a vocabulary
//these are functions (also sometimes called methods)
// word(parameters); anotherWord()
//point(x,y);
size(300,300);
background(255);
smooth();
point(25,25);
//line(x1,y1,x2,y2);
line(50,50,99,99);
//triangle(x1,y1,x2,y2,x3,y3);
triangle(50, 0, 100, 50, 0, 50);
noFill();//turns fill off
stroke(0,0,255);
//quad(x1,y1,x2,y2,x3,y3,x4,y4);
quad(15,75,55,70,55,90,20,80);
//ellipse(x,y,w,h);
//noSmooth();turns smoothing off
/*fill(255,0,0,100);
ellipseMode(CORNER);
ellipse(50,50,25,25);
ellipseMode(CENTER);
ellipse(50,50,25,25);*/
//rect(x,y,w,h);
rectMode(CORNER);
rect(0,0,50,25);
rectMode(CENTER);
strokeWeight(10);
strokeJoin(MITER);//ROUND BEVEL MITER
rect(50,50,70,55);
fill(0, 255, 0, 125);
//fill() or stroke()
//you can see the colour values like below
//g   0 to 255   black to white
//g, a
//r, g , b
// r, g, b, a
noStroke();//turns stroke off
//background(255);
arc(50,50,50,50,0,(PI/180)*195);
stroke(125);
beginShape();
vertex(150,10);
vertex(180, 50); 
vertex(150, 150);
vertex(75, 60);
endShape(CLOSE);





//0   QUARTER_PI   HALF_PI    PI   HALF_PI+QUARTER_PI    TWO_PI


