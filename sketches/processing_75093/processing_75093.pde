
void setup()
{
  //background(0);
  size(331,290);
  smooth();
  noFill();
  frameRate(5);//entre parentesis el numero de veces que lo quiero ver por segundo
}
void draw()
{
  beginShape();
     background(0);
        strokeWeight(3);
            stroke(random(0,255),random(0,255),random(0,255));//aleatorio el color
vertex(0,330);
fill(250,190,0);
bezierVertex(-30,256,20,253,32,255);
bezierVertex(52,264,59,257,69,253);
bezierVertex(70,255,82,253,93,252);
bezierVertex(101,251,116,251,126,251);
bezierVertex(131,252,135,252,140,254);
bezierVertex(140,254,150,255,160,256);
bezierVertex(167,255,170,255,183,256);
bezierVertex(190,256,197,255,210,252);
bezierVertex(221,250,225,247,229,242);
bezierVertex(237,237,242,228,245,226);
bezierVertex(250,222,255,217,262,207);
bezierVertex(266,210,273,190,280,188);
bezierVertex(285,177,292,170,300,166);
bezierVertex(306,163,310,160,318,163);
bezierVertex(321,164,325,166,330,168);
vertex(330,330);

endShape(CLOSE);
}

