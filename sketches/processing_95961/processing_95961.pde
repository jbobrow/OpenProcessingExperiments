
//Expressive Eyes
//Winky Blinky
//Matt Linklater

float x = 60;              // X-coordinate
float y = 200;             // Y-coordinate of eyes
float pupilRadius = 10;    // Pupil Radius
float eyeRadius = 40;      // Eye Radius
float easing = 0.05;       // Pupil lag

void setup(){
  size(500, 500);
  ellipseMode(RADIUS);
  smooth();
}

void draw(){
  
  background(0);
  
  // Eye positioning
  float leftEyeX = width / 2 - eyeRadius * 2;   // Left Eye X-coordinate
  float rightEyeX = width / 2 + eyeRadius * 2;  // Right Eye X-coordinate
  
  // Eyes lag to look natural
  int targetX = mouseX;
  x += (targetX - x) * easing;
  
  // Pupils to Follow
  float lmx = map(x, 0, width, leftEyeX - eyeRadius + pupilRadius*1.5, leftEyeX  + eyeRadius - pupilRadius*1.5);
  float rmx = map(x, 0, width, rightEyeX - eyeRadius + pupilRadius*1.5, rightEyeX  + eyeRadius - pupilRadius*1.5); 
  float my = map(mouseY, 0, height, y - eyeRadius*1.5 + pupilRadius*1.5 , y + eyeRadius*1.5 - pupilRadius*1.5);
  
  // Eyes
  stroke(0);
  fill(255);
  ellipse(leftEyeX, y, eyeRadius, eyeRadius*2);
  ellipse(rightEyeX, y, eyeRadius, eyeRadius*2);
  
  // Pupils
  fill(0);
  
  // Dilated Pupils
  float dLeft = dist(mouseX, mouseY, leftEyeX, y);
  float dRight = dist(mouseX, mouseY, rightEyeX, y);
  if (dLeft < eyeRadius || dRight < eyeRadius){
    pupilRadius = 20;
    easing = 1;
  } else {
    pupilRadius = 10;
    easing = 0.05;
  }
  
  // Winking  
  if (mousePressed){
    // Left Wink
    if (mouseButton == LEFT){
      line (leftEyeX - eyeRadius, y + 10, leftEyeX + eyeRadius, y + 10);
      ellipse(rmx, my, pupilRadius, pupilRadius);
    // Right Wink
    } else {
      line (rightEyeX - eyeRadius, y + 10, rightEyeX + eyeRadius, y + 10);
      ellipse(lmx, my, pupilRadius, pupilRadius);
    }
  } else {
    ellipse(lmx, my, pupilRadius, pupilRadius);
    ellipse(rmx, my, pupilRadius, pupilRadius);
  }
  
  // Mouth
  if (dLeft < eyeRadius || dRight < eyeRadius){
    fill(255);
  } else {
    fill(0);
  }
  float r = random(5);
  ellipse(width/2, height/1.3 - r, width/4, eyeRadius/1.5);
  line(0, height/1.3 - r, width, height/1.3 - r);
  
  // Teeth
  int a = 0;
  for (int c = 0; c < 20; c ++){
  line(width/2 - a, height/1.7, width/2 - a, height);
  line(width/2 + a, height/1.7, width/2 + a, height);
  a += 20;
  }
   
}
