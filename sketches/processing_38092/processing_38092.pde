
void setup() {
  size(300, 300);
  background(0, 0, 0);
}

int x = 1;//primary rotation
int y = 90;//rotatation at the radius

void draw() {
  noFill();
  //for the white ellipse
  stroke(140, 140, 140, 50);
  pushMatrix();
  translate(width/2, height/2); //starts in the center
  rotate(radians(x)); 
  translate(100, 0);//radius
  rotate(radians(y + 90));//rotates the ellipse
  ellipse(0, 0, 200, 50);//grey ellipse
  popMatrix();
  y+=6;//rotation 
  x++;//keeps it rotating
  //for the red line
  stroke(255, 0, 0, 70);
  pushMatrix();
  translate(width/2, height/2);//starts in the center
  rotate(radians(x));
  translate(100, 0);//radius
  rotate(radians(y + 30));//rotates the line 
  line(50, 50, 15, 15);//red line
  popMatrix();
}


