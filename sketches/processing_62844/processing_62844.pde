
size(600,400);
//himmel
background(0,180,255);
//wiese
noStroke();
fill(100,255,50);
rect(0,250,600,150);
//baumstamm
stroke(0);
fill(139,69,19);
rect(100,150,40,100);
//baumkrone
fill(100,255,0);
ellipse(120,100,80,140);

//Regenbogen
noStroke();
fill(255,255,0);
arc(600,250,450,450,PI, TWO_PI-PI/2);
fill(255,165,0);
arc(600,250,400,400,PI, TWO_PI-PI/2);
fill(255,0,0);
arc(600,250,350,350,PI, TWO_PI-PI/2);
fill(0,255,0);
arc(600,250,300,300,PI, TWO_PI-PI/2);
fill(0,180,255);
arc(600,250,250,250,PI, TWO_PI-PI/2);

//bauernhof
stroke(19,69,19);
fill(139,69,19);
rect(350,180,150,100);
//dach
stroke(150,0,0);
fill(200,0,0);
triangle(330,180,520,180,425,120);
//teich

stroke(0,0,255);
fill(0,100,255);
beginShape();
curveVertex(50,300);
curveVertex(50,325);
curveVertex(90,365);
curveVertex(180,350);
curveVertex(280,375);
curveVertex(280,345);
curveVertex(280,310);
curveVertex(180,290);
curveVertex(100,295);
curveVertex(50,325);
curveVertex(80,285);
endShape();












