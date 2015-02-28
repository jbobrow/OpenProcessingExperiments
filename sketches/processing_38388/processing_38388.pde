
//INSTRUCTIONS
//draw a circle with center point at 100, 100 that is 100 in diameter.
//draw another circle with the same center point that is 150 in diameter.
//use varying lineweights and greyscale shades to draw the rest of the composition
//from the inner circle draw angled lines towards the edges of the canvas.  
//from the outer circle draw angled rectangles towards the edge of the canvas with 
//at least one corner touching the circle.  All the rectangles should be 50 wide but 
//varying in length.   

//the drawing becomes unique to the individual when the mouse is pressed- stopping
//the drawing loop.  

void setup() {

  size(300, 300);
  background(28, 86, 147);
  smooth();
}


void draw() {
  if (mousePressed) {
    noLoop();
  }

  stroke(255);
  strokeWeight(.5);
  noFill();
  ellipseMode(CENTER);
  ellipse(100, 100, 150, 150);
  ellipse(100, 100, 100, 100);
  translate(width/3, height/3);//change the origin of the sketch

  for (int x = height; x>=50; x-=10) { 
    for (int y=width; y>=80; y-=50) {//x and y spacing/pattern of the rectangles
      stroke(random(0, 255));
      strokeWeight(random(1, 8));//greyscale and line weights randomly assigned to 
      //consistantly placed rectangles
    }
    rotate(radians(100));

    //ellipse(50, 50, x, 30);
    fill(random(0, 255));
    rect(50, 50, x, 50);//the rectangles revolve around that new center point
    // at 100 radians
    stroke(random(0, 255));
    //strokeWeight(1);
    line(50, 20, x, 75);//these lines show up in front of some rectangles and behind 
    //others.  I dont know why.  if the line code is before rect, they show up behind 
    //all rects.  I like this way better- for composition purposes
  }
}


