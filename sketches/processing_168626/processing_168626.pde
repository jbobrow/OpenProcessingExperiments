
void setup () {
   size(600,600);
   background(0,0,0);
   
 }
void draw(){
  println(mouseX+","+mouseY);//mouse
  
  fill(87,35,100);
  stroke(83,35,100);
  arc(300, 250, 350, 300, PI, 2*PI, OPEN);//front
  
  noFill();  
  beginShape();
  curveVertex(126,250);
  curveVertex(151,370);
  endShape();
  
  fill(87,35,100);
  stroke(87,35,100);
  beginShape();//Lluna
  vertex(502, 20);
  bezierVertex(520, 25, 100, 0, 470, 75);
  fill(87,35,100);
  
  beginShape();//Cara
    vertex(125, 250);
    vertex(125, 373);
    vertex(216, 471);
    vertex(375, 471);
    vertex(475, 373);
    vertex(475, 250);
    endShape(CLOSE);
  endShape();
  
  fill(255,255,255);
  stroke(0,0,0);
  strokeWeight(1.5);
  beginShape(TRIANGLE_STRIP);//dents
    vertex(203, 360);
    vertex(231, 408);
    vertex(250, 360);
    vertex(278, 408);
    vertex(296, 360);
    vertex(314, 408);
    vertex(342, 360);
    vertex(360, 408);
    vertex(388, 360);
  endShape();
    
  fill(255,255,0);
  stroke(255,0,0);
  strokeWeight(1);
  ellipse(228,236,75,75);//ulls
  ellipse(365,236,75,75);//ulls
  fill(0,0,0);
  noStroke();
  ellipse(228,236,25,25);//pupil·les
  ellipse(365,236,25,25);
  
  noFill();
  stroke(0,0,0);
  strokeWeight(1);
    curve(400,400,250,315,300,303,350,400);//nas
    curve(400,400,300,303,350,315,350,400);
    
  fill(0,0,0);
  noStroke();
    ellipse(272,311,4,4);//forats del nas
    ellipse(319,311,4,4);
  
  noFill();
  stroke(0,0,0);
  strokeWeight(5);  
  line(205,161,275,229);//celles
  line(390,161,320,229);
  
  noFill();
  stroke(255,0,0);
  strokeWeight(2.5);
  line(360,408,355,420);//sang boca
  line(355,420,360,438);
  line(360,438,355,450);
  line(230,408,225,420);
  line(225,420,230,438);
  line(230,438,225,450);
  
  fill(87,35,100);
  stroke(87,35,100);
  beginShape();//Banya dreta
  curveVertex(383,116);
  curveVertex(383,116);
  curveVertex(403,100);
  curveVertex(406,81);
  curveVertex(400,50);
  curveVertex(448,103);
  curveVertex(446,162);
  curveVertex(383,116);
  endShape();
  
  beginShape();//Banya esquerra
  curveVertex(218,116);
  curveVertex(218,116);
  curveVertex(192,106);
  curveVertex(184,92);
  curveVertex(177,61);
  curveVertex(173,50);
  curveVertex(141,100);
  curveVertex(154,164);
  curveVertex(154,164);
  endShape();
  
  noFill();
  stroke(0,0,0);
  strokeWeight(1.5);
  line(414,334,444,267);//cicatriu
  line(404,311,434,326);
  line(414,294,441,304);
  line(424,274,450,283);
  
  fill(87,35,100);
  stroke(0,0,0);
  strokeWeight(1.5);
  line(218,113,296,132);//linia de la front
  line(296,132,383,113);
  
  fill(87,35,100);
  stroke(87,35,100);
  beginShape();//orella dreta
  curveVertex(476,238);
  curveVertex(476,238);
  curveVertex(546,162);
  curveVertex(476,316);
  curveVertex(476,316);
  endShape();
  
  beginShape();//orella esquerra
  curveVertex(125,238);
  curveVertex(125,238);
  curveVertex(42,162);
  curveVertex(125,316);
  curveVertex(125,316);
  endShape();
  
  stroke(0,0,0); 
  strokeWeight(1); 
  beginShape();//part orella interna
  curveVertex(489,234);
  curveVertex(489,234);
  curveVertex(502,218);
  curveVertex(530,186);
  curveVertex(511,228);
  curveVertex(489,271);
  curveVertex(489,271);
  endShape();
  
  beginShape();
  curveVertex(114,234);
  curveVertex(114,234);
  curveVertex(94,217);
  curveVertex(62,187);
  curveVertex(82,228);
  curveVertex(106,271);
  curveVertex(106,271);
  endShape();
  
  fill(255,0,0);
  ellipse(480,295,10,10);
  ellipse(120,295,10,10);
  


}


