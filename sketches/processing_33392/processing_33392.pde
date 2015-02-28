
void setup() {

  size(500,500);
  noFill();
  smooth();
}

void draw() {
  background(255);

  for(int i=0; i<width+5;i+=25) {
    for(int j=0; j<height+5; j+=25) {
      fill(255,0,255,50);
      ellipse(i,j,50,50);
    }
  }
  for(int m=0;m<width;m+=50) {
    for(int n=0; n<height+5; n+=50){
      fill(0,0,255,50);
      ellipse(m,n,25,25);
    }
  }
  for(int m=0;m<width;m+=150) {
    for(int n=0; n<height+50; n+=50){
      fill(255,255,255,25);
      ellipse(m,n,mouseX,mouseY);
    }
  }
}

//creating a for loop within another is useful in making continuous patterns
//the inside for loop with a j makes a column of circles/triangles
//the outside look with the i makes a row
//the inside loop makes a column of shapes till it hits height+5
//then it comes out of the loop, goes to the i loop
//which bumps up i by 25, so it moves over 25px to the right
//goes to the j loop and starts making a column of shapes at
//x coordinate 25px and y coordinate is constantly incrementing by 25


