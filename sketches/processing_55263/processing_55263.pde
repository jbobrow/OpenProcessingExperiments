


smooth();


//feet

fill(50);
quad (10, 90, 20, 90, 20, 100, 0, 100);
quad (100, 100, 80, 100, 80, 90, 90, 90);

//shin
strokeWeight(2.5);
line (20, 90, 25, 75);
line (80, 90, 75, 75);

//thigh
strokeWeight(2.5);
line(25,75, 50,55);
line(75,75, 50,55);

//knee
fill(250);
strokeWeight(1);
ellipse(26, 75, 10, 10);
ellipse(74, 75, 10,10);

//abs
strokeWeight(5);
line(50, 55, 50, 45);

//pelvis
strokeWeight(1);
fill(50);
beginShape();
vertex(40, 55);
vertex(60, 55);
vertex(60, 60);
vertex(55, 65);
vertex(45, 65);
vertex(40, 60);
endShape(CLOSE);

//arms
strokeWeight(7);
noFill();
arc(35, 48, 50, 50, PI, TWO_PI-PI/2);
arc(65, 48, 50, 50, TWO_PI-PI/2, TWO_PI);

//chest
strokeWeight(1);
fill(230);
beginShape();
vertex(45, 45);
vertex(55, 45);
vertex(70, 30);
vertex(70, 20);
vertex(30, 20);
vertex(30, 30);
endShape(CLOSE);


//black band
fill(0);
rect(42.5, 26, 15, 10);

//star
noStroke();
fill(255, 243, 0);
triangle(50, 27.5, 52.5, 32.5, 47.5, 32.5);
triangle(50, 35, 47.5, 30, 52.5, 30);  

//head
fill(50);
rect(40,10,20,10);
//colour red
fill(255,0,0);
quad(40,10,45,0,55,0,60,10);  

//eye
//colour yellow
fill(255, 243, 0);
arc(45, 11, 10, 10, 0, PI);
arc(55, 11, 10, 10, 0, PI);

//mouth 
fill(150);
rect(45,18,10,2);







