
//set canvas
size(600,600);
background(255);

//hair
fill(120,80,10);
stroke(110,70,0);
ellipse(300,300,450,600);


//my face
fill(242,232,216);
stroke(230,210,190);
quad(270,500,330,500,330,600,270,600);
arc(300,300,250,500,0,PI+QUARTER_PI,CHORD);

//ears
noStroke();
ellipse(425,310,30,50);
ellipse(175,310,30,50);


//eyes
fill(120,80,10);
ellipse(230,300,20,20);
ellipse(370,300,20,20);

//glasses
noFill();
stroke(0);
strokeWeight(3);
quad(190,270,270,270,270,330,190,330);
quad(330,270,410,270,410,330,330,330);
line(270,300,330,300);

//nose
stroke(230,210,190);
arc(300,350,40,40,PI,TWO_PI);

//mouth
fill(255,20,20);
noStroke();
arc(300,450,100,50,0,PI,PIE);



