
PFont myFont;

void setup(){
 size(640,480);
 myFont = createFont("arial", 30);
 textFont (myFont); 
}

void draw(){
background(255);
//stroke(random(255), random(255), random(255), 255);
//strokeWeight(10);
//triangle(width/2,height/2,mouseX,height/2, width/2, mouseY);

arrow(width/2, height/2, mouseX, mouseY, color(200,0,200));
arrow(width/2, height/2, width/2, 50, color(0,200,200));
//arrow(mouseX, mouseY, width/2, 50, color(200,200,0));

textAlign(CENTER);
fill(0, 102, 153);
text("North", width/2, 25); 
PVector v1 = new PVector(0, width/2-50);
PVector v2 = new PVector((width/2)-mouseX, (height/2)-mouseY); 
float a = PVector.angleBetween(v1, v2);
if (mouseX < width/2)
text(-degrees(a)+360 + " degrees", width/2, height/4*3); 
else
text(degrees(a) + " degrees", width/2, height/4*3);  // Prints "10.304827");
text("(Clockwise from North)", width/2, height*.85);
fill(200, 0, 200);
text("Your direction", mouseX-50, mouseY+50);  // Prints "10.304827");

}

void arrow(int x1, int y1, int x2, int y2, color c) {
  smooth();
  stroke (c);
  strokeWeight(3);
  line(x1, y1, x2, y2);
  pushMatrix();
  translate(x2, y2);
  float a = atan2(x1-x2, y2-y1);
  rotate(a);
  line(0, 0, -10, -10);
  line(0, 0, 10, -10);
  popMatrix();
} 

void arrow(int x1, int y1, int x2, int y2) {
  line(x1, y1, x2, y2);
  pushMatrix();
  translate(x2, y2);
  float a = atan2(x1-x2, y2-y1);
  rotate(a);
  line(0, 0, -10, -10);
  line(0, 0, 10, -10);
  popMatrix();
} 


