
size(780,780);
background(255,255,255);
strokeWeight(10);

//red\\
fill(255,0,0);
rect(75,75,400,400);

fill(0,0,0);
rect(75,475,200,200);

//grey\\
fill(220,220,220);
rect(275,475,200,100);

rect(275,575,200,100);

fill(0,0,0);
rect(275,675,200,50);

//blue\\

fill(10,0,255);
rect(475,575,250,150);

//white\\
fill(255,255,255);
rect(475,475,250,100);

rect(475,275,125,200);
rect(600,275,125,200);

fill(244,221,155);
rect(475,75,250,200);

//yellow- no fill\\
fill(244,221,155);
noStroke();
rect(470,5,260,65);
rect(0,575,70,200);

//red- no fill\\
fill(255,0,0);
noStroke();
rect(730,575,50,300);

//lines\\

beginShape();
strokeWeight(10);
stroke(0,0,0);
vertex(75,75);
vertex(15,75);
endShape();

beginShape();
strokeWeight(10);
vertex(175,75);
vertex(175,15);
endShape();

beginShape();
strokeWeight(10);
vertex(475,75);
vertex(475,15);
endShape();

beginShape();
strokeWeight(10);
vertex(725,75);
vertex(725,25);
endShape();

beginShape();
strokeWeight(10);
vertex(725,575);
vertex(780,575);
endShape();

beginShape();
strokeWeight(10);
vertex(725,720);
vertex(725,790);
endShape();

beginShape();
strokeWeight(10);
vertex(275,700);
vertex(275,790);
endShape();

beginShape();
strokeWeight(10);
vertex(75,675);
vertex(75,790);
endShape();

beginShape();
strokeWeight(10);
vertex(75,275);
vertex(10,275);
endShape();

beginShape();
strokeWeight(10);
vertex(75,575);
vertex(10,575);
endShape();







