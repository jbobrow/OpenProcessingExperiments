
size(500,300);
background (234, 217, 191);

fill(255,230,150);
noStroke();
triangle(200, 275, 400, 150, 175, 10);

fill(3,0,3);
ellipse(400, 150, 150, 150);

fill(112,81,37);
beginShape();
  vertex (10, 200);
  vertex (150,100);
  vertex (250,150);
  vertex (150,275);
endShape(CLOSE);

fill(234, 217, 191);
beginShape();
  vertex (80, 100);
  vertex (10,100);
  vertex (250,100);
  vertex (75,100);
endShape(CLOSE);


noFill();
stroke(0,0,0);
strokeWeight(1);
beginShape();
  vertex (50,25);
  vertex (100,5);
  vertex (150,50);
  vertex (75,100);
endShape(CLOSE);

fill(229,84,39);
noStroke();
triangle(280, 50, 250, 60, 240,20);

fill(59,50,97);
ellipse(50 , 120, 50, 50);

stroke(0,0,0);
strokeWeight(2);
line(20, 150, 100, 100);

stroke(0,0,0);
strokeWeight(2);
line(100, 275, 455, 20);



