
float offset = 0;
float angle = 0.0;
float angleDirection = 1;
float speed = 0.005;
float scalar = 130;
float x = 110;
int direction = 1;
int time1 = 2000;
void setup() {
  size(380, 380);
  smooth();
}
void draw() {           
  background(176,224,230);
  fill(255,140,0);
  line(0, 280, 400, 280);
  fill(154,205,50);
  rect(0, 250, 400, 150);
  int currentTime = millis();
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  
              //HEAD
   arc(200, 120,  100, 70, PI, TWO_PI);  //Head Top
   fill(160, 82, 45);
   ellipse(200, 123,  100, 15);  //Head Bottom
   fill(0);
   ellipse(178, 117, 13, 13);  //Eye Left
   ellipse(223, 115, 16, 16);  //Eye Right
   
               //NECK
  fill(0);
   quad(171, 130, 228, 130, 240, 140, 160, 140);

               //Torso
  fill(160, 82, 45);
   ellipse(200, 140, 122, 15);
  fill(160,82,45);
   quad(138, 145, 264, 145, 249, 170, 154, 170);   
  
              //Legs
  strokeWeight(12);
  stroke(139, 69, 19); 
   line(205, 174, 220, 206);
  strokeWeight(5); 
   line(220, 202, 190, 230);
   line(190, 230, 235, 245);
   line(219, 206, 216, 270);
              //Arm
  strokeWeight(9);
   line(160, 173, 163, 210);
  strokeWeight(4);
   line(160, 173, 190, 193);  //Bent Arm
   line(190, 193, 191, 213);
   line(163, 210, 170, 250);  //Straight Arm  
              
              //Moving Arm
  translate(246, 176);  // Move to start position
  rotate(angle);
  strokeWeight(12);
  line(0, 0, 40, 0);
  translate(40, 0);   // Move to next joint
  rotate(angle * 2.0);
  strokeWeight(6);
  line(0, 0, 30, 0);
  translate(30, 0);   // Move to next joint
  rotate(angle * 2.5);
  strokeWeight(3);
  line(0, 0, 20, 0);
 
  angle += speed * angleDirection;
  if ((angle > QUARTER_PI) || (angle < 0)) {
    angleDirection *= 1;
  }
}

