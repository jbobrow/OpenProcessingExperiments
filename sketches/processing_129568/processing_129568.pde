
//copyright Leslie Bloomfield lbloomfi 2014 homework #3

float x,y;
 
void setup() {
  size(400,400);
  background(255);
  rectMode(RADIUS);
  x = 100;
  y = 300;
}
 
void draw() {
  
//rectangle on click changes color and size based on X, Y

if (mousePressed == true) {
  pushMatrix();
  noStroke();
  fill(random(255), random(255), random(255));
  frameRate(40);
  translate(mouseX,mouseY);
  rotate(radians(frameCount));
  rect(0,0, mouseX/2, mouseY/2);
  popMatrix();
}

//center circle changes color on hover
  fill (22, 25, 144);
  if ((mouseX >= x && mouseX <= y) && (mouseY >= x && mouseY <= y)) {
     frameRate(10); 
     fill(random(0), random(0), random(255)); 
   }
 
  noStroke();
  ellipse (height/2, width/2, 200, 200);


}


 
 




