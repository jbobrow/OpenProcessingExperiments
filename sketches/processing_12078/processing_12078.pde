
void setup(){
  size(400,400);
  background(93,255,228,50);
  
  fill(52,50,245,95);
  smooth();
  noStroke();
  ellipse(400,0,400,400);
  
  fill(52,50,245,95);
  smooth();
  noStroke();
  ellipse(400,0,500,500);
  
  fill(52,50,245,95);
  smooth();
  noStroke();
  ellipse(400,0,600,600);
  
  fill(226,232,61,95);
  smooth();
  noStroke();
  ellipse(0,400,400,400);
  
  fill(226,232,61,95);
  smooth();
  noStroke();
  ellipse(0,400,500,500);
  
  fill(226,232,61,95);
  smooth();
  noStroke();
  ellipse(0,400,600,600);
  
  fill(255,185,80);
  smooth();
  strokeWeight(4);
  stroke(255,80,70);
  
  beginShape();
  vertex(372,194); //1
  vertex(367,182); //2
  vertex(342,169); //3
  vertex(331,150); //4
  vertex(309,146); //5
  vertex(293,164); //6 begin tri 1
  vertex(274,127); //7
  vertex(255,153); //8 begin tri 2
  vertex(233,113); //9
  vertex(212,144); //10 begin tri 3
  vertex(190,94); //11
  vertex(162,151);//12 begin tri 4
  vertex(133,114);//13
  vertex(117,159);//14 begin tri 5
  vertex(81,144);//15
  vertex(70,192);//16 begin tail
  vertex(35,223);//17
  vertex(16,255);//18
  vertex(23,279);//19
  vertex(45,304);//20
  vertex(60,309);//21
  vertex(67,290);//22
  vertex(55,270);//23
  vertex(72,246);//24
  vertex(100,247);//25 end tail
  vertex(107,274);//26 begin backfoot
  vertex(101,288);//27
  vertex(123,303);//28
  vertex(143,298);//29
  vertex(134,278);//30 end backfoot
  vertex(163,273);//31
  vertex(216,282);//32
  vertex(283,280);//33 begin frontfoot
  vertex(278,298);//34
  vertex(293,310);//35
  vertex(315,303);//36
  vertex(306,287);//37 end frontfoot
  vertex(339,223);//38
  vertex(346,203);//39
  vertex(368,205);//40
  vertex(357,195);//41
  vertex(372,194);//42
  endShape();
  
  beginShape(); //triangle 1
  fill(65,255,136);
  noStroke();
  vertex(293,164);
  vertex(275,128);
  vertex(256,154);
  endShape();
  
  beginShape(); //triangle 2
  fill(226,232,61);
  noStroke();
  vertex(255,153);
  vertex(234,114);
  vertex(213,144);
  endShape();
  
  beginShape(); //triangle 3
  fill(52,50,245);
  noStroke();
  vertex(212,144);
  vertex(191,95);
  vertex(163,151);
  endShape();
  
  beginShape(); //triangle 4
  fill(54,255,185);
  noStroke();
  vertex(162,151);
  vertex(134,115);
  vertex(118,160);
  endShape();
  
  beginShape(); //triangle 5
  fill(165,26,136);
  noStroke();
  vertex(116,160);
  vertex(81,145);
  vertex(71,192);
  endShape();
  
  beginShape(); //triangle 5a
  fill(165,26,136,75);
  noStroke();
  vertex(116,160);
  vertex(216,282);
  vertex(71,192);
  endShape();
  
  beginShape(); //triangle 4a
  fill(54,255,185,75);
  noStroke();
  vertex(162,151);
  vertex(216,282);
  vertex(118,160);
  endShape();
  
  beginShape(); //triangle 3a
  fill(52,50,245,75);
  noStroke();
  vertex(212,144);
  vertex(216,282);
  vertex(163,151);
  endShape();
  
  beginShape(); //triangle2a
  fill(226,232,61,85);
  noStroke();
  vertex(255,153);
  vertex(216,282);
  vertex(213,144);
  endShape();
  
  beginShape(); //triangle 1a
  fill(65,255,136,75);
  noStroke();
  vertex(293,164);
  vertex(216,282);
  vertex(256,154);
  endShape();
  
fill(82,80,245);
ellipse(322,166,8,10);

  
}

