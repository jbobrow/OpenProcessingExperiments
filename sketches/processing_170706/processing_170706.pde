
int value = 255;
void setup(){
  size(400, 400);
}

void draw(){
  background(255);
  noStroke();
  fill (253,172,207);
  rect (100,100,200,200);
  rect (150,300,100,50);
  triangle (100,300,150,300,150,350);
  triangle (250,300,300,300,250,350);
  fill (value);
  ellipse (150,150,50,50);
  ellipse (250,150,50,50);
  fill (random(255),random(255),random(255));
  triangle (100,100,140,80,166,100);
  triangle (166,100,200,80,235,100);
  triangle (235,100,260,80,300,100);
  fill (0);
  ellipse (150,150,10,10);
  ellipse (250,150,10,10);
  ellipse (200,300,100,20);
  stroke (0);
  line (200,200, mouseY,250);
  line (mouseY,250,170,250);
  
}
void mousePressed() {
   value = (0) ;
}
void mouseReleased() {
  value = (255);
}


