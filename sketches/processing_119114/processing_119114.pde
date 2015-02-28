
/*
creating squares with circles and triangles in them
 */

// rotation angle
float angle= PI/3.0;
int move= 100;
 int help = 0;

void setup() {
  size(500, 500);
  background(255);
  // Decrease framerate for better visual outcome
  frameRate(10);
}

void draw() {
  // Increase randomness
  randomSeed(millis());
  //Moving zero-coordinate point
  translate(random(500),random(500));
  // rotate the rectangle
  rotate(angle);
  // Fill with random colours and random transparency
  fill(random(255), random(255), random(255),random(1000));
  // draw the rectangle
  rect(26, 26, 52, 52);
  //create the shapes in the rect
  help = int(random(255))%4;
  switch(help) {
    case 0:
      ellipse(26+52/2, 26+52/2, 52, 52);
      break;
    case 1:
      triangle(26,26+52,26+52/2,26,26+52,26+52);  
      break;
 //   case 2:
 //     
 //   case 3:
 //   
    default:
      break; 
   }

}



