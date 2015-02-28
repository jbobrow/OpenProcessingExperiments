
size(600, 600);
background(155, 230, 164);
smooth();

//sky
noStroke();
fill(156, 226, 245, 200);
rect(0,0, 600,360);

//robot

//neck
fill(40, 42, 63);
stroke(10);strokeWeight(1);strokeJoin(ROUND);
rect(325,170, 60,40);
//fg neck
fill(102, 102, 102, 120);
noStroke();
rect(325,170, 52,40);

//antenas
//left-side
stroke(210, 98, 204);strokeWeight(2);strokeJoin(ROUND); 
line(355,180, 300,60); 
fill(246, 200, 244);
ellipse(300,60, 12,12);
//right-side
stroke(210, 98, 204);strokeWeight(2);strokeJoin(ROUND); 
line(355,180, 400,30); 
fill(246, 200, 244);
ellipse(400,30, 12,12);

//left-side arm
fill(40, 42, 63);
stroke(10);strokeWeight(1);strokeJoin(ROUND);
rect(180,220, 80,30);
//fg arm left
fill(102, 102, 102, 120);
noStroke();
rect(180,220, 80,24);
//left hand
fill(210, 98, 204);
stroke(10);strokeWeight(1);strokeJoin(ROUND);
ellipse(180,235, 40,40);
//fg left hand
fill(246, 200, 244, 160);
noStroke();
ellipse(180,235, 30,30);

//legs
//left-side
fill(40, 42, 63);
stroke(10);strokeWeight(1);strokeJoin(ROUND);
rect(280,420, 40,100);
//fg leg left
fill(102, 102, 102, 120);
noStroke();
rect(280,420, 32,100);
//right-side
fill(40, 42, 63);
stroke(10);strokeWeight(1);strokeJoin(ROUND);
rect(380,420, 40,100);
//fg leg right
fill(102, 102, 102, 120);
noStroke();
rect(380,420, 32,100);

//feet
//left foot
fill(210, 98, 204);
stroke(10);strokeWeight(1);strokeJoin(ROUND);
ellipse(290,530, 80,40);
//fg left foot
fill(246, 200, 244, 160);
noStroke();
ellipse(286,530, 72,38);
//right foot
fill(210, 98, 204);
stroke(10);strokeWeight(1);strokeJoin(ROUND);
ellipse(390,530, 80,40);
//fg right foot
fill(246, 200, 244, 160);
noStroke();
ellipse(386,530, 72,38);

//bg body
fill(40, 42, 63);
stroke(10);strokeWeight(1.5);strokeJoin(ROUND);
beginShape();
vertex(240,220);
vertex(260,200);
vertex(440,200);
vertex(460,220);
vertex(460,440);
vertex(440,460);
vertex(260,460);
vertex(240,440);
endShape(CLOSE);

//right-side arm
fill(40, 42, 63);
stroke(10);strokeWeight(1);strokeJoin(ROUND);
rect(440,220, 80,30);
//fg arm right
fill(102, 102, 102, 120);
noStroke();
rect(440,220, 80,24);
//right hand
fill(210, 98, 204);
stroke(10);strokeWeight(1);strokeJoin(ROUND);
ellipse(520,235, 40,40);
//fg right hand
fill(246, 200, 244, 160);
noStroke();
ellipse(520,235, 30,30);

//fg body
fill(102, 102, 102, 120);
stroke(10);strokeWeight(1);strokeJoin(ROUND);
beginShape();
vertex(240,220);
vertex(260,200);
vertex(440,200);
vertex(440,420);
vertex(420,440);
vertex(240,440);
endShape(CLOSE);

//bg head
fill(40, 42, 63);
stroke(10);strokeWeight(1.5);strokeJoin(ROUND);
beginShape();
vertex(300,110);
vertex(310,100);
vertex(400,100);
vertex(410,110);
vertex(410,170);
vertex(400,180);
vertex(310,180);
vertex(300,170);
endShape(CLOSE);
//fg head
fill(102, 102, 102, 120);
stroke(10);strokeWeight(1);strokeJoin(ROUND);
beginShape();
vertex(300,110);
vertex(310,100);
vertex(400,100);
vertex(400,165);
vertex(395,170);
vertex(300,170);
endShape(CLOSE);

//face
//left-eye
stroke(210, 98, 204);strokeWeight(4);strokeJoin(ROUND); 
fill(246, 200, 244);
ellipse(325,125, 24,24);
//right-eye
stroke(210, 98, 204);strokeWeight(4);strokeJoin(ROUND); 
fill(246, 200, 244);
ellipse(375,125, 24,24);
//mouth
stroke(210, 98, 204);strokeWeight(3);strokeJoin(ROUND); 
line(325,155, 375,155);

//trianlge heart
triangle(320,260, 300,300, 340,300);






