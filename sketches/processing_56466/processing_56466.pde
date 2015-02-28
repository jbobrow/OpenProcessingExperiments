
size(720, 480);
smooth();
strokeWeight(2);
background(0);
ellipseMode(RADIUS);

//halo
fill(255, 0, 0, 160);
ellipse(360, 110, 50, 50);

//head
fill(0, 0, 255);
ellipse(360, 130, 40, 40);
fill(0);
stroke(0, 255, 0);
ellipse(340, 150, 10, 10);
ellipse(380, 150, 10, 10);

//legs
noStroke();
fill(200);
ellipse(360, 350, 100, 100);

//arms
fill(0, 0, 255);
rect(310, 200, 20, 80);
rect(390, 200, 20, 80);


//neck
stroke(0, 0, 255);
fill(0, 0, 255);
rect(355, 160, 10, 50);

//body
fill(0, 0, 255);
rect(335, 210, 50, 200);
noStroke();
fill(255, 0, 0, 160);
rect(320, 300, 80, 120);



