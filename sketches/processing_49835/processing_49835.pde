
size(900,900);
smooth();
PFont font;
font = loadFont("DialogInput-48.vlw"); 
textFont(font);
background(#8DF253);
strokeWeight(0);


fill(#53F2E9);
stroke(#53F2E9);
strokeWeight(1);
rect(0,0,900,750);

//this represents the head
stroke(0);
strokeWeight(4);
fill(10,20,200,50);
arc(425,500,350,700,-PI,0);
line(250,500,600,500);

//this ellipse represents eyes
stroke(0);
fill(225);
strokeWeight(2);
ellipse(400,300,50,80);
ellipse(450,300,50,80);

fill(0);
ellipse(400,330,10,20);
ellipse(450,330,10,20);


noFill();
strokeWeight(4);
arc(425,450,150,130,-PI,0);

fill(#FA17C5);
triangle(425,500,300,500,300,550);
triangle(425,500,550,500,550,550);

beginShape();

//vertex(425,370); // first point
//strokeWeight(3);
//bezierVertex(400, 360, 400, 320, 320, 400);
//bezierVertex(400, 400, 600, 320, 620, 400);
//endShape();


//hole
fill(0);
ellipse(425,800,500,50);


//background character
//this represents the head
stroke(0);
strokeWeight(4);
fill(10,20,200,50);
arc(105,750,125,250,-PI,0);
line(43,750,168,750);

//this ellipse represents eyes
stroke(0);
fill(225);
strokeWeight(2);
ellipse(90,700,30,60);
ellipse(120,700,30,60);

fill(0);
ellipse(90,700,5,10);
ellipse(120,700,5,10);


font = loadFont("DialogInput-48.vlw"); 
textFont(font); 
text("!",94, 600);


