
//woohun joo
  
  size(640,360);
  background(255);   
  smooth();
  
  //shoe1-1
  strokeWeight(1);
  strokeCap(SQUARE);
  stroke(117, 137, 50);
  line(282, 296, 288, 296);
  line(292, 292, 288, 296);

  //shoe2-1
  strokeWeight(1);
  strokeCap(SQUARE);
  stroke(117, 137, 50);
  line(320, 296, 326, 296);
  line(317, 292, 320, 296);
  
  //top
  noStroke();
  fill(219, 219, 219);
  beginShape();
  vertex(294.65, 82.5);
  vertex(300.67, 84.61);
  vertex(304.59, 80.92);
  vertex(308.4, 84.26);
  vertex(313.1, 81.8);
  vertex(308.85, 103.03);
  vertex(299.62, 103.06);
  endShape(CLOSE);
  
  //body
  stroke(219, 219, 219);
  strokeWeight(7);
  strokeJoin(ROUND);
  fill(117, 137, 50);
  rect(282, 105.25, 45, 135);
  
  //left eye
  fill(255);
  noStroke();
  ellipse(294.97, 127.02, 5, 5);
  //right eye
  fill(255);
  noStroke();
  ellipse(314.97, 127.02, 5, 5);
  
  //mouth
  noStroke();
  fill(255);
  beginShape();
  vertex(295, 135);
  vertex(300, 139);
  vertex(312, 139);
  vertex(317, 135);
  vertex(312, 144);
  vertex(299, 144);
  vertex(299, 144);
  endShape(CLOSE);
  
  //fill(117, 137, 50);
  fill(117, 137, 50);
  rect(301, 139, 2, 2);
  rect(304, 139, 2, 2);
  rect(307, 139, 2, 2);
  rect(310, 139, 2, 2);
  
  //arms1
  noStroke();
  fill(117, 137, 50);
  beginShape();
  vertex(286, 156);
  vertex(286, 164);
  vertex(237, 193);
  vertex(236, 190);
  vertex(239, 186);
  vertex(237, 185);
  vertex(238, 184);
  vertex(243, 186);
  endShape(CLOSE);
 
  //arms2
  noStroke();
  fill(117, 137, 50);
  beginShape();
  vertex(324, 158);
  vertex(367, 188);
  vertex(372, 186);
  vertex(373, 187);
  vertex(371, 188);
  vertex(374, 192);
  vertex(372, 195);
  vertex(324, 166);
  endShape(CLOSE);
  
  //legs1
  noStroke();
  fill(117, 137, 50);
  quad(289, 235, 297, 235, 292, 288, 288, 288);
  
  //leg2
  noStroke();
  fill(117, 137, 50);
  quad(313, 235, 321, 235, 321, 288, 317, 288);
  

  
  //shoe1
  noStroke();
  fill(219, 219, 219);
  beginShape();
  vertex(317, 288);
  vertex(321, 288);
  vertex(323, 291);
  vertex(327, 292);
  vertex(327, 296);
  vertex(321, 296);
  vertex(317, 293);
  endShape(CLOSE);
  
  //shoe2
  noStroke();
  fill(219, 219, 219);
  beginShape();
  vertex(288, 288);
  vertex(292, 288);
  vertex(292, 293);
  vertex(289, 296);
  vertex(282, 296);
  vertex(282, 292);
  vertex(286, 291);
  endShape(CLOSE);
