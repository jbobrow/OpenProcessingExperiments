
//inspired by spirograph and xform stacking
void setup() {
  background(0);
  size(600, 600);
  stroke(30, 120, 250, 50);
}
int i = 0; //primary rotation
int x = 0;//x of center point
int w = 0;//width of rect
int h = 0;//height of rect
void draw() {
  pushMatrix();
  translate (width/2, height/2);  //move the origin to the center
  //rotate from center
  rotate(frameCount * radians(45) * 0.05);
 
  translate(x++, 0);//increase center point
  //rotate square 3* per 180 degrees
  rotate(radians(3*i++));
  noFill();
  rectMode(CENTER);
  strokeWeight(1);
  //draws size of rectangle as it rotates
  rect(0, 0, w++, h++);
  strokeWeight(w/20);
  point(0,0);
  popMatrix();

}


