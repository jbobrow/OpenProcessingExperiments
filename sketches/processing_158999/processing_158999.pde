
// lines.pde

int myCount;  // the variable myCount is of type integer (i.e. decimal number)
int myCount2;

void setup() {
  size(1000,1000);
  background(255);
  
  //myCount = 0;  // initialize the myCount variable with a value of 0 
  // by default JAVA set the initial values to 0.
}

void draw() {
  stroke(0);
  strokeWeight(1);
  
  // here we are drawing a new line every 4th pixel until we reach the right side of the canvas
  if (myCount < width/4){ //determining how may lines I draw
  myCount = myCount + 1;
  line(myCount*2, height, myCount*2, (width-myCount*2));
  }
  // draw lines horizontally
  if (myCount2 < height/4){
    myCount2 = myCount2 + 1;
    line (0, myCount2*4, width-myCount2*4, myCount*4);
  }
}


