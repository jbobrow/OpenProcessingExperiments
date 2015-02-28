
Ellipsoid AddEllipsoid (int slices, int segments, String textureFile, float radius)
{
  Ellipsoid aShape = new Ellipsoid(this, slices, segments);
  aShape.setTexture(textureFile);
  aShape.drawMode(Shape3D.TEXTURE);
  aShape.setRadius(radius);
  return aShape;
}

class Timer {
   
  int startTime;      
  int endTime;       
   
  Timer(int tempEndTime) {
    endTime = tempEndTime;
  }
   
  void start() {
    startTime = millis();
  }
   
  boolean isFinished() {
    int passedTime = millis() - startTime;
    if (passedTime > endTime) {
      return true;
    } else {
      return false;
    }
  }
}

//sparkles
class Sparkles{
  float xpos;
  float ypos;
  float spdX;
  float spdY;
  float gravity = .06;
  float colorSegment;
  
  //constructor
  Sparkles(float tempx, float tempy) {
    xpos = tempx;
    ypos = tempy;
    //original spd in horizontal direction
    spdX = random(-3,3); 
    //original spd in vertical direction
    spdY = random(-6,-1);
  }
  
  void display() {
    smooth();
    noStroke();
    colorSegment = random(50,255);
    //random Yellow
    fill(colorSegment,colorSegment,0);
    //draw sparkle shape
    beginShape();
    vertex(xpos,ypos-height/60);
    vertex(xpos+width/200,ypos-height/200);
    vertex(xpos+width/60,ypos);
    vertex(xpos+width/200,ypos+height/200);
    vertex(xpos,ypos+height/60);
    vertex(xpos-width/200,ypos+height/200);
    vertex(xpos-width/60,ypos);
    vertex(xpos-width/200,ypos-height/200);
    endShape();
  }
  
  //sparkle movement
  void move() {
    xpos += spdX;
    spdY += gravity;
    ypos += spdY;
  }
}

void drawShip() {
  //Draw left wing
    fill(20);
    quad(143,40,45,40,56,29,127,29);
    fill(170);
    quad(127,29,143,40,164,40,143,30);
    
    //Draw tail
    triangle(45,38,86,11,99,31);
    quad(72,36,97,33,112,43, 86,47);
    quad(86,47,112,43,101,55,78,55);
    
    //Draw top plating
    quad(112,43,101,55,137,60,142,45);
    quad(142,45,112,43,108,39,155,41);
    quad(155,41,142,45,204,55,216,51);
    quad(204,55,142,45,137,60,194,72);
    quad(204,55,194,72,262,90,271,75);
    quad(271,75,204,55,216,51,277,69);
    quad(277,69,383,111,377,115,271,75);
    quad(271,75,377,115,372,122,262,90);
    
    //Draw side plating
    fill(20);
    quad(78,55,101,55,114,57,108,72);
    quad(108,72,114,57,137,60,161,83);
    quad(137,60,161,83,261,105,229,82);
    fill(170);
    triangle(229,82,261,105,262,90);
    quad(261,105,262,90,335,112,335,120);
    fill(20);
    quad(336,112,335,120,373,128,371,122);
    strokeWeight(1);
    quad(384,112,384,115,380,115,383,112);
    strokeWeight(2);
    quad(373,123,372,122,381,113,382,116);
    
    //Draw right wing
    strokeWeight(3);
    quad(108,72,161,83,157,89,115,80);
    quad(161,83,157,89,183,96,210,92);
    fill(170);
    quad(93,114,98,115,87,136,37,150);
    triangle(98,115,120,123,87,136);
    fill(20);
    quad(120,123,131,126,66,156,37,150);
    
    //Draw Jet 1 right wing
    quad(157,90,204,103,192,128,142,113);
    quad(204,103,192,128,226,137,235,114);
    quad(235,114,226,137,272,147,282,128);
    quad(218,136,152,132,58,100,64,89);
    quad(58,100,86,110,67,113,52,106);
    quad(50,106,67,63,18,56,0,87);
    fill(170);
    quad(156,90,141,113,63,87,71,69);
    quad(71,69,74,64,85,66,99,77);
    quad(63,70,51,96,63,99,75,72);
    strokeWeight(2);
    quad(64,69,96,80,94,85,63,75);
    quad(59,79,101,93,97,99,56,87);
    quad(55,91,87,102,84,107,52,95);
    fill(200,0,0);
    quad(26,66,39,68,30,87,16,83);
    strokeWeight(3);
    fill(10);
    quad(281,127,273,147,302,154,308,137);
    fill(20);
    strokeWeight(1);
    quad(308,136,302,154,296,153,302,136);
    quad(281,127,278,131,310,141,312,136);
    quad(275,143,271,148,303,156,306,152);
    
    //Draw jet 2 right wing
    strokeWeight(3);
    quad(78,129,59,122,47,147,60,154);
    quad(38,154,59,118,17,102,0,134);
    fill(170);
    quad(52,124,43,141,50,143,57,128);
    fill(200,0,0);
    quad(23,115,34,118,24,136,14,132);
    
    //Guns
    fill(20);
    quad(347,123,359,125,359,129,348,127);
    fill(100);
    quad(340,127,376,131,399,141,380,140);
    quad(382,115,411,129,397,116,385,112);
  
}

