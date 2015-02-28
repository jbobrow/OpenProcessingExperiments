
void setup(){
  size(600,600);
}
void draw(){
  background(93,148,255);
  smooth();
  noStroke();
  
  float ang1 =  0.5 * (sin(millis()/1800.0));
  float ang2 =  1.0 * (sin(millis()/1500.0));
  float ang3 =  0.1 * (sin(millis()/2000.0));
  float ang4 =  0.9 * (5-sin(millis()/2000.0));
    
    
      pushMatrix();
  translate(100,200);
  fill(255);
  arc(-20,0, 110,20, PI,2*PI); //cloud 1
  arc(-30,0, 40,40, PI,2*PI);
  arc(0,0, 40,60, PI,2*PI);
  popMatrix();
  
  pushMatrix();
  translate(500,100);
  arc(-20,0, 110,20, PI,2*PI); //cloud 2
  arc(-40,0, 50,40, PI,2*PI);
  arc(0,0, 50,60, PI,2*PI);
  popMatrix();
  
  pushMatrix();
  translate(400,550);
  arc(-20,0, 110,20, PI,2*PI); //cloud 3
  arc(-42,0, 50,60, PI,2*PI);
  arc(0,0, 60,45, PI,2*PI);
  popMatrix();
  
  
  fill(255,208,36);
  pushMatrix();
  translate(375,385);
  rotate( ang1);
  rect(-15,0, 30,90); //back feet
  fill(98,61,0);
  ellipse(-2,65, 22,15);
  fill(255,208,36);
  translate(0,90);
  ellipse(0,0, 30,30);
  rotate( ang2);
  ellipse(0,0, 30,30);
  rect(-15,0, 30,50);
  fill(98,61,0);
  rect(-15, 30, 30,20);
  popMatrix();
  
  fill(255,208,36);
  pushMatrix(); //front feet
  translate(225,385);
  rotate( ang1);
  rect(-15,0, 30,90);
  fill(98,61,0);
  ellipse(-4,50, 20,10);
  fill(255,208,36);
  translate(0,90);
  ellipse(0,0, 30,30);
  rotate( ang2);
  ellipse(0,0, 30,30);
  rect(-15,0, 30,50);
  fill(98,61,0);
  ellipse(5,10, 15,9);
  rect(-15, 30, 30,20);
  popMatrix();
  
  fill(255,208,36);
  pushMatrix();
  translate(189,320);
  rotate( ang3);
  neck();
  translate(22,-200);
  rotate( ang1);
  stroke(98,61,0);
  strokeWeight(10);
  line(-10,-30, -10,-50); //horns
  noStroke();
  fill(98,61,0);
  ellipse(-10,-50, 15,15); 
  fill(255,208,36);
  ellipse(0,0, 70,70); //head
  ellipse(-30,5, 50,40);
  triangle(12,-30, 25,-40, 30,-10);
  fill(98,61,0);
  ellipse(15,12, 20,10);
  ellipse(3,-6, 13,9);
  fill(0);
  ellipse(-20,-10, 5,5); //eye
  popMatrix();
  
  pushMatrix(); //tail
  fill(255,208,36);
  translate(410,350);
  rotate(ang4);
  rect(-10,0, 15,50);
  translate(-3,50);
  ellipse(0,0, 15,15);
  rotate(ang2);
  ellipse(0,0, 15,15);
  rect(-8,0, 15,30);
  translate(0,30);
  fill(98,61,0);
  ellipse(0,0, 20,20); //brown bit on end of tail
  ellipse(0,7, 10,10);
  popMatrix();
  fill(255,208,36);
  ellipse(300,350, 250,150); //body
  fill(98,61,0);
  ellipse(340,370, 40,30);
  ellipse(250,300, 35,20);
  ellipse(220,380, 25,20);
  ellipse(200,340, 30,15);
  beginShape(); //spot1
  curveVertex(265,360);
  curveVertex(270,380);
  curveVertex(254,360);
  curveVertex(240,375);
  curveVertex(259,385);
  curveVertex(268,379);
  curveVertex(265,360);
  endShape();
  beginShape(); //spot2
  curveVertex(350,330);
  curveVertex(380,330);
  curveVertex(400,340);
  curveVertex(355,350);
  curveVertex(350,330);
  curveVertex(350,330);
  endShape();
  ellipse(280,340, 40,25);
  ellipse(345,310, 30,10);
  
  stroke(0);
  strokeWeight(1);
  pushMatrix();
  translate(300,271);
  rotate(PI-ang3);
  pushMatrix();
  line(0,0, 0,200);
  translate(0,170);
  fill(26,219,255);
  balloon(); //aqua balloon
  popMatrix();
  pushMatrix();
  line(0,0, -40,160);
  translate(-38, 160);
  fill(255,98,208);
  balloon(); //light pink balloon
  popMatrix();
  pushMatrix();
  line(0,0, 15,150);
  translate(15,150);
  fill(0,240,13);
  balloon(); //green balloon
  popMatrix();
  pushMatrix();
  line(0,0, -50,140);
  translate(-50,140);
  fill(165,0,255); //purple balloon
  balloon();
  popMatrix();
  pushMatrix();
  line(0,0, -10,150);
  translate(-10,140);
  fill(255,141,0);
  balloon(); //yellow balloon
  popMatrix();
  pushMatrix();
  line(0,0, -5,110);
  translate(-5,110);
  fill(255,255,0);
  balloon(); //orange balloon
  popMatrix();
  pushMatrix();
  line(0,0, 30,150);
  translate(21,100);
  fill(240,0,92); //magenta balloon
  balloon();
  popMatrix();
  pushMatrix();
  line(0,0, -30,150);
  translate(-24,120);
  fill(0,23,255);
  balloon(); //blue balloon
  popMatrix();
  pushMatrix();
  line(0,0, -40,150);
  translate(-29,105);
  fill(255,21,0); //red balloon
  balloon();
  popMatrix();
  popMatrix();
  noStroke();
  fill(222,0,0);
  rect(290,270, 20,160); //belly strap

}

void neck(){
    beginShape();
  vertex(0,0);
  vertex(60,0);
  vertex(50, -200);
  vertex(10,-200);
  vertex(0,0);
  endShape();
  fill(98,61,0);
  ellipse(20,-70, 20,15);
  ellipse(36,-150, 25,10);
  ellipse(25,-130, 18,18);
  fill(255,208,36);
}

void balloon(){
  noStroke();
  ellipse(0,30, 40,60);
  triangle(0,1, -5,-5, 5,-5);
  stroke(0);
  strokeWeight(1);
}
