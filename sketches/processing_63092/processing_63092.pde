
// size
size(600, 600);
smooth();
background(255);
int val=250;

//240-280

//FACE - does not move
noFill();
stroke(0);
beginShape();
vertex(490,30);
vertex(215,300);
vertex(215,520);
vertex(385,520);
vertex(385,300);
vertex(110,30);
endShape();

//RIGHT EYE
beginShape();
vertex(320,250);
vertex(390,320);
vertex(495,215);
vertex(430,150);
vertex(385,200);
vertex(480,200);
endShape();
fill(0);
noStroke();
triangle(430,150,385,200,480,200);
//UNDER RIGHT EYE
stroke(0);
fill(255);

triangle(385,val-40,480,val-40,430,val+10);

//LEFT EYE
noFill();
stroke(0);
beginShape();
vertex(280,250);
vertex(210,320);
vertex(105,215);
vertex(170,150);
vertex(215,200);
vertex(120,200);
endShape();
fill(0);
noStroke();
triangle(120,200,215,200,170,150);

//UNDER LEFT EYE
stroke(0);
fill(255);
triangle(120,val-40,215,val-40,170,val+10);

// NOSE does not move
fill(0);
noStroke();
quad(300,295,322,317,300,339,279,317);
noFill();
stroke(0);
quad(300,338,266,304,300,270,334,304);
beginShape();
vertex(220,30);
vertex(315,125);
vertex(245,200);
vertex(245,320);
vertex(300,375);
vertex(355,320);
vertex(355,200);
vertex(285,125);
vertex(380,30);
endShape();

//MOUTH TOP *
fill(255);
beginShape();
vertex(300,685-val);
vertex(245,630-val);
vertex(245,585-val);
vertex(300,640-val);
vertex(355,585-val);
vertex(355,630-val);
endShape(CLOSE);

//MOUTH BOTTOM *
beginShape();
fill(255);
vertex(300,val+205);
vertex(245,val+260);
vertex(355,val+260);
endShape(CLOSE);




//MOUTH RIGHT *
fill(0);
noStroke();
beginShape();
vertex(val+60,445);
vertex(val+115,390);
vertex(val+160,390);
vertex(val+105,445);
vertex(val+160,500);
vertex(val+115,500);
endShape(CLOSE);



//MOUTH LEFT *
fill(0);
noStroke();
beginShape();
vertex(540-val,445);
vertex(485-val,390);
vertex(440-val,390);
vertex(495-val,445);
vertex(440-val,500);
vertex(485-val,500);
endShape(CLOSE);

//WHISKERS *
noFill();
stroke(0);
strokeWeight(1);
line(365,310,val+150,val+95);
line(365,325,val+150,val+110);
line(365,340,val+150,val+125);

line(450-val,val+95,235,310);
line(450-val,val+110,235,325);
line(450-val,val+125,235,340);




