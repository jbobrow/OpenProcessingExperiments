
void setup(){
  size(400,400);
  background(26,183,144);
}

void draw(){
  noFill();
  stroke(232,230,19);
  beginShape();
    vertex(283,313);
    bezierVertex(283,313, 311,325, 317,319);
    bezierVertex(323,313, 320,269, 323,251);
    bezierVertex(326,231, 354,194, 351,160);
    bezierVertex(349,137, 319,120, 292,95);
    bezierVertex(263,71, 241,45, 230,46);
    bezierVertex(202,51, 244,192, 234,195);
    bezierVertex(224,198, 190,127, 124,173);
    bezierVertex(64,215, 104,266, 103,298);
    bezierVertex(102,330, 46,355, 46,355);
  endShape();
}

