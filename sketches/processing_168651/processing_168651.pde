
void setup(){
  size(500, 500);
}
void draw(){
  println(mouseX +"'"+ mouseY);
  background(0,0,255);
  //ULLS i esfera de la cara
  strokeWeight(1);  // Default
  fill (255,222,173);
  ellipse(250,250,250,250);
  ellipse(200,210, 35,35);
  ellipse(300,210,35,35);
  fill (255,255,240);
  ellipse(300,210,35,15);
  ellipse(200,210, 35,15);
  fill(152,251,152);
  ellipse(300,210,15,15);
  ellipse(200,210,15,15);
  point(200,210);
  point(300,210);
  ///Cabell
  strokeWeight(3);  // Default
  fill (0,0,0);
  beginShape () ;
  vertex(317,105);
  vertex(296,112);
  vertex(270,99);
  vertex(241,113);
  vertex(215,105);
  vertex(195,124);
  vertex(173,116);
  vertex(163,145);
  vertex(158,164);
  vertex(178,148);
  vertex(199,160);
  vertex(229,148);
  vertex(241,158);
  vertex(268,144);
  vertex(287,156);
  vertex(304,145);
  vertex(324,157);
  vertex(351,175);
  endShape(CLOSE);
  //celles
  strokeWeight(1);  // Default
  fill(0,0,0);
  triangle(187,170,177,186,220,198);
  triangle(307,170,317,186,274,198);
  //BOCA
  strokeWeight(1);  // Default
  fill(255,255,255);
  ellipse(247,307,60,40);
  line(217,306,276,306);
  line(223,295,223,319);
  line(231,291,231,324);
  line(239,288,239,325);
  line(247,287,247,326);
  line(256,287,256,325);
  line(264,291,264,323);
  line(272,295,272,318);
  
  //Orelles
  strokeWeight(1);  // Default
  fill (255,222,173);
  beginShape () ;
  vertex(366,207);
  vertex(384,186);
  vertex(385,237);
  vertex(375,252);
  endShape();
   beginShape () ;
  vertex(134,207);
  vertex(116,186);
  vertex(117,237);
  vertex(126,252);
  endShape();
  line(126,210,126,235);
  line(376,213,376,238);
  //NAS
  strokeWeight(1);  // Default
  beginShape () ;
  vertex(264,222);
  vertex(264,246);
  vertex(278,253);
  vertex(264,262);
  vertex(244,262);
  vertex(230,253);
  vertex(244,246);
  vertex(244,222);
  endShape();
  //perilla
  fill (0,0,0);
  beginShape () ;
  vertex(237,373);
  vertex(237,354);
  vertex(263,354);
  vertex(263,373);
  vertex(247,375);
  vertex(237,373);
  vertex(262,373);
  vertex(252,374);
  vertex(248,374);
  endShape();
  
  
  
  
  
  
}


