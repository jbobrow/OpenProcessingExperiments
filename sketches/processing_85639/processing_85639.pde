
size(600,200);
smooth();
background(0);

//outline

//strokeCap(SQUARE);
stroke(#678C8B);
strokeWeight(5);
line(25, 175, 575, 175);
line(25, 25, 575, 25);

//dots

stroke(255);
strokeWeight(40);
point(200,100);
point(300,100);
point(400,100);
point(500,100);

//Pacman
noStroke();
fill(#F2E215);
arc(100, 100, 85, 85, PI*0.25, PI*1.75);

//border
rectMode(CENTER);
stroke(255);
strokeWeight(5);
noFill();
rect(300,100,598,198);

//point(450,165);
//point(475,150);
//point(500,165);
//point(525,150);
//point(550,165);
//point(550,100);
//point(500,30);
//point(450,100);
//point(450,165);

stroke(#F27921);
fill(#F27921);
beginShape();
  curveVertex(450,165);
  curveVertex(450,165);
  curveVertex(475,150);
  curveVertex(500,165);
  curveVertex(525,150);
  curveVertex(550,165);
  curveVertex(550,100);
  curveVertex(500,30);
  curveVertex(450,100);
  curveVertex(450,165);
  curveVertex(450,165);
endShape();
