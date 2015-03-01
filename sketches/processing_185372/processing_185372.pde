


void drawaclogo(int x, int y)
{
  //basis
smooth(); 
strokeWeight(12.0);
stroke(255, 255, 255, 30);
strokeCap(ROUND);
ellipseMode(RADIUS);
ellipse(x, y, 80, 80);
fill(0); 
ellipse(x, y, 79, 79);
//middle
fill(255,255,255); 
strokeWeight(2);
beginShape();
vertex(x+60,y);
bezierVertex(x+50, y+20, x+50, y+20, x+60, y+30);
bezierVertex(x, y+20, x, y+20, x-60, y+30);
bezierVertex(x-55, y+20, x-55, y+20, x-60, y);
bezierVertex(x, y+20, x, y+20, x+60, y);
endShape();
endShape();
ellipse(x, y+30, 50, 30);
triangle(x, y-70, x+50, y+30, x-50, y+30);
fill(0);
noStroke();
triangle(x, y-60, x+44, y+30, x-44, y+30);
ellipse(x, y+30, 41.5, 32);
//structure
stroke(255, 255, 255); 
strokeWeight(10); 
line (x, y-70, x+44, y+30);
//bottom
beginShape();
strokeWeight(2);
fill(255,255,255); 
vertex(x-60, y+35);
bezierVertex(x-55, y+60, x-15, y+80, x, y+60);
bezierVertex(x+15, y+80, x+55, y+60, x+60, y+35);
bezierVertex(x+40, y+87, x-40, y+87, x-60, y+35);
endShape();

}

void setup()
{
size (600,400); 
background(0);
drawaclogo(300,200);
drawaclogo(450,200);
drawaclogo(150,200);

}




