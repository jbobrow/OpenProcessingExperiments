
void setup (){
  size(500,300);
  frameRate(24);
}

void draw(){
  background(#3FFAF8);
   fill(100,mouseX,27);
beginShape();
vertex(350, 200);
vertex(85, 20);
vertex(85, 75);
vertex(30, 75);
endShape(CLOSE);

ellipse(450, 230, 75, 175);
endShape(CLOSE);
}


