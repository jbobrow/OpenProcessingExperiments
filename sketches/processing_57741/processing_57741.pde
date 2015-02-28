
//PS3_QUESTION 4_ KESHIA.K
void setup() {
  size(400, 500);
  fill(255);
  stroke(2);
  smooth();
  noFill();
 
}

void draw() {
   background(200);
  strokeWeight(2);
  
   
  
 for(int y= 0; y< height; y+=48) {
  for(int x=0; x<width; x+=48) {
    
    ellipse(x, y, 55,55);
    fill(mouseX,mouseY, 0,45);
    
  }
 }


  
  translate(-115,-55);
   int[] X = {50, 61, 83, 69, 71, 50, 29, 31, 17, 39};
  int[] Y = {18, 37, 43, 60, 82, 73, 82, 60, 43 , 37};
smooth();
strokeWeight(2);
beginShape();
fill(mouseX, mouseY,0, 10);
for (int i = 0; i < X.length; i++) {
vertex(X[i]* TWO_PI, Y[i]* TWO_PI);
}
endShape(CLOSE);

 int radius = 440;
 int spacing= 40;

 while (radius > 0) {
   int c = int( map(radius, 400, 20, 0, 64) );
   noFill();
   
   ellipse(312, 335, radius*2, radius*2);
   radius= radius- spacing;
}
}




