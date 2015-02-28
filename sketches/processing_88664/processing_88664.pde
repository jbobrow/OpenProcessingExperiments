
void setup() {
  size(640, 480);
  smooth();
  background(190);
  
  stroke(#97BA52);
  fill(#bbe32b); 

  beginShape();
  vertex(143, 295);
  vertex(117, 41);
  vertex(143, 295);
  vertex(299, 11);
  vertex(320, 11);
  vertex(503, 41);
  vertex(478, 295);
  vertex(320, 251);
  vertex(320, 246);
  vertex(305, 246);
  vertex(305, 251);
  vertex(148, 295);
  vertex(143, 295);
  endShape(CLOSE);

  fill(#a1e314);
  beginShape();
  vertex(143, 295);
  vertex(117, 41);
  vertex(299, 11);
  vertex(305, 251);
  endShape();
  

  
  stroke(#97BA52);
  line(320,11,320,246);

  fill(255);
  beginShape();
  vertex(154,283);
  vertex(129,43);
  vertex(253,26);
  vertex(296,23);
  vertex(296,246);
  endShape(CLOSE);
  
  fill(#e4e4e4);
  beginShape();
  vertex(253,26);
  vertex(294,18);
  vertex(294,23);
  endShape(CLOSE);
  
  fill(#bbe32b); 
  beginShape();
  vertex(141,263);
  vertex(150,265);
  vertex(170,259);
  vertex(182,259);
  vertex(182,267);
  vertex(171,270);
  vertex(150,280);
  vertex(143,278);
  endShape(CLOSE);
  
  beginShape();
  vertex(127,58);
  vertex(141,59);
  vertex(147,56);
  vertex(158,56);
  vertex(167,58);
  vertex(167,64);
  vertex(154,64);
  vertex(142,70);
  vertex(129,72);
  endShape(CLOSE);
  
  fill(255);
  //ellipse(222, 153, 125, 125);
  ellipse(400, 150, 130, 130);
  
  

  /*
  line(117,41,143,295);
   line(117,41,299,11);
   line(299,11,320,11);
   line(320,11,503,41);
   line(503,41,478,295);
   line(478,295,320,251);
   line(320,251,320,246);
   line(320,246,305,246);
   line(305,246,305,251);
   line(305,251,148,295);
   line(148,295,143,295);
   */

  stroke(126); 
  //noStroke();

  //rect(200,200,50,50);
}



void draw() {
  
}



