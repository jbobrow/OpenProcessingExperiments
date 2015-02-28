
void setup() {
  size(400, 400);
  background(0);
}

//set counters to track rotation
int i = 1; //primary rotation
int j = 1; //rotation at the radius

void draw() {
  noFill();

  pushMatrix();
  stroke(250,13,211);
  translate(width/2, height/2);  //move the origin to the center
  rotate(radians(i));          //rotate from the center, convert degrees to radians
  translate(200, 100);             //set the radius
  rotate(radians(j + 45));     //rotate the ellipse about the next axis
  ellipse(0, 0, 100, 150);          //draw the ellipse
  popMatrix();

  pushMatrix();
  stroke(0,36,255);
  translate(width/2, height/2);
  rotate(radians(i));
  translate(100, 30);
  rotate(radians(j+45));
  rect(0, 0, 125, 50);
  popMatrix();
  
  pushMatrix();
  stroke(8,252,38);
  translate(width/2, height/2);
  rotate(radians(i));
  translate(30,0);
  rotate(radians(j+ 45));
  ellipse(0,0,50,50);
  popMatrix();

  //increment the rotation
  j+=20;
  i++;
}

