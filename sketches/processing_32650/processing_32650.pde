
size(660,420);  // canvas

background(255,234,173);
/*********/
noStroke();
fill(255,255,153);  // yellow
triangle(210,10,380,380,540,180);
fill(0,0,102);
ellipse(120,120,60,60);
/*******/
fill(152,102,51); //brown
ellipse(300,235,55,45); //center
beginShape();
  vertex(90,410);
  vertex(30,220);
  vertex(160,150);
  vertex(285,180);
endShape(CLOSE);
fill(255,0,0);
noStroke();
triangle(300,100,310,60,360,105);
///********////
fill(255,214,173); //brown
beginShape();
  vertex(40,300);
  vertex(70,200);

  vertex(240,180);
  vertex(160,360);  
endShape(CLOSE);
////////////
//black
fill(0);
ellipse(510,180,240,240);
ellipse(220,120,45,45);
stroke(0);
strokeWeight(4);
line(60,410,540,0);
line(170,75,60,180);
strokeWeight(3);
line(60,80,400,0);
strokeWeight(2);
line(160,160,360,60);
line(240,100, 460,410);
noFill();
arc(420, 260,160,160, PI/2, PI);

noStroke();
fill(220);
ellipse(220,120,45,45);
fill(0);
ellipse(220,120,35,35);
fill(255);
ellipse(220,120,25,25);
fill(0);
ellipse(220,120,15,15);
fill(255,234,173);
ellipseMode(CORNER);
ellipse(510,180,240,240);
noFill();
stroke(255,153,0);

arc(50, 170, 200, 160,TWO_PI-PI/2, TWO_PI);
endShape();


