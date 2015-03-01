
//peloticas
float i = 0;

void setup(){
  size(800,300);
  background(255);
}

void draw(){
  fill(mouseX,mouseY,0,25);
  rect(0,0,width,height);
  ellipse(mouseX,mouseY,20,20);
  ellipse(height-mouseY,width-mouseX,20,20);
  ellipse(mouseY,mouseX,20,20);
  ellipse(width-mouseY,height-mouseX,20,20);
  ellipse(width-mouseX,height-mouseY,20,20);
  ellipse(height-mouseX,width-mouseY,20,20);
  i=i+0.05;
float posicionX = 100*sin(i);
float posicionY = 100*cos(i);
  ellipse(width/2+posicionX, height/2+posicionY, 20, 20);
  ellipse(width/2-posicionX, height/2-posicionY, 20, 20);
   
}
