
size(350,300);
background(232,216,126);
smooth();

//large triangle
fill(245,237,190);
strokeWeight(2);
triangle(65,300,200,300,130,20);

//lines
line(206,300,0,150);
line(180,300,0,216);

//small triangle
fill(237,207,34);
noStroke();
triangle(140,150,215,150,175,75);
stroke(0);

//large triangle
noFill();
strokeWeight(2);
triangle(65,300,200,300,130,20);

//concentric circles
fill(206,192,112);
ellipse(240,175,75,75);
fill(43,69,162);
stroke(255);
strokeWeight(1);
ellipse(240,175,60,60);
fill(41,58,118);
ellipse(240,175,40,40);

//lone circle
fill(105,109,124);
stroke(0);
strokeWeight(.5);
ellipse(50,100,60,60);

//stray line
strokeWeight(2);
line(0,75,20,60);

//set of double likes
line(272.5,207.5,335,207.5);
line(272.5,212.2,335,212.5);
line(272.5,217.2,335,217.5);
line(272.5,30,335,30);
line(272.5,35,335,35);
line(300.5,0,300.5,250);
line(295.5,0,295.5,250);

//half circle
noFill();
arc(310,90,50,50,PI,TWO_PI-PI/2);
arc(310,90,50,50,PI/2,PI);



