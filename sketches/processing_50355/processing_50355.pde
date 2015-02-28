





float x1,y1,x2,y2,x3,y3;
int incrementation =  5;
void setup() {

size(400, 400);
smooth();
noFill();

x1 = random(-200,200);
y1 = random(-200,-10);
x2 = random(-200,200);
y2 = random(100,300);
x3 = random(-200,200);
y3 = random(height+10,height+200);

} 

void draw() {

float nx1,ny1,nx2,ny2,nx3,ny3;

nx1 = x1 + cos(frameCount*0.01)*30;
ny1 = y1 + sin(frameCount*0.01)*30;
nx2 = x2 + cos(frameCount*0.01)*60;
ny2 = y2 + sin(frameCount*0.01+0.5)*60;
nx3 = x3 + cos(frameCount*0.01)*30;
ny3 = y3 + sin(frameCount*0.01)*30;

background(0);
stroke(255);
strokeWeight(2);


int x = -200;
while ( x < width + 200 ) {
  pushMatrix();
  translate(x,0);

  beginShape();
  curveVertex(nx1, ny1);
  curveVertex(0.0, 0.0);
  curveVertex(nx2,ny2);
  curveVertex(0.0, 400.0);
  curveVertex(nx3, ny3);
  endShape();
  
  x = x + incrementation;
  popMatrix();
}



}

void mousePressed() {
x1 = random(-200,200);
y1 = random(-200,-10);
x2 = random(-200,200);
y2 = random(100,300);
x3 = random(-200,200);
y3 = random(height+10,height+200);
incrementation = (int) random(5,20);
}
                                
