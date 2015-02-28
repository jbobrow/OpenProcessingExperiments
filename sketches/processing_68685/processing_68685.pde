

void setup()
{
  size(482,232);
  noLoop();
}

void draw()
{
  background(176,196,222);
  fill(255);
  strokeWeight(0);
  beginShape();
    vertex(102,94);
    vertex(179,83);
    vertex(247,71);
    vertex(412,87);
    vertex(411,101);
    vertex(364,133);
    vertex(241,146);
    vertex(102,94);
  endShape();
  strokeWeight(3);
  beginShape();  
    vertex(232,70);
    vertex(339,2);
    vertex(367,3);
    vertex(354,63);
    vertex(416,21);
    vertex(430,26);
    vertex(426,82);
    vertex(346,84);
  endShape();
  bezier(245,72,313,73,331,71,353,62);
  bezier(247,73,219,70,187,78,177,86);
  beginShape();  
    vertex(243,147);
    vertex(340,229);
    vertex(373,226);
    vertex(359,152);
    vertex(267,143);
    vertex(272,139);
    vertex(362,136);
    vertex(429,89);
    vertex(446,91);
    vertex(428,148);
    vertex(449,151);
    vertex(478,194);
    vertex(465,201);
    vertex(384,150);
    vertex(355,148);
  endShape();

  beginShape();
    vertex(425,78);
    vertex(455,42);
    vertex(443,37);
    vertex(428,44);
  endShape();
  
  beginShape();
    vertex(442,104);
    vertex(449,108);
    vertex(438,129);
    vertex(433,129);
  endShape();
  
  line(352,96,403,104);
  line(329,123,386,117);
  line(390,82,394,100);
  
  beginShape();
    vertex(391,87);
    vertex(414,87);
    vertex(422,93);
    vertex(411,98);
    vertex(411,87);
  endShape();
  
  beginShape();
    vertex(244,147);
    vertex(217,149);
    vertex(198,139);
    vertex(111,125);
    vertex(58,124);
    vertex(33,118);
    vertex(1,117);
    vertex(33,115);
    vertex(100,96);
  endShape();
  
  bezier(177,85,147,85,120,85,99,96);
  bezier(177,85,191,94,185,101,146,105);
  bezier(100,95,107,99,117,105,146,105);
  
  line(79,100,78,123);
  line(87,101,86,122);
  line(189,111,364,106);
  line(197,87,344,99);
  line(295,100,255,99);
  line(255,99,254,91);
  
  beginShape();
    vertex(181,95);
    vertex(213,97);
    vertex(215,104);
    vertex(247,104);
    vertex(247,108);
    vertex(272,107);
    vertex(272,102);
  endShape();
  
  ellipse(290,156,22,15);
  
  beginShape();
    vertex(351,171);
    vertex(363,172);
    vertex(362,162);
    vertex(348,163);
    vertex(352,185);
    vertex(364,186);
  endShape();
  
  if(mousePressed)
  {
    println(mouseX+","+mouseY);
  }

}


