

size(800,800);
background(51,93,106);
smooth();
noStroke();

//Back of hair
fill(39,21,4);
ellipse(400,300,450,450);
rect(300,500,200,20);
triangle(210, 420, 225, 460, 240, 420);
for(int i = 0; i <11; i = i = i +1) {
  translate(10,10);
  triangle(210, 420, 225, 460, 240, 420);
}translate(-110, -110);
triangle(560,420,575,460,590,420);
for(int i = 0; i <11; i = i = i +1) {
  translate(-10,10);
  triangle(560,420,575,460,590,420);
}translate(110,-110);

//Back of collared shirt
fill(255,255,255);
quad(550,620, 400,550, 250,620, 400,800);
fill(211,208,205);
rect(310,550,180,100);

//Neck
fill(240,200,152);
quad(340,500, 460,500, 470,600, 330,600);
triangle(470,600, 400,650, 330,600);

//Tie
fill(237,69,69);
rect(370,630, 60, 50);
fill(196,59,59);
rect(360,680, 80, 120);

//Shoulder suit
fill(31,31,31); 
quad(400,800, 700,800, 700,700, 550,620);
quad(400,800, 100,800, 100,700, 250,620);

//Front of collared shirt
fill(234,231,227);
quad(310,550, 400,630, 320,700, 290,600);
quad(490,550, 400,630, 480,700, 510,600);

//Head
fill(245, 216, 173);
ellipse(400, 300, 400, 400);
beginShape();
curveVertex(220,  400);
curveVertex(220,  400);
curveVertex(350,  525);
curveVertex(450,  525);
curveVertex(580, 400);
curveVertex(580, 400);
endShape();

//Ears
ellipse(570,350,75,100);
ellipse(230,350,75,100);

//Sideburns
fill(70,36,4);
triangle(570,275,550,500,620,275);
triangle(180,275,250,500,230,275);

//Nose
fill(240,200,152);
beginShape();
curveVertex(475,300);
curveVertex(475,300);
curveVertex(425,350);
curveVertex(425,450);
curveVertex(400,350);
curveVertex(475,300);
curveVertex(475,300);
endShape();
triangle(375,450,390,425,390,450);

//Eyes
fill(255,255,255);
ellipse(320,325,65,40);
ellipse(490,325,65,40);
fill(0,0,0);
ellipse(320,325,40,40);
ellipse(490,325,40,40);
fill(255,255,255);
ellipse(330,330,10,10);
ellipse(500,330,10,10);

//Smile
noFill();
stroke(0);
strokeWeight(3);
arc(400,480,70,30,0,PI);

noStroke();
//Hair
fill(39,21,4);
triangle(210, 275, 225, 315, 250, 255);
for(int j = 0; j < 7; j = j + 1){
  translate(50,0);
  triangle(210, 275, 225, 315, 250, 255);
}

translate(-350,0);
fill(70,36,4);
arc(400, 275, 450, 450, PI, 2*PI);

triangle(175, 275, 200, 300, 225, 275);
for(int i = 0; i <8; i = i = i +1) {
  translate(50,0);
  triangle(175, 275, 200, 300, 225, 275);
}

translate(-400,0);
fill(255,255,255);
textSize(100);
text("i am the ", 20, 100);
fill(237,69,69);
text("walrus", 450, 100);
fill(255,255,255);
textSize(20);
text("-John Lennon", 600,150);


