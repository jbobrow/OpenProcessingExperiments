
void setup() {
  size(500,500);
  background(255,233,106);
  smooth();

  fill(129,199,255);
  stroke(2,99,214,120);
  strokeWeight(3);
  line(500,0,400,80);
  line(0,0,100,80);
  line(100,80,100,450);
  line(100,450,0,500);
  line(500,500,400,450);
  line(100,450,400,450);
  line(100,80,200,80);
  line(400,450,400,330);

  rect(200,80,200,250);
  strokeWeight(8);
  strokeJoin(ROUND);
  stroke(2,99,214);
  rect(200,80,200,250);
  line(300,80,300,360);
  line(200,225,400,225);
  strokeWeight(8);
  stroke(2,99,214);
  fill(2,99,214);
  strokeJoin(ROUND);

  noStroke();
  fill(255,140);
  ellipse(250,120,40,40);
  ellipse(270,140,40,40);
  ellipse(250,150,50,40);
  ellipse(230,130,30,30);
  ellipse(220,150,30,30);

  fill(2,99,214);
  stroke(2,99,214);
  strokeWeight(7);
  strokeJoin(ROUND);
  quad(200,330,400,330,430,360,170,360);

  fill(21,80,149,150);
  noStroke();
  strokeWeight(2);
  beginShape();
  curveVertex(320,250); 
  curveVertex(320,250); 
  curveVertex(335,300);
  curveVertex(320,310);
  curveVertex(320,330);
  curveVertex(370,330);
  curveVertex(370,310);
  curveVertex(355,300);
  curveVertex(370,250);
  curveVertex(345,260);
  curveVertex(320,250);
  curveVertex(320,250);
  endShape();

  fill(14,49,137);
  strokeWeight(2);
  beginShape();
  curveVertex(345,260);
  curveVertex(345,260);
  curveVertex(330,200);
  curveVertex(300,180);
  endShape();

  noStroke();
  fill(16,59,162,140);
  ellipse(320,200,20,20);
  fill(107,144,234,140);
  ellipse(320,190,20,20);
  fill(16,59,162,140);
  ellipse(330,185,20,20);
  fill(107,144,234,140);
  ellipse(340,190,20,20);
  fill(16,59,162,140);
  ellipse(340,200,20,20);
  fill(107,144,234,140);
  ellipse(330,205,20,20);

  fill(35,125,232);
  noStroke();
  strokeWeight(2);
  beginShape();
  curveVertex(0,70); 
  curveVertex(0,70); 
  curveVertex(40,75);
  curveVertex(120,150);
  curveVertex(140,250);
  curveVertex(120,460);
  curveVertex(80,500);
  curveVertex(0,600);
  curveVertex(0,600);
  endShape();

  fill(255);
  stroke(21,80,149);
  beginShape();
  curveVertex(20,190); 
  curveVertex(20,190); 
  curveVertex(70,170);
  curveVertex(120,190);
  curveVertex(70,210);
  curveVertex(20,190);
  curveVertex(20,190);
  endShape();
 

  fill(59,134,224,220);
  noStroke();
  ellipse(80,190,30,30);
  fill(21,80,149,150);
  ellipse(80,190,10,10);

  fill(21,80,149,150);
  noStroke();
  beginShape();
  curveVertex(-40,420); 
  curveVertex(-40,420); 
  curveVertex(-2.5,400);
  curveVertex(35,410); 
  curveVertex(72.5,400);
  curveVertex(110,410);
  curveVertex(72.5,440);
  curveVertex(35,435);
  curveVertex(-2.5,440);
  curveVertex(-40,420); 
  curveVertex(-40,420);
  endShape();

  fill(46,62,103,200);
  beginShape();
  curveVertex(-40,420); 
  curveVertex(-40,420); 
  curveVertex(35,425);
  curveVertex(120,410);
  curveVertex(120,410);
  endShape();

  noFill();
  strokeWeight(2);
  stroke(21,80,149);
  beginShape();
  curveVertex(40,250);
  curveVertex(40,250); 
  curveVertex(70,330);
  curveVertex(30,350);
  curveVertex(30,350);
  endShape();
  
  fill(46,62,103,200);
  ellipse(120,290,70,70);
  
  
}


