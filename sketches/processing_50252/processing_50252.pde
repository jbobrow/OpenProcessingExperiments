
size(400, 400);
smooth();
noFill();


int x = -200;
int incrementation = (int) random(7,13);
strokeWeight(2);

background(0);
stroke(255);

float x1,y1,x2,y2,x3,y3;

x1 = random(-200,200);
y1 = random(-200,-10);
x2 = random(-200,200);
y2 = random(100,300);
x3 = random(-200,200);
y3 = random(height+10,height+200);

while ( x < width + 200 ) {
  pushMatrix();
  translate(x,0);

  beginShape();
  curveVertex(x1, y1);
  curveVertex(0.0, 0.0);
  curveVertex(x2,y2);
  curveVertex(0.0, 400.0);
  curveVertex(x3, y3);
  endShape();
  
  x = x + incrementation;
  popMatrix();
}
                
