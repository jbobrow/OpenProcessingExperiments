
//first try at processing drawing. This is my sketch of a Batman/Superman mashup symbols

//setup
size(1000,400);
background(#0A0A0A);

//batman - background
fill(#ffda21);
arc(500,200,1000,400,1.57,4.71);

//batman - symbol
beginShape();
noStroke();
fill(#0A0A0A);
vertex(500,50);
vertex(450,50);
vertex(430,20);
vertex(430,300);
vertex(500,400);
vertex(500,50);
endShape();

arc(480,50,60,20,2.95,6.28);
rect(190,100,300,200);

arc(200,200,350,250,1.57,4.71);

fill(#ffda21);
noStroke();
arc(305,100,250,110,0,3.92);
arc(200,325,150,215,3.14,6.30);
arc(355,325,155,237,3.14,6.30);


//superman-background
beginShape();
fill(#c40028);
vertex(500,0);
vertex(875,0);
vertex(1000,125);
vertex(725,400);
vertex(500,400);
vertex(500,0);
endShape();

//superman-symbol
fill(#ffda21);
stroke(#0A0A0A);
strokeWeight(8);

beginShape();
vertex(750,80);
vertex(700,30);
vertex(760,30);
endShape();
arc(726,46,80,92,-0.32,0.86);

beginShape();
vertex(500,135);
vertex(865,135);
vertex(865,40);
vertex(955,125);
vertex(833,250);
vertex(650,165);
vertex(500,165);
endShape();

arc(499,164,460,260,4.72,6.075);

noStroke();
triangle(720,135,720,140,650,150);
rect(721,139.5,15,15);

stroke(#0A0A0A);
strokeWeight(8);
fill(#c40028);
arc(645,245.1,370,160,4.5,6.36);

fill(#ffda21);
arc(499.5,271,330,100,4.72,6.28);
arc(499.5,270,330,200,0,1.57);

noStroke();
fill(#c40028);
rect(600,170,60,10);

stroke(#ffda21);
strokeWeight(5);
line(496,3,496,38);


