
size(340,540);
smooth();
background(237,30,121);

//left wheel

fill(255);
strokeWeight(8);
ellipse(120,440,80,100);
fill(0);
noStroke();
ellipse(130,440,60,80);

//body
noStroke();
fill(0);
ellipse(170,200,100,100);
rect(120,200,100,110);
rect(120,370,100,50);
ellipse(170,420, 100,100);

//right wheel

stroke(0);
fill(255);
strokeWeight(8);
ellipse(220,440,80,100);
fill(0);
noStroke();
ellipse(230,440,60,80);

//waist
strokeWeight(30);
stroke(0);
line(120,340,220,340);

//face
stroke(255);
strokeWeight(8);
line(140,180,170,200);
line(170,200,200,180);
arc(170,220,20,20,0,3.14);

stroke(255,237,0);
strokeWeight(12);
point(200,200);
point(140,200);

//antenna
stroke(0);
strokeWeight(6);
fill(255);
line(170,130,170,150);
ellipse(170,120,20,20);

//left arm
noFill();
strokeWeight(30);
arc(140,200,160,160,1.57,3.14);
strokeWeight(15);
arc(60,160,80,80,0,3.14);

//right arm
noFill();
strokeWeight(30);
arc(200,200,160,160,0,1.57);
strokeWeight(15);
arc(280,160,80,80,0,3.14);

//lightning
strokeWeight(8);
stroke(255,237,0);
line(180,40,160,60);
line(160,60,180,60);
line(180,60,160,80);

