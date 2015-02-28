
/*****************************************
 * Assignment # 1
 * Name: Hao Wang
 * E-mail: hwang1@haverford.edu
 * Course:       CS 110 - Section # 2
 * Submitted:    1/26/2012
 * This sketch is my self-made cartoon character of 
 a transformational tiger.Each time when my program is lauched, the 
 backgound color and nose color are different. When mouse is pressed, 
 its eyes will blink because its mouth is closed by a bandage. After mouse
 is released, the cartoon character will return to a normal
 state with the "outlining color" being white.
 Functions used in this sketch
 line(), rect(), ellipse(),arc(),curve(),random()
 mouseReleased(), mousePressed(), smooth(),quad(),stroke(),fill(),
 bezier(), beginShape/endShape,color...etc.
 ***********************************************/ 





void setup () {
background (random(0,255),random(0,255),random(0,255));
smooth();
size (600,800);
strokeWeight (10.0);
ellipseMode(CENTER);
rectMode(CORNER);
//General set up.
  
  noFill();
  arc( 303,316, 450, 400,2.576,6.766);
  //Upper Part of the head
  
  fill(0);
  ellipse (202, 320, 40,40);
  fill(0);
  ellipse (408, 320, 40,40);
  //eyes
  
 noFill();
 bezier(88,254,56,146,97,109,183,146);
 bezier(518,254,  550 , 146  , 509  , 109  , 423  , 146)  ;
 //ears
 
  stroke(216,123,22,250);
  strokeJoin(ROUND);
  line(275,146,331 ,146);
  line(287,166,319 ,166);
  line(303,146,303,186);
  line(275,186,331 ,186);
  color(25,27,118,100);
  //The Chinese label on head 
  
  strokeWeight(6.0); 
  strokeJoin(ROUND); 
  beginShape(); 
  stroke(60,139,107);
  vertex(224, 145); 
  vertex (259,177);
  vertex(234,207);
  endShape();
  
  beginShape(); 
  vertex(382, 145); 
  vertex (347,177);
  vertex(372,207);
  endShape();
  //Signs on head
  
 stroke(185,138, 17);
  rectMode(CENTER);
  rect(202, 320,130,80);
  rect(408, 320,130,80);
 //Two rectangle part of the glasses
 
  strokeWeight(4);
  stroke(185,138, 17);
  line (136,311,86,254);
  line (  475  ,311, 520  ,254);
  //The connection between glasses and ears
  
  beginShape();
  curveVertex (281,370);
  curveVertex (285,342);
  curveVertex (321,342);
  curveVertex(325,370);
  endShape();
  //The glasses holder on nose.
  
  smooth();
  beginShape();
  strokeWeight(2);
  vertex(269,301);
  vertex (295,340);
  vertex (303,309);
  vertex(311,340);
  vertex(338,301);
  endShape();
  //Connection between two rectangular pieces of the glasses.
  
  fill(121,82,40);
  stroke(92,164,191,100);
  strokeWeight(2);
  quad(114,155,97,176,120,182,130,158);
  quad(  492  ,155, 509  ,176,  486 ,182, 476  ,158);
  //Earing Signs
  
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(303,385,40,60);
  //nose

noFill();
strokeWeight (10.0);
stroke (0,0,0,200);
arc(303,390,86,120,0.801,2.374);
arc (303, 385,386,234,0.406,2.704);
}
  // mouth and chin
  
 void draw() {
   }
//To support mousePressed and Realeased function.
   


//When press the mouse, color of
//background and the shape of "eyes" will change to red.

void mousePressed() {
background(255,0,0);
 strokeWeight (10.0);
 stroke(0);
 noFill();
  arc( 303,316, 450, 400,2.576,6.766);
  //head
  
  strokeWeight(4.0);
  beginShape();
  vertex(172,299);
  vertex (235,323);
  vertex (172,347);
  endShape ();
  strokeWeight(4);
  line ( 370 ,323,453,323);
  //eyes
 
 noFill();
 bezier(88,254,56,146,97,109,183,146);
 bezier(518,254,  550 , 146  , 509  , 109  , 423  , 146)  ;
 //ears
 
 stroke(185,138, 17);
  rectMode(CENTER);
  rect(202, 320,130,80);
  rect(408, 320,130,80);
  strokeWeight(4);
  stroke(185,138, 17);
  line (136,311,86,254);
  line (  475  ,311, 520  ,254);
  
  beginShape();
  curveVertex (281,370);
  curveVertex (285,342);
  curveVertex (321,342);
  curveVertex(325,370);
  endShape();
  
  smooth();
  beginShape();
  strokeWeight(2);
  vertex(269,301);
  vertex (295,340);
  vertex (303,309);
  vertex(311,340);
  vertex(338,301);
  endShape();
//glasses
  
  smooth();
  stroke(216,123,22,250);
  strokeJoin(ROUND);
  line(275,146,331  ,146);
  line(287,166,319  ,166);
  line(303,146,303,186);
  line(275,186,331  ,186);
  color(25,27,118,100);
  //The Chinese label on head 
  
  strokeWeight(6.0); 
  strokeJoin(ROUND); 
  beginShape(); 
  stroke(60,139,107);
  vertex(224, 145); 
  vertex (259,177);
  vertex(234,207);
  endShape();
  
  beginShape(); 
  vertex(382, 145); 
  vertex (347,177);
  vertex(372,207);
  endShape();
  //Signs on head
  
  fill(121,82,40);
  stroke(92,164,191,100);
  strokeWeight(2);
  quad(114,155,97,176,120,182,130,158);
  quad(  492  ,155, 509  ,176,  486 ,182, 476  ,158);
  //earing signs
  
  noFill();
  strokeWeight (10.0);
stroke (0);
  arc (303, 385,386,234,0.406,2.704);
  //chin
  
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(303,385,40,60);
  //nose
 
  strokeWeight (10.0);
  stroke(37,162,206);
  line(259,427,348,481);
  line(347,427,258,481);
  //mouth (a Cross warning Sign)
  
}

//When mouse is released, the picture will change to its original
//shape with slight changes on the "stroking color".
void mouseReleased(){
background(random(0,255),random(0,255),random(0,255));
noFill();
  strokeWeight(10.0);
  stroke(255);
  arc( 303,316, 450, 400,2.576,6.766);
  //head
  
  fill(0,0,0);
  ellipse (202, 320, 40,40);
  fill(0,0,0);
  ellipse (408, 320, 40,40);
  //eyes
  
 noFill();
 strokeWeight (4.0);
 bezier(88,254,56,146,97,109,183,146);
 bezier(518,254,  550 , 146  , 509  , 109  , 423  , 146)  ;
 //ears
  
  smooth();
  stroke(216,123,22,250);
  strokeJoin(ROUND);
  line(275,146,331  ,146);
  line(287,166,319  ,166);
  line(303,146,303,186);
  line(275,186,331  ,186);
  color(25,27,118,100);
  //The Chinese label on head 
  
  strokeWeight(6.0); 
  strokeJoin(ROUND); 
  beginShape(); 
  stroke(60,139,107);
  vertex(224, 145); 
  vertex (259,177);
  vertex(234,207);
  endShape();
  
  beginShape(); 
  vertex(382, 145); 
  vertex (347,177);
  vertex(372,207);
  endShape();
  //Signs on head
  
 stroke(14,88,137);
  rectMode(CENTER);
  rect(202, 320,130,80);
  rect(408, 320,130,80);
  strokeWeight(4);
  stroke(35,75,108);
  line (136,311,86,254);
  line (  475  ,311, 520  ,254);
  
  beginShape();
  curveVertex (281,370);
  curveVertex (285,342);
  curveVertex (321,342);
  curveVertex(325,370);
  endShape();
  
  smooth();
  beginShape();
  strokeWeight(2);
  vertex(269,301);
  vertex (295,340);
  vertex (303,309);
  vertex(311,340);
  vertex(338,301);
  endShape();
  //glasses
  
  
  fill(121,82,40);
  stroke(92,164,191,100);
  strokeWeight(2);
  
  quad(114,155,97,176,120,182,130,158);
  quad(  492  ,155, 509  ,176,  486 ,182, 476  ,158);
  //earing pairs
  
  noFill();
  strokeWeight (10.0);
stroke (255);
 arc(303,390,86,120,0.801,2.374);
  arc (303, 385,386,234,0.406,2.704);
  //mouth and chin
  
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(303,385,40,60);
  //nose
}


