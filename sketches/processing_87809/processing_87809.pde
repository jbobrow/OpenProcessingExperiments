
void setup(){
size(500,500);
smooth();
background(100);
}

void draw() {
  for (int i=10; i< width; i=i+10) {
  for( int j=10; j< height ;j=j+10) { 

stroke(0);
strokeWeight(8);
beginShape(POINTS);
vertex(i, j); 
endShape();


noFill();
stroke(255);
strokeWeight(6);
beginShape(POINTS);
vertex(i, j); 
endShape();

stroke(100);
strokeWeight(2);
beginShape(POINTS);
vertex(i, j); 
endShape();

}

  }
}


