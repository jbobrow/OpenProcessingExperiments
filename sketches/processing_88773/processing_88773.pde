
// conditions

//println(3<5); //asking question, print out true/flase, is 3 less than 5?
//boolean question = false; 
//prinln(!question); //"not operation"


//shortcut: and &&
//shortcut: or ||

//boolean question = false; 

//println( (3<5) && (3>1) ); //is 3 less than 5 and larger than 1?


void setup () {
  size (600, 600);
  smooth();
}

void draw() {
  background(255);
  noStroke();

  rect(150, 250, 70, 70);
  if (mouseX < width/2) {
    fill(0, 207, 242);
    if (mousePressed == true) {
    rect(100, 200, 170, 170);
    }
  }

  ellipse(375, 285, 70, 70);
  if (mouseX > width/2) {
    fill(88, 237, 51);
    if (mousePressed == true) {
    ellipse(375, 285, 170, 170);
  }
}
}



