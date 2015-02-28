
void setup() {
  size(600, 600);
}
void draw() {
  round( map(mouseX,1,600,100,500));
  round( map(mouseY,1,600,100,500));
  
    fill(random(1,255),random(1,255),random(1,255));
  ellipse(mouseX, mouseY,40, 40);
  fill(random(1,255),random(1,255),random(1,255));
  ellipse(mouseY, mouseX,40, 40);
  fill(random(1,255),random(1,255),random(1,255));
  ellipse(height-mouseY, width-mouseX,40, 40);
  fill(random(1,255),random(1,255),random(1,255));
  ellipse(width-mouseX,height-mouseY,40, 40);
  fill(random(1,255),random(1,255),random(1,255));
  ellipse(height-mouseY, mouseX,40, 40);
  fill(random(1,255),random(1,255),random(1,255));
  ellipse(mouseX,height-mouseY,40, 40);
  fill(random(1,255),random(1,255),random(1,255));
  ellipse(mouseY, width-mouseX,40, 40);
  fill(random(1,255),random(1,255),random(1,255));
  ellipse(width-mouseX,mouseY,40, 40);
  
  stroke(random(1,255),random(1,255),random(1,255));
  ellipse(mouseX, mouseY,30, 30);
   stroke(random(1,255),random(1,255),random(1,255));
  ellipse(mouseY, mouseX,30, 30);
  stroke(random(1,255),random(1,255),random(1,255));
  ellipse(height-mouseY, width-mouseX,30, 30);
  stroke(random(1,255),random(1,255),random(1,255));
  ellipse(width-mouseX,height-mouseY,30, 30);
  stroke(random(1,255),random(1,255),random(1,255));
  ellipse(height-mouseY, mouseX,30, 30);
  stroke(random(1,255),random(1,255),random(1,255));
  ellipse(mouseX,height-mouseY,30, 30);
  stroke(random(1,255),random(1,255),random(1,255));
  ellipse(mouseY, width-mouseX,30, 30);
  stroke(random(1,255),random(1,255),random(1,255));
  ellipse(width-mouseX,mouseY,30, 30);
  
  fill(random(1,255),random(1,255),random(1,255));
  ellipse(mouseX, mouseY,20, 20);
  fill(random(1,255),random(1,255),random(1,255));
  ellipse(mouseY, mouseX,20, 20);
  fill(random(1,255),random(1,255),random(1,255));
  ellipse(height-mouseY, width-mouseX,20, 20);
  fill(random(1,255),random(1,255),random(1,255));
  ellipse(width-mouseX,height-mouseY,20, 20);
  fill(random(1,255),random(1,255),random(1,255));
  ellipse(height-mouseY, mouseX,20, 20);
  fill(random(1,255),random(1,255),random(1,255));
  ellipse(mouseX,height-mouseY,20, 20);
  fill(random(1,255),random(1,255),random(1,255));
  ellipse(mouseY, width-mouseX,20, 20);
  fill(random(1,255),random(1,255),random(1,255));
  ellipse(width-mouseX,mouseY,20, 20);
  
   fill(255,255,255);
  ellipse(mouseX, mouseY,10, 10);
  fill(0,0,0);
  ellipse(mouseY, mouseX,10, 10);
  fill(0,0,0);
  ellipse(height-mouseY, width-mouseX,10, 10);
  fill(255,255,255);
  ellipse(width-mouseX,height-mouseY,10, 10);
  fill(255,255,255);
  ellipse(height-mouseY, mouseX,10, 10);
  fill(0,0,0);
  ellipse(mouseX,height-mouseY,10, 10);
  fill(255,255,255);
  ellipse(mouseY, width-mouseX,10, 10);
  fill(0,0,0);
  ellipse(width-mouseX,mouseY,10, 10);
}

