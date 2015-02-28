
void setup(){
  size(600,750);
  background(125,122,154);
  smooth();
  noLoop();
}
void draw(){
  
  
  
  //dreieck rot rechts mitte
  
  noStroke();
  fill(113,53,60);
  triangle(490,595,555,555,568,588);
  
  //halbmonde mitte rechts

fill(186,174,95);
noStroke();
beginShape();
vertex(564, 428);
bezierVertex( 564, 471, 484, 470, 484, 429);
bezierVertex( 468, 479, 570, 497, 564, 428);
endShape();

beginShape();
vertex(561, 482);
bezierVertex( 564, 525, 484, 525, 484, 483);
bezierVertex( 468, 533, 570, 551, 562, 482);
endShape();
  
    //hintergrund unten Gebilde 
  
    fill(106,135,139);
    noStroke();
  
  beginShape();
  vertex(485,387);
  vertex(355,503);
  vertex(355,503);
  vertex(355,523);
  vertex(250,660);
  vertex(500,520);
  endShape();
  
  //kreis
  
  fill(166,177,179);
  ellipse(385,545,49,49);
  
  //bögen unten rechts 
  
    fill(106,135,139);
    noStroke();
    beginShape();
    vertex(485,387);
    bezierVertex(390,330,310,430,355,503);
    endShape();
  
  fill(138,152,164);
  noStroke();
  beginShape();
  vertex(485,387);
  bezierVertex(390,330,310,430,355,503);
  vertex(375,503);
  bezierVertex(330,415,430,360,485,387);
  endShape();
 
  fill(138,152,164);
  beginShape();
  vertex(355,503);
  bezierVertex(340,503,335,523,355,523);
  endShape();
  
   //bogen unten
   
     //nächstesbogen
  
   fill(106,135,139);
     noStroke();
  beginShape();
 vertex(244,680);
  bezierVertex(230,580,290,520,355,523);
  endShape();
   fill(138,152,164);
  
  beginShape();
  vertex(244,680);
  bezierVertex(230,580,290,520,355,523);
  vertex(388,545);
  bezierVertex(300,540,250,580,244,680);
  endShape();
  
  //innerebogen mitte
    
  beginShape();
  vertex(355,503);
  bezierVertex(410,503,335,503,388,545);
  bezierVertex(320,503,350,503,355,503);
  endShape();
  

 //208
 
   fill(106,135,139);
     noStroke();
  beginShape();
 vertex(250,660);
  bezierVertex(400,730,500,650,500,520);
  endShape();
  
  fill(209,203,179);
  
  beginShape();
  vertex(250,660);
  bezierVertex(400,730,500,650,500,520);
  vertex(500,520);
  bezierVertex(525,670,370,750,245,678);
  endShape();

//rechteck mitte unten mitte

  fill(117,72,41,150);
  rect(325,455,55,55);




//Kreise

noStroke(); 
fill(42,67,89);
ellipse(210,210,250,250);
fill(0,232,255,70);
stroke(0,117,149,70);
ellipse(51,416,28,28);
fill(0,185,159,80);
stroke(0,90,77);
ellipse(128,462,53,53);
noStroke();
fill(216,196,74);
ellipse(162,573,25,25);
fill(217,196,73,100);
stroke(124,129,0);
ellipse(137,509,60,60);
fill(42,54,175);
noStroke();
ellipse(90,484,33,33);
fill(16,214,144,60);
stroke(12,121,82,80);
ellipse(116,488,56,56);
noStroke();
fill(0,245,157,80);
ellipse(161,471,40,40);
fill(6,149,79,75);
stroke(4,94,32,75);
ellipse(220,460,20,20);
noStroke();
fill(227,147,140,70);
ellipse(84,548,30,30);
fill(55,77,137);
ellipse(103,614,20,20);



//farbstrichcode

fill(38,41,46);
rect(220,615,12,38);
fill(159,158,163);
rect(232,615,12,38);
fill(89,118,126);
rect(242,615,12,38);
fill(86,106,130);
rect(254,615,12,38);
fill(91,50,58);
rect(266,615,12,38);
fill(162,168,167);
rect(278,615,12,38);
fill(89,99,66);
rect(290,615,12,38);
fill(92,118,137);
rect(302,615,12,38);
fill(184,178,92);
rect(314,615,12,38);
fill(103,69,63);
rect(326,615,12,38);

//linien

stroke(0);
strokeWeight(2);
line(65,40,392,281);
line(42,66,388,285);
line(28,97,386,289);
line(385,293,17,125);
line(291,43,26,346);
line(294,45,51,368);
line(298,48,78,390);
line(302,50,109,401);


//dreiecke
noStroke();
fill(169,143,164);
triangle(445,323,494,242,548,323);

fill(176,170,181);
triangle(465,289,499,154,525,288);
fill(118,127,147,150);
stroke(130,125,142);
strokeWeight(1);
triangle(465,289,494,242,526,288);
noStroke();

fill(145,116,141);
beginShape();
vertex(483,215);
vertex(511,216);
vertex(510,266);
vertex(494,244);
vertex(483,259);
endShape(CLOSE);

fill(88,99,128);
beginShape();
vertex(483,289);
vertex(483,261);
vertex(494,246);
vertex(509,265);
vertex(509,288);
endShape();

fill(73,63,100);
beginShape();
vertex(508,323);
vertex(484,323);
vertex(483,289);
vertex(509,289);
endShape();

fill(33,38,42);
triangle(484,323,508,323,485,725);

//großes Dreieck 

fill(190,190,190,200);
triangle(430,430,523,665,340,665);

//object oben mitte 


fill(44,70,92);
beginShape();
vertex(349, 100);
bezierVertex( 341, 40, 440, 40, 434, 100);
bezierVertex( 425, 57, 355, 57, 349, 100);
endShape();

fill(30,40,60);
beginShape();
vertex(349, 137);
bezierVertex( 355, 83, 427, 83, 434, 137);
bezierVertex( 425, 90, 355, 90, 349, 137);
endShape();

fill(65,105,99);
beginShape();
vertex(390, 34);
vertex(360, 153);
vertex(391, 81);
vertex(422, 149);
endShape(CLOSE);

//dreieckgelb

fill(206,186,64,200);
triangle(437,494,470,436,505,494);

//rechtecke unten oben mitte

fill(71,110,119);
rect(161,705,30,27);

fill(53,67,110);
rect(161,732,30,3);
fill(204,193,95);
rect(533,58,20,20);
fill(156,65,88);
rect(410,337,165,8);
rect(415,356,154,9);
fill(106,89,59);
beginShape();
vertex(408,430);
vertex(590,360);
vertex(593,367);
vertex(410,437);
endShape();

}




