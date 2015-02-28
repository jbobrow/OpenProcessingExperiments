
/* 
  10th May 2013, Minh Pham, 3416941
  
  A pair of eyes which follows the cursor and winks on mouse-click
*/

int wink = 100;
 
void setup() {
  size(400, 600);
  background(#291000);
  smooth();
}

void draw() {
  ellipseMode(CENTER);
  rectMode(CENTER);
    
  // drawing the eyes
  fill(255);
  noStroke();
  ellipse(width/3, height/3, 60, 130);
  ellipse(width/1.5, height/3, 60, 130);
  
  // mapping to set a range on how far the pupils move
  float xEyeLeft = map(mouseX, 0, width, 123, 143);
  float yEyeLeft = map(mouseY, 0, height, 155, 245);
  float xEyeRight = map(mouseX, 0, width, 256, 276);
  float yEyeRight = map(mouseY, 0, height, 155, 245);
 
  // drawing the eye pupils
  fill(0);
  noStroke();
  ellipse(xEyeLeft, yEyeLeft, 30, 30);
  ellipse(xEyeRight, yEyeRight, 30, 30);
  
  // drawing the mouth
  fill(255);
  noStroke();
  ellipse(width/2, 400, 200, 100);
  
//  this part took a bit of adjusting to make the rectangle look apart
//  of the mouth so it may not be accurate to the correct pixel
  fill(255);
  noStroke();
  rect(width/2, 370, 200, 50);
  
  // winking
//  using a rectangle that increases in height to create illusion of wink
  fill(#291000);
  noStroke();
  rect(width/3, 0 , 200, wink);
  
  // winking action
  if ((mousePressed == true) && (wink<300)) {
    wink += 400;
  } else if (wink>300) {
    wink -= 400;
  }
}
