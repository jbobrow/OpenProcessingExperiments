
size(700, 600);
background(255,255,255);
strokeWeight(0);

fill(255,0,0); 
arc(350,300, 150,150,0,radians(360));

fill(0,0,255);
arc(350,300, 150,150,0, radians(180));

stroke(0,0,255);
fill(0,0,255);
arc(389,300, 75,75,0,radians(360));

stroke(255,0,0);
fill(255,0,0);
arc(313,300, 75,75,0,radians(360));

stroke(0,0,0);

fill(0,0,0);
beginShape();
  vertex(55,200);
  vertex(125,100);
  vertex(195,160);
  vertex(125,255);
 endShape();

fill(0,0,0);
beginShape();
  vertex(125,520);
  vertex(55,410);
  vertex(125,370);
  vertex(195,465);
 endShape();
 
 fill(0,0,0);
beginShape();
  vertex(550,100);
  vertex(635,200);
  vertex(550,255);
  vertex(480,160);
 endShape();
 
 fill(0,0,0);
beginShape();
  vertex(550,370);
  vertex(635,410);
  vertex(550,520);
  vertex(480,465);
 endShape();
 
stroke(255,255,255);
strokeWeight(15);
strokeCap(SQUARE);

//BOTTOM LEFT
line(70,390 , 155,510);

line(105,380 , 180,490);
 
line(115,455 , 140,440);
//TOP LEFT

line(70,220 , 150,110);

line(100,240 , 180,130);
//BOTTOM RIGHT

line(500,485 , 577,375);

line(530,505 , 607,390);

line(595,475 , 515,415);
//TOP RIGHT
line(580,250 , 490,130);

line(615,225 , 520,100);

line(515,210 , 535,195);

line(575,165 , 600,145);
