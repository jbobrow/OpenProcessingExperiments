
size(500,500);

background(250);

fill(111);
noStroke();
ellipse(340,210,50,70);
ellipse(160,210,50,70);

fill(150);
ellipse(250,250,200,230);


// eyes stroke

stroke(0);
strokeWeight(5);
ellipse(200,230,30,25);
ellipse(300,230,30,25);


// eyes fill

ellipseMode(RADIUS);
noStroke();
fill(111);
ellipse(200,230,7,7);
ellipse(300,230,7,7);


// nose

ellipseMode(CENTER);

noStroke();
fill(70);
ellipse(250,260,10,60);
ellipse(250,283,20,17);


// mouth big

fill(111);
ellipse(250,320,80,16);


// ears

noFill();
stroke(111);
strokeWeight(3);
ellipse(150,260,8,18);
ellipse(350,260,8,18);


// mouth small

stroke(70);
ellipse(250,320,80,2);


// hat

fill(111);
noStroke();
ellipse(210,160,130,100);
ellipse(290,160,130,100);
ellipse(250,120,100,110);
