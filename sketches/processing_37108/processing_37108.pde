

void setup(){
size(400,600);
background(255,255,255);
smooth();
frameRate(100);
}

void draw(){
   if (mousePressed == true) {

  fill(random(0,255),random(0,255),random(0,255),150);
  noStroke();
  ellipse(mouseX,mouseY,20,20);
   }
  
}

