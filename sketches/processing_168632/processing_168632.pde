
void setup (){
  size(600, 700);
}
void draw(){
  fill(253, 223, 122);
  ellipse(300, 350, 425, 525);
  //ull esquerre
  fill(255, 250, 250);
  ellipse(375, 265, 100, 75); 
  fill(139, 69, 19);
  ellipse(375, 265, 50, 75);
  fill(0);
  ellipse(375, 265, 30, 45);
  //ull dret
  fill(255, 250, 250);
  ellipse(213, 265, 100, 75); 
  fill(139, 69, 19);
  ellipse(213, 265, 50, 75);
  fill(0);
  ellipse(213, 265, 30, 45);
  //cabell
  beginShape();
  vertex(422,134);
  vertex(372,207);
  vertex(326,176);
  vertex(290,208);
  vertex(240,183);
  vertex(200,206);
  vertex(168,145);
  vertex(289,11);
  endShape(CLOSE);
  //nas
  line(303, 341, 262, 392);
  line(262, 392, 276, 414);
  line(276, 414, 302, 413);
  //cella dreta
  beginShape();
  vertex(311, 256);
  vertex(414, 221);
  vertex(395, 200);
  endShape(CLOSE); 
  //cella esquerre
  beginShape();
  vertex(279, 253);
  vertex(168, 225);
  vertex(181, 199);
  endShape(CLOSE);
  //boca
  beginShape();
  fill(255);
  vertex(336,475);
  vertex(221,533);
  vertex(334, 533);
  endShape(CLOSE);
  line(235, 527, 235, 532);
  line(248, 520, 248, 532);
  line(261, 513, 261, 532);
  line(274, 506, 274, 532);
  line(287, 499, 287, 532);
  line(300, 494, 300, 532);
  line(313, 487, 313, 532);
  //line(335, 516, 248, 520);
  line(324, 533, 325, 481);
  //line(287, 499, 335, 497);
  
  //orella dreta
  beginShape();
  fill(253, 223, 122);
  vertex(485,293);
  vertex(534,234);
  vertex(561,335);
  vertex(532,377);
  vertex(496,364);
  endShape(CLOSE);
  line(502,294, 528, 259);
  line(528, 259, 550, 330);
  line(550, 330, 529, 366);
  //orella esquerre
  beginShape();
  fill(253, 223, 122);
  vertex(122,301);
  vertex(58,244);
  vertex(32,362);
  vertex(67,393);
  vertex(107,362);
  endShape(CLOSE);
  line(102, 303, 65, 268);
  line(65, 268, 47, 354);
  line(47, 354, 69, 375);
  
}


