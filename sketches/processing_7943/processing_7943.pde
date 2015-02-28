
PImage bg;


final int flower_X = 0;
final int flower_Y = 0;


final int MIDPOINT_X = 39;
final int LEFTPETAL_X = 281;
final int LEFTPETAL_Y = 167;
final int RIGHTPETAL_X = 284;
final int RIGHTPETAL_Y = 156;
final int LEFTARM_X = 307;
final int LEFTARM_Y = 156;
final int RIGHTARM_X = 311;
final int RIGHTARM_Y = 163;


float leftArmAngle = 0.0;
float rightArmAngle = 0.0;
float leftPetalAngle = 0.0;
float rightPetalAngle = 0.0;

void setup(){
  size(640, 480);
  bg = loadImage ("background2.jpg");
  background (bg);
  smooth();
  
  
  
}

void draw()
{
  float mX;
  float mY;
  
    mX = mouseX - flower_X;
    mY = mouseY - flower_Y;
  
  //R Arm
  float angle = atan2(mY - RIGHTARM_Y, mX - RIGHTARM_X)
  - HALF_PI;;
  
  background (bg);
  pushMatrix();
  translate(0, 0);
  rotate(angle);
  noStroke();
  fill(226, 152, 189);
  bezier (350, 28, 345, 28, 318, 29, 312, 68);
  quad (312, 68, 322, 58, 310, 170, 298, 146);
  popMatrix();
  
  
  //L Arm
  float angle2 = atan2(mY - LEFTARM_Y, mX - LEFTARM_X)
  - HALF_PI;;
  pushMatrix();
  translate(0, 0);
  rotate(angle2);
  noStroke();
  fill(226, 152, 189);
  bezier (305, 165, 302, 165, 284, 86, 302, 74);
  bezier (303, 76, 303, 73, 306, 46, 290, 33);
  bezier (303, 77, 293, 67, 293, 45, 295, 43);
  popMatrix();
  
  
  //R Petal GOOD
  pushMatrix();
  translate(0, 0);
  rotate(leftArmAngle);
  noStroke();
  fill(216, 135, 172);
  bezier (309, 167, 313, 169, 339, 156, 340, 125);
  bezier (354, 99, 354, 99, 308, 78, 313, 145);
  bezier (309, 166, 315, 161, 353, 109, 353, 101);
  triangle (309, 168, 355, 98, 313, 140);
  popMatrix();
  
  
  //L Petal GOOD
  pushMatrix();
  translate(0, 0);
  rotate(leftArmAngle);
  noStroke();
  fill(216, 135, 172);
  bezier (311, 169, 299, 166, 281, 167, 277, 137);
  quad (278, 139, 310, 169, 304, 105, 276, 102);
  bezier (303, 105, 303, 105, 283, 68, 277, 105);
  bezier (283, 88, 280, 87, 274, 77, 268, 84);
  triangle (266, 83, 277, 103, 283, 88);
  popMatrix();
  
  mX = mouseX - flower_X;
  mY = mouseY - flower_Y;
 
      leftArmAngle = atan2(mY - LEFTARM_Y, mX - LEFTARM_X)
      - HALF_PI;
   
      rightArmAngle = atan2(mY - RIGHTARM_Y, mX - RIGHTARM_X)
      - HALF_PI;
      
      
   //L Arm ballerina
  float angle4 = atan2(mY - LEFTARM_Y, mX - LEFTARM_X)
  - TWO_PI;;
  pushMatrix();
  translate(0, 50);
  rotate(angle4);
  noStroke();
  fill(226, 152, 189);
  
  //L arm ballerina
   fill(226, 152, 189);
  bezier (170, 233, 176, 234, 193, 221, 196, 208);
  bezier (166, 243, 168, 222, 186, 213, 195, 208);
  bezier (194, 210, 213, 219, 270, 160, 268, 157);
  
  //R arm ballerina
   fill(226, 152, 189);
  quad (313, 165, 325, 189, 336, 77, 327, 86);
  bezier (327, 87, 333, 48, 361, 47, 365, 47);
  
  
  //R Petal ballerina
  fill (216, 135, 172);
  bezier (296, 221, 300, 223, 327, 210, 325, 181);
  bezier (296, 221, 298, 179, 301, 133, 339, 154);
  quad (297, 222, 298, 217, 338, 153, 341, 158);
  
  //R Leg ballerina
  fill(180, 216, 158);
  quad (362, 234, 373, 221, 419, 245, 413, 260);
  triangle (418, 244, 412, 260, 435, 282);
  bezier (420, 247, 411, 260, 465, 338, 472, 337);
  bezier (417, 244, 423, 247, 479, 333, 470, 337);
  
  //L petal ballerina
  fill(216, 135, 172);
  bezier (301, 223, 292, 227, 269, 215, 269, 189);
  quad (301, 224, 269, 190, 268, 154, 293, 156);
  bezier (293, 157, 293, 156, 277, 127, 268, 155);
  bezier (277, 144, 254, 125, 259, 144, 269, 156);
  
  popMatrix();
  
  
  
}

