
void setup(){
 size(700,200);
 background(0);
}

void draw(){
  
  fill(255,255,0);
beginShape();
vertex(100,15);
vertex(130,65);
vertex(195,80);
vertex(150,125);
vertex(160,185);
vertex(100,160);
vertex(45,185);
vertex(55,125);
vertex(10,80);
vertex(70,65);
endShape(CLOSE);

//eyes
fill(0);
ellipse(80,93,10,mouseY/5);
ellipse(120,93,10,mouseY/5);
fill(255);
ellipse(80,86,7,mouseY/10);
ellipse(120,86,7,mouseY/10);

fill(mouseX,0,mouseY*2);
stroke(0);
strokeWeight(1);
 rect(mouseX,mouseY,mouseX,2);
 
}

void mousePressed(){
 background(0);
}

