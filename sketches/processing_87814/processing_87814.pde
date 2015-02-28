
void setup(){
size(500,500);
smooth();
background(25);
}

void draw() {
  for (int i=10; i< width; i=i+40) {
  for( int j=10; j< height ;j=j+40) { 

stroke(100);
strokeWeight(10);
beginShape(POINTS);
vertex(i, j); 
endShape();

stroke(255);
strokeWeight(2);
beginShape(POINTS);
vertex(i, j); 
endShape();

stroke(150);
strokeWeight(2);
beginShape(POINTS);
vertex(i-10, j); 
endShape();

stroke(255);
strokeWeight(1);
beginShape(POINTS);
vertex(i-10, j); 
endShape();

stroke(255);
strokeWeight(2);
beginShape(POINTS);
vertex(i+10, j); 
endShape();

stroke(255);
strokeWeight(1);
beginShape(POINTS);
vertex(i+20, j); 
endShape();

stroke(255);
strokeWeight(2);
beginShape(POINTS);
vertex(i, j+10); 
endShape();

stroke(255);
strokeWeight(2);
beginShape(POINTS);
vertex(i, j-10); 
endShape();

stroke(255);
strokeWeight(1);
beginShape(POINTS);
vertex(i, j+20); 
endShape();

stroke(255);
strokeWeight(4);
beginShape(POINTS);
vertex(i+20, j+20); 
endShape();


   }
  }
}


