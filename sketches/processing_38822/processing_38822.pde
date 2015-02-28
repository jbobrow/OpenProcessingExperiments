
  //extablish global variables 
void setup() {

  size(500, 500); 
  //  background(97, 3, 252); //will Grey call as erase
  smooth();
  noStroke();
  //stroke(3);// use to make cool fill around shapes
}

void draw() {


  if (mousePressed) {
    makeGull(mouseX, mouseY);
  }


  if (keyPressed) {
    switch(key) {
    case ' ':
      background(200);
      break;
    }
    //if(key == ' '){
    // background (200);
  }
}


void makeGull ( int w, int h) {  // int numColumns, int numRows ) { //UNEXPECTED TOKEN: VOID CAUSEING HUGE HALT IN PROGRESS due to bracket carelessness

  //( int numColumns=10, int numRows=10, int w=width/numColumns, int h=height/numRows ) {
  //    int numColumns=10; //change with keys
  //    int numRows=10;    // "      "    "
  //    int w=width/numColumns;
  //    int h=height/numRows;

  //    for (int i=0; i< numColumns; i++) { //makes colums of gulls
  //      for (int j=0; j<numRows; j++) {  //makes rows of gulls
  //head     
  fill(255);
  ellipse((0.3)*50 + w, (0.3)*50 + h, 15, 15); //.3 is 15 divided by the initial grid width/height
  // point((0.24)*w +i*w, 0.26*h + j*h);
  //eye
  fill(0);
  ellipse(0.3*50 +w, 0.26*50 +h, 3, 3); //change eye size
  //change eye color

  //body
  fill(255); //change color
  arc(0.66*50 +w, 0.3*50 + h, 33, 33, 0, PI);

  //bottom beak
  fill(232, 122, 37); //orange
  // rotate(PI/3.0); //dismembers gulls and scatters parts written below this line
  arc(0.04*50 +w, 0.22*50 +h, 10, 2, 0, PI);
  //top beak
  arc(0.02*50 +w, 0.22*50 +h, 11, 2, radians(50), radians(220));

  //first leg
  //stroke(232,122,37);
  rect(0.7*50 +w, 0.66*50 +h, 1, 9);
  //second leg
  rect (0.62*50 +w, 0.66*50 +h, 1, 9);
  //give wings

  // point(0.7*w +i*w, 0.66*h +j*h);// 0.7*w +i*w, 0.84*h +j*h);
}
                                        
