
size(600,600);
background(250);

//cap
strokeWeight(3);
fill(250,255,0);
triangle(118,240,200,420,240,250);

strokeWeight(3);
fill(250,255,0);
triangle(482,240,400,420,360,250);

beginShape();
vertex(240, 250);
vertex(360, 250);
vertex(400,420);
vertex(200, 420);
endShape(CLOSE);

strokeWeight(3);
fill(250,255,0);
ellipse(300,180,400,300);

//tapar
fill(250,255,0);
noStroke();
beginShape();
vertex(125, 250);
vertex(476, 250);
vertex(399, 422);
vertex(203, 422);
endShape(CLOSE);

//ulls
rotate(-0.2);
stroke(0);
strokeWeight(2);
fill(255);
ellipse(165,350,60,170);
fill(0,159,255);
ellipse(165,390,50,90);
fill(0);
ellipse(165,410,25,50);
rotate(0.2);

rotate(0.2);
stroke(0);
strokeWeight(2);
fill(255);
ellipse(435,230,60,170);
fill(0,159,255);
ellipse(435,270,50,90);
fill(0);
ellipse(435,290,25,50);
rotate(-0.2);

//galtes
strokeWeight(3);
fill(250,255,0);
rotate(radians(-10));
ellipse(150,470,120,70);
rotate(radians(10));

fill(250,255,0);
rotate(radians(10));
ellipse(460,365,120,70);
rotate(radians(-10));

//tapargaltes
noStroke();
rect(200,398,204,65);

//boca
stroke(0);
strokeWeight(2);
stroke(0);
fill(255,205,0);
ellipse(305,420,60,20);

fill(255,205,0);
ellipse(305,420,80,40);

noStroke();
fill(250,255,0);
rect(250,420,100,30);

stroke(0);
fill(255,205,0);
ellipse(305,420,60,20);

stroke(0);
line(265,420,345,420);

noStroke();
fill(255,205,0);
rect(275,409,61,10);

//seies
noFill();
stroke(0);
curve(225,250,175,180,220,150,450,250);

noFill();
stroke(0);
curve(350,250,425,180,380,150,150,250);


//cabell
noFill();
stroke(0);
curve(300,300,300,70,275,15,300,150);

noFill();
stroke(0);
curve(300,100,315,40,300,15,310,150);


//cos
noStroke();
fill(250,255,0);
rect(273,460,70,100);

stroke(0);
strokeWeight(3);
noFill();
ellipse(265,510,20,100);

stroke(0);
strokeWeight(3);
noFill();
ellipse(350,510,20,100);

noStroke();
fill(255);
rect(253,468,10,100);

noStroke();
fill(255);
rect(352,468,10,100);








