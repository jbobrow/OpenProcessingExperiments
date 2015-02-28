
void setup() {

  size(500,500);
  noFill();
  smooth();
}

void draw() {
  background(0);

  for(int i=0; i<width+250;i+=35) {
    for(int j=0; j<height+250; j+=35) {
      
//Color makers, if else if else if else***

      if ((mouseX<width/2)&&(mouseY<height/2)){
        stroke(255,0,0);
      }
      else if ((mouseX>width/2)&&(mouseY<height/2)){
        stroke(0,255,0);
      }
      else if ((mouseX<width/2)&&(mouseY>height/2)){
        stroke(255,255,0);
      }
      else{
        stroke(0,0,255);
      }
   
      beginShape();
        vertex(i,mouseY);
        bezierVertex(130,100,130,100,mouseX,j);
        bezierVertex(500,500,0,0,i,mouseY);
        bezierVertex(500,500,0,0,mouseX,j);
      endShape(CLOSE);
//      triangle(i,j+20,i+10,j,i+20,j+20);
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


