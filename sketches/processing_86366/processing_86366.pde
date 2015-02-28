
void setup() {
  size(500,500);
  smooth();
  background(150,255,250);

//boy
fill(245,205,205);
  beginShape();
  vertex(207,216);
  vertex(207,153);
  vertex(288,153);
  vertex(297,171);
  vertex(297,189);
  vertex(306,180);
  vertex(315,189);
  vertex(315,216);
  vertex(207,216);
  endShape();


//hair
  beginShape();
  strokeWeight(2);
  fill(0,0,0);
  vertex(207,162);
  vertex(189,144);
  vertex(198,144);
  vertex(198,126);
  vertex(207,135);
  vertex(225,117);
  vertex(234,126);
  vertex(243,117);
  vertex(252,135);
  vertex(270,117);
  vertex(279,126);
  vertex(288,117);
  vertex(297,135);
  vertex(306,135);
  vertex(306,144);
  vertex(324,135);
  vertex(324,162);
  vertex(323,180);
  vertex(342,180);
  vertex(324,198);
  vertex(333,207);
  vertex(324,216);
  vertex(315,216);
  vertex(315,189);
  vertex(306,180);
  vertex(297,189);
  vertex(297,171);
  vertex(288,153);
  vertex(207,153);
  vertex(207,162);
  endShape();

//eyes
  fill(255);
  ellipse(221,184,45,45);
  ellipse(261,185,45,45);
  fill(0,125,100);
  ellipse(256,189,18,19);
  ellipse(216,189,18,19);
  
//nose
  beginShape();
  fill(245,205,205);
  vertex(243,207);
  vertex(234,207);
  vertex(234,198);
  vertex(243,198);
  endShape();


//topOfWall 
  beginShape();
  fill(100);
  vertex(0,216);
  vertex(500,215);
  vertex(500,270);
  vertex(0,270);
  vertex(0,216);
  endShape();
  
  line(0,253,500,252);
  
  line(54,216,18,252);
  line(18,252,18,270);
  
  line(144,216,108,252);
  line(108,252,108,270);
  
  line(234,216,198,252);
  line(198,252,198,270);
  
  line(324,216,288,252);
  line(288,252,288,270);
  
  line(414,216,378,252);
  line(378,252,378,270);
  
  line(495,216,477,252);
  line(477,252,477,270);

//bricksOnDeck
  fill(150);
  rect(0,270.658,500,229.342);
  fill(255,0,0);
  rect(54,297,108,36);
  rect(171,297,108,36);
  rect(288,297,108,36);
  rect(405,297,108,36);
  rect(522,297,108,36);
  rect(-9,342,108,36);
  rect(108,342,108,36);
  rect(225,342,108,36);
  rect(342,342,108,36);
  rect(459,342,108,36);
  rect(63.15,387.46,108,36);
  rect(180,387,108,36);
  rect(297,387,108,36);
  rect(414,387,108,36);
  rect(531,387,108,36);
  rect(9,432,108,36);
  rect(126,432,108,36);
  rect(243,432,108,36);
  rect(360,432,108,36);
  rect(477,432,108,36);
  rect(63,477,108,36);
  rect(180,477,108,36);
  rect(297,477,108,36);
  rect(414,477,108,36);
  rect(531,477,108,36);
  rect(-54,477,108,36);
  rect(-63,297,108,36);
  rect(-54,387.46,108,36);
}


