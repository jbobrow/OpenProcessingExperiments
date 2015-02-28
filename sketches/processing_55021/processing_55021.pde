
//sets up the parameters that stay constant
void setup() {
  //smoothes the circles
  smooth();
  //size of the window
  size(400,400);
}
//float=decimal value, initial position of y and integer i
float y =0.0;
float i=0.0;
void draw() {
  //background color
  background(#F269AE);
  //no stroke around the circles
  noStroke();
  //circle position and size
      ellipse (i+10,100,80,80);
      //fill color
      fill(#29B99B);
      //if y value is greater than 300, y value is 0
    if (y>300){
    y=0;
  }
   
   //if integer i is greater than 300, i is 0, in all other cases i moves at a rate of +30
  if (i>300){
    i=0;
  }else{
    i+=30;
  }
    //smaller circle's position and size
     ellipse (i+20,300,40,40);
     //fill color
      fill(#29B99B);
      //if y position is greater than 300, y is 0
    if (y>300){
    y=0;
  }
  //if integer i is greater than 300, i is 0, in all other cases i moves at a rate of +100
  if (i>300){
    i=0;
  }else{
    i+=100;
  }
 
}

