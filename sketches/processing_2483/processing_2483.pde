
/*

cindy Ng
turquois sq
June 16, 2009
cindy.ng@cindysng.com
*/

void setup() {
  
  size(500,500);//set the size of the window
  background(255); //set the background color
  smooth();//turn on smoothing
  stroke(0,0,400,90);
  fill(0,255,400,90);
  
};

//This is the draw wrapper. Anything in herehappens once per frame.
void draw() {
  stroke(#123456);
  if(mousePressed) {
  line(20,50,mouseX,mouseY);
  rect(mouseX,mouseY,90,90);
  
}

}

