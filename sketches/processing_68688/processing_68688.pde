
//Hernandez Cruz Yanahui
//Torres Torres Felipe Andres

void setup()
{
  background(210,105,30);
  size(331,290);
  smooth();
  noFill();
  frameRate(5);//entre parentesis el numero de veces que lo quiero ver por segundo
  
}
void draw()
{
  stroke(random(0,255),random(0,255),random(0,255));//aleatorio el color


beginShape();
vertex(0,300);
fill(153,153,102);
bezierVertex(-30,170,2,279,50,225);
bezierVertex(50,225,59,200,100,205);
bezierVertex(100,205,118,205,130,210);
bezierVertex(130,203,140,245,180,203);
bezierVertex(180,203,200,165,226,185);
bezierVertex(226,185,230,220,306,210);

vertex(330,330);
endShape(CLOSE);
  
  beginShape();
vertex(0,300);
fill(51,51,0);
bezierVertex(-30,170,2,279,50,235);
bezierVertex(50,235,59,210,100,213);
bezierVertex(100,212,118,209,130,220);
bezierVertex(130,213,140,245,180,213);
bezierVertex(180,213,200,165,226,195);
bezierVertex(226,195,230,220,306,220);

vertex(330,330);
endShape(CLOSE);
fill(255,215,0);
line(174,160,215,174);
line(190,120,219,168);
line(219,125,227,173);
line(244,109,234,175);
line(270,145,230,180);
line(295,170,230,175);
line(230,170,320,210);
line(220,180,160,195);
line(230,180,280,225);
line(215,190,190,220);
line(225,200,208,245);
line(240,205,248,235);
ellipse(230,180,50,50);
fill(255,102,0);


beginShape();
  strokeWeight(1);
vertex(0,330);
fill(102,51,0);
bezierVertex(-30,240,20,263,32,255);
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
