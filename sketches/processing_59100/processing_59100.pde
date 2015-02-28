
size(400,500);
background(255);

noStroke();
smooth();
//Face color
fill(19,19,216);
rect(120,80,200,30);
fill(224,50,50);
rect(70,95,50,15);
fill(19,19,216);
rect(70,80,25,15);
fill(245,210,94);
rect(95,80,25,15);

//body color
fill(19,19,216);
rect(60,250,270,150);
fill(224,50,50);
ellipse(280,320,80,80);
fill(124,222,83);
ellipse(350,180,20,20);


//fingerpaint
stroke(0);
strokeWeight(8);
noFill();
ellipse(200,100,240,120);
strokeWeight(12);
ellipse(130,80,90,90);
ellipse(270,80,90,90);
ellipse(130,80,20,20);
ellipse(270,80,20,20);
line(200,60,200,120);
line(200,160,200,250);
line(180,140,220,140);

//eyelashes
stroke(0);
strokeWeight(10);
noFill();
bezier(50,50,85,60,95,70,90,90);
bezier(50,30,85,40,95,50,120,60);
bezier(80,20,45,20,65,10,140,40);

//star
strokeWeight(8);
line(260,180,260,220);
line(240,200,280,200);
line(240,220,280,180);
line(240,180,280,220);

//waffle vertical
strokeWeight(14);
line(130,240,130,420);
line(60,240,60,420);
line(330,240,330,420);
line(260,240,260,420);

//waffle vertical
line(30,250,360,250);
line(30,300,360,300);
line(30,350,360,350);
line(30,400,360,400);

//eyeballs
fill(0);
strokeWeight(8);
ellipse(130,80,20,20);
ellipse(270,80,20,20);
