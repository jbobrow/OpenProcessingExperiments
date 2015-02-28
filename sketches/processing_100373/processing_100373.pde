
void setup() {
  size(600, 600);
  background(25,25,25); // black
  stroke(255); //white
  noFill();
 
 for (int row=50; row < 500; row+=130)
   for (int col=70; col< 500; col+=130)
    face(col, row); 

}


void face (int x, int y){

  ellipseMode(CORNER);
  
  // BEGIN DECLARE/INITIALIZE VARIABLES  
  // HEAD   
  
  float headHeight = random(90, 120);  
  float headWidth = headHeight*5/7;  
  float head_x = x; //+(width-headWidth)/2;  
  float head_y = y; //+(height-headHeight)/2;  
  
  // EYES  
  float eyeWidth = headWidth/5;  
  float eyeHeight = eyeWidth/2;  
  float irisDiam = eyeHeight;  
  float pupilDiam = irisDiam/3;  
  float eye_y = head_y+headHeight/2-eyeHeight/2;  
  
  // left  
  float leftEye_x = head_x+eyeWidth;  
  float leftIris_x = leftEye_x + eyeWidth/2-irisDiam/2;  
  float leftPupil_x = leftEye_x + eyeWidth/2-pupilDiam/2;  
  
  // right  
  float rightEye_x = head_x+eyeWidth*3;  
  float rightIris_x = rightEye_x + eyeWidth/2-irisDiam/2;  
  float rightPupil_x = rightEye_x + eyeWidth/2-pupilDiam/2;  
  
  //EYEBROWS  
  float eyeBrowWidth = eyeWidth*1.25;  
  float eyeBrowHeight = eyeHeight/4;  
  float eyeBrow_y = eye_y - eyeHeight - eyeBrowHeight/2;  
  
  // left  
  float leftEyeBrow_x = leftEye_x - (eyeBrowWidth-eyeWidth);  
  // right  
  float rightEyeBrow_x = rightEye_x;  
  
  // NOSE  
  float nose_x = head_x+eyeWidth*2;  
  float nose_y = head_y + headHeight - headHeight/4;  
   
  // MOUTH  
  float mouthWidth = eyeWidth*1.5;  
  float mouthHeight = headHeight/12;  
  float mouth_x = leftIris_x+irisDiam/2+eyeWidth/4;  
  float mouth_y = nose_y + mouthHeight;  
  
  // EARS  
  float earWidth = eyeHeight*1.5;  
  float earHeight = headHeight/4;  
  float ear_y = eyeBrow_y;  
  
  // left  
  float leftEar_x = head_x-earWidth/2;  
  
  // right  
  float rightEar_x = head_x+headWidth-earWidth/2;  
  
  // BEGIN DRAWING  
  
  // Draw head  
  fill(random(0,255), random(255), random(255));
  ellipse(head_x, head_y, headWidth, headHeight);   
  
  // left eye  
  noFill();
  ellipse(leftEye_x, eye_y, eyeWidth, eyeHeight);  
  // Draw left iris  
  fill(random(0,255), random(255), random(255));
  ellipse(leftIris_x, eye_y, irisDiam, irisDiam);  
  // Draw left pupil  
  fill(0);
  ellipse(leftPupil_x, eye_y+eyeHeight/2-pupilDiam/2, pupilDiam, pupilDiam);  
  
  // Draw right eye  
  ellipse(rightEye_x, eye_y, eyeWidth, eyeHeight);   
  // Draw right iris  
  fill(random(0,255), random(255), random(255));
  ellipse(rightIris_x, eye_y, irisDiam, irisDiam);  
  // Draw right pupil  
  fill(0);
  ellipse(rightPupil_x, eye_y+eyeHeight/2-pupilDiam/2, pupilDiam, pupilDiam);  
  
  // Draw left eyebrow  
  fill(random(0,255), random(255), random(255));
  rect(leftEyeBrow_x, eyeBrow_y, eyeBrowWidth, eyeBrowHeight);  
  
  // Draw right eyebrow  
  fill(random(0,255), random(255), random(255));
  rect(rightEyeBrow_x, eyeBrow_y, eyeBrowWidth, eyeBrowHeight);  
  
  // Draw nose  
  fill(random(0,255), random(255), random(255));
  triangle(nose_x, nose_y, nose_x+eyeWidth, nose_y, nose_x + eyeWidth/2, nose_y-eyeWidth);  
  
  // Draw Mouth - top lip  
  fill(255,0,0);
  arc(mouth_x, mouth_y-mouthHeight/2, mouthWidth, mouthHeight, PI, TWO_PI);  
  
  // Draw Mouth - bottom lip  
  arc(mouth_x, mouth_y-mouthHeight/2, mouthWidth, mouthHeight, 0, PI);  
  
  // Draw Mouth – crease  
  line(mouth_x, mouth_y, mouth_x+mouthWidth, mouth_y);  
  
  // Draw left ear  
  fill(random(0,255), random(255), random(255));
  arc(leftEar_x, ear_y, earWidth, earHeight, PI/2.3, PI*1.55);  
  
  // Draw right ear  
  fill(random(0,255), random(255), random(255));
  arc(rightEar_x, ear_y, earWidth, earHeight, -PI/1.8, PI/1.8); 
  
 
}

void draw() {
}

void mouseClicked(){
 background(25,25,25); // black
 for (int row=50; row < 500; row+=130)
   for (int col=70; col< 500; col+=130)
    face(col, row);   
}
