
background(255, 240, 240); 
size(700,350);
smooth();

fill(173,151,64);
int x = 110; //stair
int y = 200;
int h = 30;

rect(x, y, 100, h);
x += 50;
rect(x, y+h, 100, h);
x += 50;
rect(x, y+h+h, 100, h);
x += 50;
rect(x, y+h*3, 100, h);
x += 50;
rect(x, y+(h+h+h+h), 100, h);
x +=310;
rect(x, y+h*4, 80, h);

fill(149,131,54);
beginShape(); //broken stair 
vertex(70,220);
vertex(95,240);
vertex(105,300);
vertex(80,280);
endShape(CLOSE);

beginShape();
vertex(55,250);
vertex(30,240);
vertex(15,300);
vertex(40,280);
endShape(CLOSE);

beginShape();
vertex(55,165);
vertex(45,170);
vertex(50,180);
vertex(65,170);
endShape(CLOSE);

fill(7, 151, 237);
for (int i = 0; i <= 700; i += 30) { //sea water
  ellipse(i, 350, 30, 20);
}

fill(122, 124,121);
ellipse (170, 150, 100, 100); //rolling ball

for (int i = 0; i <= 700; i += 10) { //top bar
  line(i, 50, i+10, 55);
}

for (int i = 50; i < 60; i +=5) { //top bar line
  line(0, i, 700, i);
}

fill(237,7,23);
strokeWeight(2);
for (int i = 20; i <= 150; i +=30) { // life point
  ellipse(i, 35, 20, 20);
}

strokeWeight(2);
for (int i = 10; i <= 120; i += 30) { //cross life point
  line (i, 25, i+20, 45);
}

strokeWeight(1); //coin X
line (290, 30, 300, 40);
line (300, 30, 290, 40);

fill(255,230,0);
noStroke(); // coin
ellipse (280, 35, 10, 25); 

for (int i = 440; i <=600; i +=30) { 
  ellipse (i, 240, 10, 25);
}

fill(0);
ellipse (330, 200, 30, 30); //running guy
stroke(1);
line (322, 213, 300, 235);
line (322, 213, 297, 209);
line (322, 213, 330, 240);
line (297, 209, 297, 220);
line (330, 240, 338, 230);
line (300, 235, 313, 240);
line (300, 235, 285, 247);
line (313, 240, 320, 270); 
line (285, 247, 270, 230);
line (320, 270, 325, 265);
line (270, 230, 265, 235);

fill(106,250,210);
rect (645, 225, 60, 95);
fill(0); // door frame
rect (650, 230, 50, 90);

fill(49,173,141); // door
beginShape();
vertex (670, 220);
vertex (700, 230);
vertex (700, 320);
vertex (670, 320);
endShape(CLOSE);
fill(201,203,203);
ellipse (680, 280, 5, 5); 

fill(0);
textSize(16); //coin number
text ("215", 305, 41);

textSize(16); //time
text ("T I M E : 316", 610, 41);

stroke(255); //text clound
strokeWeight(12);
strokeJoin(ROUND);
fill(255);
rect (350, 80, 330, 85);

noStroke(); 
beginShape();
vertex (380, 160);
vertex (350, 185);
vertex (400, 160);
endShape(CLOSE);

fill(0); //text
textSize(18);
text ("A massive ball try to roll over me,", 375, 95);
text ("gold coins flying in the air!", 375, 115);
text ("Wait, How come it looks like Mario?", 375, 135);
text ("Crap, did i die 4 times already?", 375, 155);



