
//Code by Saarah Saghir, YSDN 1006, based on code by Sarah Johnson
//variables
    float rot = 50;//rot is rotation
    float rad = 100;//rad is radius
    float speed = .002;//the speed of the lines moving
    float circleSize = 9;//size of the ellipse at the end of the line
    float a=10;
  
  
void setup() {
  size(300,300);  //size of window/sketch
  background(255); //white background
  smooth();  //anti-aliasing
 frameRate(400); //very fast speed of animation
};
  
void draw()  {
  a+=3;            //add intervals of 3, if a<0, reset a to 255
  if (a<0) {
    a=255;
  }
  translate(100,100); //translate center to this point
  rotate(rot);  //amt of rotation
      stroke(200-a,0,255-a,random(40)); //color and opacity of stroke
      strokeWeight(2);
          line(0,0,rad+a,0);  //rotating line
  fill(255,255,255,30);
      rect(rad-(random(50)),0,random(100),circleSize); //rect at end of line
  rot = rot + speed;
   
  translate(100,0); //translate center again, this makes it rotate on top of the other line
  rotate(rot);
      stroke(255-a,100,100-a,random(50));
      strokeWeight(2);
          line(0,0,rad-50+a,0);
  fill(30,100,255,50);
      rect(rad+(random(30)),random(10),random(100),circleSize);
  rot = rot + speed;
}
