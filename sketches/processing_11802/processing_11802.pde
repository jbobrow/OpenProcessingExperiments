
// Project 1
// Gillian Diffenderfer
// gdiffender@brynmawr.edu
// 07 September 10

void setup() {
  size(600,700);
  background(209,219,255);
  smooth();
}

void draw () {
  

fill(163,152,242);
  stroke(255);
  ellipse(mouseX,mouseY,200,200);
fill(224,219,252);
  noStroke();
  ellipse(mouseX,mouseY,150,150);
  fill(124,111,211);
  arc(mouseX,mouseY,150,150,0,PI/2);
  fill(149,134,255);
  arc(mouseX,mouseY,150,150,PI/2.3,PI);
fill(255);
  noStroke();
  ellipse(mouseX,mouseY,75,75);
fill(226,222,255);
  noStroke();
  ellipse(mouseX,mouseY,30,30);
  
  // green
fill(40,77,15,10);
  noStroke();
  ellipse(200,520,400,410);
  fill(250,255,3,100);
  arc(200,520,400,410,0,PI/3.5);
  fill(132,137,25,100);
  arc(200,520,400,410,PI/3.5,PI);
  fill(50,170,0,100);
  arc(200,520,400,410,PI,PI*1.5);
  
fill(62,129,18,90);
  noStroke();
  ellipse(200,500,250,250);
  fill(169,209,143,100);
  arc(200,500,250,250,0,PI/4);
  fill(197,242,51,100);
  arc(200,500,250,250,PI/4,PI/2);
  fill(194,255,126,100);
  arc(200,500,250,250,PI/2,PI);
  fill(246,250,33,100);
  arc(200,500,250,250,PI,PI*1.3);
  fill(249,250,212,100);
  arc(200,500,250,250,PI*1.3,PI*2);
  
fill(160,255,98,90);
  noStroke();
  ellipse(200,500,100,100);
  
  
  // blue
fill(44,68,155,10);
  noStroke();
  ellipse(500,100,300,300);

fill(198,198,245,10);
  noStroke();
  ellipse(500,100,200,190);
  fill(142,141,229);
  arc(500,100,200,190,0,PI/1.5);
  fill(245,240,250);
  arc(500,100,200,190,PI/1.9,PI/2.7);
 
   //yellow
 fill(254,255,13);
   noStroke();
   ellipse(175,350,400,400);

fill(252,219,84);
   noStroke();
   ellipse(175,350,300,295);
   
fill(252,219,84);
  noStroke();
  ellipse(175,350,300,295);
  fill(255,205,0);
  arc(175,350,200,195,0,PI*2);
  fill(229,194,67);
  arc(175,350,200,195,PI*2.2,PI*3);
  fill(157,146,105);
  arc(175,350,200,195,PI/1.2,PI/4);
  
fill(129,105,16,255);
  noStroke();
  ellipse(175,350,50,50);
  
  
fill(245,191,84,200);
  noStroke();
  ellipse(175,350,100,95);
  
  //red
fill(180,36,36,30);
  noStroke();
  ellipse(300,300,350,330);
  
fill(250,154,154);
  noStroke();
  ellipse(300,300,200,200);
  fill(255,214,214);
  arc(300,300,200,200,0,PI/2);
  fill(242,93,0);
  arc(300,300,200,200,PI/2,PI/2.5);
  fill(255,148,0);
  arc(300,300,200,200,PI/2.5,PI/3);
  fill(255,198,198);
  ellipse(300,300,100,100);
  fill(255,230,203);
  ellipse(300,300,75,75);
  fill(255,40);
  ellipse(300,300,25,25);
  
  //blue
fill(194,193,259,55);
  noStroke();
  ellipse(500,120,100,90);
  fill(92,134,55,100);
  ellipse(500,105,200,200);
  
  //purple
fill(147,47,145,50);
  noStroke();
  ellipse(250,450,450,410);

fill(232,138,199,75);
  noStroke();
  ellipse(250,400,250,240);
  fill(245,119,152);
  arc(250,450,250,240,0,PI/4);
  fill(214,78,114);
  arc(250,450,250,240,PI/4,PI/2);
  fill(229,60,105);
  arc(250,450,250,240,PI/2,PI);
  fill(245,200,212);
  arc(250,450,250,240,PI,PI*1.35);
  fill(234,199,208,15);
  arc(250,450,250,240,PI*1.5,PI*1.7);
  

fill(203,64,101,29);
  noStroke();
  ellipse(250,450,100,100);
  
  beginShape();
fill(235,10);
curveVertex(500,100);
curveVertex(200,200);
curveVertex(50,500);
curveVertex(25,1000);
curveVertex(100,500);
curveVertex(200,200);
curveVertex(500,50);
curveVertex(1000,25);
endShape(CLOSE);



}

