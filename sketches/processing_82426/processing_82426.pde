
void setup() {
size(170,180);
background(211,241,255);
}

void draw() {
  
//ground
fill(140,255,145);
rectMode(CORNERS);
rect(-10,165,180,180);
//ears
fill(245,238,183);
arc(40,100,20,20,90*PI/180,270*PI/180);
arc(130,100,20,20,270*PI/180,450*PI/180);
//hair
beginShape();
fill(139,90,0);
vertex(40, 70); // first point
bezierVertex(30, 70, 20, 60, 20, 50);
bezierVertex(10, 50, 10, 30, 20, 30);
bezierVertex(20, 10, 60, 10, 60, 20);
bezierVertex(60, 10, 80, 10, 80, 20);
bezierVertex(80, 10, 90, 10, 90, 20);
bezierVertex(90, 10, 110, 10, 110, 20);
bezierVertex(110, 10, 150, 10, 150, 30);
bezierVertex(160, 30, 160, 50, 150, 50);
bezierVertex(160, 50, 140, 70, 130, 70);
endShape();
//head
fill(245,238,183);
rectMode(CORNERS);
rect(40,40,130,140);
//mouth
fill(255,255,255);
rectMode(CORNERS);
rect(60,110,110,130);
//teeth
line(60,120,110,120);
line(70,110,70,130);
line(80,110,80,130);
line(90,110,90,130);
line(100,110,100,130);
//eye outer
fill(#ffffff);
ellipse(70,80,20,20); 
ellipse(100,80,20,20); 
//eye inner
fill(#000000);
ellipse(70,80,5,5); 
ellipse(100,80,5,5);
//body
fill(255,111,111);
rectMode(CORNERS);
rect(80,140,90,160);
//arms
line(80,150,70,150);
line(90,150,100,150);
//left leg
line(80,160,80,170);
line(80,170,75,170);
//right leg
line(90,160,90,170);
line(90,170,95,170);

}



