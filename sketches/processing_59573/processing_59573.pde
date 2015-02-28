
size(200,200);

smooth();

background(255); 



// Körper:

stroke(0);
fill(255,0,0);
ellipseMode(CENTER);
ellipse(100,100,150,150);





// Auge:

stroke(0);
fill(255);
ellipseMode(CENTER);
ellipse(75,80,50,50);

stroke(0);
fill(255);
ellipseMode(CENTER);
ellipse(125,80,50,50);

noStroke();
fill(0);
ellipseMode(CENTER);
ellipse(75,80,10,10);

noStroke();
fill(0);
ellipseMode(CENTER);
ellipse(125,80,10,10);

stroke(0);
line(52,70,98,70);

stroke(0);
line(102,70,148,70);


// Mund:

noStroke();
fill(65);
ellipseMode(CORNER);
ellipse(59,117,81,40);

stroke(0);
fill(230);
ellipseMode(CORNER);
ellipse(85,110,30,60);

stroke(0);
line(100,110,100,160);

noStroke();
fill(255,0,0);
ellipseMode(CORNER);
ellipse(59,107,81,40);



// Nase:

noStroke();
fill(0);
ellipseMode(CORNER);
ellipse(73,103,54,30);

noStroke();
fill(180);
ellipseMode(CORNER);
ellipse(85,104,30,13);



