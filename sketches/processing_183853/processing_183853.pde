
size(450,400);
background(0,150,50);

//behind e
noStroke();
fill(100,0,225);
beginShape();
vertex(100,100);
vertex(25,200);
vertex(75,300);
vertex(160,250);
vertex(175,140);
endShape();

//behind d
noStroke();
fill(100,0,225);
beginShape();
vertex(400,130);
vertex(425,190);
vertex(350,270);
vertex(275,250);
vertex(250,175);
endShape();


//behind m
noStroke();
fill(50,0,225);
beginShape();
vertex(160,145);
vertex(200,125);
vertex(300,150);
vertex(250,290);
vertex(170,200);
endShape();

stroke(255);
strokeWeight(5);
noFill();

//shadow e
stroke(0);
arc(98,202,100,100,QUARTER_PI,TWO_PI);
line(48,202,148,202);

//e
stroke(225);
arc(100,200,100,100,QUARTER_PI,TWO_PI);
line(50,200,150,200);

//shadow m
stroke(0);
arc(198,177,50,50,PI,TWO_PI);
arc(248,177,50,50,PI,TWO_PI);
line(173,177,173,248);
line(223,173,223,248);
line(273,173,273,248);

//m
stroke(225);
arc(200,175,50,50,PI,TWO_PI);
arc(250,175,50,50,PI,TWO_PI);
line(175,175,175,250);
line(225,175,225,250);
line(275,175,275,250);

//shadow d
stroke(0);
ellipse(333,213,75,75);
line(372,152,372,252);

//d
stroke(255);
ellipse(335,215,75,75);
line(374,150,374,250);


