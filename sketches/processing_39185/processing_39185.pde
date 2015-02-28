
/*Joseph Kotay.  Practice Computational Methods. Professor Nick Senseke. Function with Abstract Pattern.
 This code used simple shapes, nested in a loop, to create a basic pattern using a function with 2 arguments. I used
 the houseNested code as a reference, and then experiemented with different variables and interactive fill options.
 */

void setup() {
  size(500,500);
  background(255);
  smooth();
  frameRate(5);
}

// I declared fixed variables for my shapes.

int rectSize=80;
int ellipseSize=50;

//the nested loop that regulates the overall pattern of my composition.

void draw() {
  for(int w=0; w<=width; w+= width/5) {
    for(int h=0; h<height; h+=(height/3)) {
      myPattern(w, h);

      if(frameCount==150) { 
        noLoop();
      }
    }
  }
}


//function with two arguments that repeat my form throughout the sketch window.

void myPattern(float x, float y) {
  pushMatrix();
  translate(x,y);

  noStroke();
  fill(RGB,random(50,200), mouseY); //this makes the fill change from light blue to green as the mouse is moved from top to bottom.
  rect(-80, 0, rectSize,3*(rectSize));
  ellipse(-80, 80, ellipseSize, ellipseSize);
  fill(255);
  ellipse(-30, 80, 4*(ellipseSize/5), 4*(ellipseSize/5));
  popMatrix();
}




