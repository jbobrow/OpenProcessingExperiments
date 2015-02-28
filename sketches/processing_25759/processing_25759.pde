
void setup(){
  size(600,400);
  background(30);
  smooth();
}

void draw(){
  stroke(0,0);
  strokeWeight(0);
  fill(random(mouseY/width,mouseY*600/width),10);
  float sizeKreis=random(mouseX/2,mouseX/1.1);
  float xKreis=width/2-mouseX/4+random((mouseX/10), (mouseX/2.5));
  float yKreis=height/2-mouseX/4+random((mouseX/10), (mouseX/2.5));
  
  ellipse(xKreis,yKreis,sizeKreis,sizeKreis);
}

