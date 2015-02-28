
// Armando Rocha V.

int w1=1,y1=1;
float z=1.5;
 void setup()
 {
size(1000,450);
smooth();
 frameRate(6);
 }
  void draw()
  {
    smooth();
  background(255-w1,255-y1,255-y1);
  w1+=5;
  y1+=2;
beginShape();
 fill(212-w1,200-y1,242-y1);
 stroke(random(0,255),random(0,255),random(0,255));
 vertex(0, 250);
bezierVertex(0,250,30,220,75,220);
bezierVertex(90,200,100,185,127,198);
bezierVertex(127,198,150,190,150,190);
bezierVertex(150,190,175,190,175,198);
bezierVertex(171,200,190,200,205,195);
bezierVertex(278,230,325,240,330,238);
bezierVertex(390,245,450,225,452,238);
bezierVertex(452,240,520,245,520,248);
bezierVertex(730,260,600,260,700,248);
bezierVertex(700,248,780,200,785,195); 
bezierVertex(785,190,850,230,930,255);
bezierVertex(940,250,950,250,1000,280);
vertex(1000,450);
vertex(0,450);
endShape();
   fill(255,255-y1,0);
  ellipse(450+w1,220-z,25,25);
z+=1.8;
  }
