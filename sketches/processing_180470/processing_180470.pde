
int counter;

void setup() {  //setup function called initially, only once
  size(255, 255);
  fill(255,90,0,255);
  }

void draw() {  //draw function loops 

if (mousePressed == true){
  background(0,255,0);
  fill(255,90,0);
  ellipse(width/2,height/2,80,80);
  
  noStroke();
  fill(mouseX,mouseY,0);
  ellipse(mouseX,mouseY,20,20);
}

}

