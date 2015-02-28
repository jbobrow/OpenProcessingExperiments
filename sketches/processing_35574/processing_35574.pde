
void setup(){
  size(500,300);
}

void draw(){
  colorMode(HSB,255);
  fill(mouseX,50,200);
  noStroke();
  rect(0,0,width,50);
  rect(0,100,width,50);
  rect(0,200,width,50);
  colorMode(RGB,200);
  fill(mouseY,100,100);
  rect(0,50,width,50);
  rect(0,150,width,50);
  rect(0,250,width,50);
  //wall
  
  colorMode(RGB);
  stroke(255,255,255);
  strokeWeight(4);
  colorMode(RGB,250);
  fill(mouseY+100,150,255);
  rect(10,50,100,150);
  //window
  
  smooth();
   strokeWeight(1);
  stroke(200);
  line(250,0,250,75);
  line(260,0,260,45);
  line(270,0,270,30);
  line(230,0,230,30);
  line(240,0,240,45);
  stroke(232,129,mouseY);
  strokeWeight(10);
  point(270,4);
  point(271,15);
  point(270,30);
  point(250,6);
  point(250,15);
  point(250,30);
  point(250,45);
  point(250,50);
  point(250,63);
  point(250,75);
  point(260,10);
  point(260,33);
  point(260,45);
  point(240,3);
  point(240,10);
  point(240,26);
  point(240,35);
  point(240,43);
  point(230,4);
  point(230,10);
  point(230,25);
  //chandelier
  
  fill(255,255,mouseY);
  noStroke();
  ellipse(59,mouseY/3+65,20,20);
  fill(78,200,96);
  rect(12,154,97,45);
  //outdoors
  
  stroke(240);
  strokeWeight(3);
  line(10,60,110,60);
  line(10,70,110,70);
  line(10,80,110,80);
  line(10,90,110,90);
  line(10,100,110,100);
  line(10,110,110,110);
  line(10,120,110,120);
  line(10,130,110,130);
  line(10,140,110,140);
  line(10,150,110,150);
  line(10,160,110,160);
  line(10,170,110,170);
  line(10,180,110,180);
  line(10,190,110,190);
  fill(223,174,250);
  noStroke();
  arc(0,40,50,300,0,PI/2);
  triangle(0,180,20,270,0,270);
  arc(120,40,60,300,PI/2,PI);
  triangle(120,180,100,270,120,270);
  fill(137,240,104);
  rect(0,30,120,30);
  //blinds and curtains
  
  fill(50);
  ellipse(mouseX,300,20,20);
  ellipse(mouseX+8,294,7,7);
  noFill();
  strokeWeight(2);
  stroke(50);
  arc(mouseX-2,290,25,25,PI/2,PI);
  //mouse
  
  fill(29);
  noStroke();
  rect(117,265,300,50);
  arc(145,275,70,90,PI,TWO_PI-PI/2);
  rect(175,230,30,45);
  rect(235,230,30,45);
  rect(295,230,30,45);
  rect(355,230,30,45);
  fill(236);
  rect(145,230,30,45);
  rect(205,230,30,45);
  rect(265,230,30,45);
  rect(325,230,30,45);
  arc(385,275,70,90,TWO_PI-PI/2,TWO_PI);
  rect(150,170,100,60);
  rect(280,170,100,60);
  fill(216,59,151);
  rect(155,200,220,30);
  //bed
  
  stroke(0);
  strokeWeight(8);
  line(width/2-23,0,width/2+23,0);
  //chandelier base
}

