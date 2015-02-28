
void setup() {
  size(600,600);
  smooth();
  noStroke();
}

void draw() {
  background(0);
  
  cup(50,50,0.5);
  cup(250,50,0.7);
  cup(100,250,0.3);
  cup(250,250,1);
}

void cup(int x, int y,float s) { 
  pushMatrix();
  translate(x,y);
  scale(s);

  fill(255,240,255); 
  ellipse(430,300,200,260);
  fill(0);
  ellipse(430,300,132,196);
  fill(255,240,255);
  rect(155,140,290,300);
  ellipse(300,140,290,90);
  ellipse(300,440,290,90);
  fill(130);
  ellipse(300,140,280,80);
  fill(85,30,0);
  ellipse(300,160,200,40);
  popMatrix();
} 


