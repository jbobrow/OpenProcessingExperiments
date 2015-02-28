

//Homework #1
//Elizabeth Ibarra
//used openprocessing.org

void setup(){
  size(600,600);
  background(255,255,255);
  
  //mountains
  smooth();
  fill(55,55,55);
  noStroke();
  beginShape();
  vertex(0,353);
  vertex(43,346);
  vertex(110,348);
  vertex(136,361);
  vertex(146,353);
  vertex(191,372);
  vertex(228,384);
  vertex(285,384);
  vertex(312,379);
  vertex(532,374);
  vertex(600,368);
  vertex(600,398);
  vertex(0,403);
  vertex(0,353);
  endShape();
  
  //ocean
  fill(0);
  noStroke();
  beginShape();
  vertex(0,403);
  vertex(600,398);
  vertex(600,600);
  vertex(0,600);
  endShape();
  
  //top Pillar
fill(135,35,32);
noStroke();
beginShape();
vertex(85,123);
vertex(89,130);
vertex(128,130);
vertex(132,123);
vertex(132,246); //rail 
vertex(129,275);
vertex(96,275);
vertex(96,304);
vertex(85,319);
endShape();
  
  //bottom of bridge
  fill(60,23,23);
  noStroke();
  beginShape();
  vertex(318,0);
  vertex(527,0);
  vertex(100,349);
  vertex(69,349);
  vertex(318,0);
  endShape();
  
  //bottomstand
  fill(69,15,15);
  noStroke();
  beginShape();
  vertex(88,317);
  vertex(136,317);
  vertex(136,390);
  vertex(126,390);
  vertex(126,327);
  vertex(97,327);
  vertex(97,390);
  vertex(88,390);
  vertex(88,317);
  endShape();
  
  //railing of bridge
  fill(195,35,32 );
  noStroke();
  beginShape();
  vertex(69,347);
  vertex(69,349);
  vertex(318,0);
  vertex(279,0);
  endShape();  

//bottom x
stroke(69,15,15);
strokeWeight(8);
line(131,325,93,370);
strokeWeight(8);
line(95,326,131,366);

//

noStroke();
fill(255,255,255);
quad(93,144,124,144,124,167,93,167);

noStroke();
fill(255,255,255);
quad(93,182,124,182,125,205,93,205);

noStroke();
fill(255,255,255);
quad(93,223,124,223,124,250,93,250);

fill(114,103,81);
  strokeWeight(10);
  beginShape();
  vertex(86,387);
  vertex(98,387);
  vertex(98,400);
  vertex(104,403);
  vertex(107,409);
  vertex(75,410 );
  vertex(75,404 );
  vertex(83,403 );
  vertex(86,387);
  endShape();
  
  fill(114,103,81);
  strokeWeight(10);
  beginShape();
  vertex(126,387);
  vertex(135,387);
  vertex(138,403);
  vertex(145,404);
  vertex(145,410);
  vertex(115,410);
  vertex(115,404 );
  vertex(123,403 );
  vertex(126,387);
  endShape();;

noFill();
strokeWeight(4);
stroke(195,35,32);
bezier(84, 123, 108, 173, 169, 122,257,0);

noFill();
strokeWeight(4);
stroke(195,35,32);
bezier(132, 123, 132, 137 , 147,157 ,188,146);

noFill();
strokeWeight(4);
stroke(195,35,32);
bezier(84, 123, 84, 246 , 76, 347,64,347);

stroke(195,35,32);
line(92,135,92,310);
line(105,142,105,292);
line(118,143,118,275);
line(130,140,130,250);
line(144,129,144,225);
line(159,118,159,200);
line(170,106,170,186);
line(182,94,182,166);
line(194,80,194,146);
line(207,66,207,118);
line(223,45,223,97);
line(239,23,239,76);
line(257,0,257,39 );
strokeWeight(2);
line(80,274,80,332);



}

//add your own fog :)
void draw (){
  noStroke();
  fill(255,255,255,10);
  ellipse(mouseX,mouseY,90,60);
}



