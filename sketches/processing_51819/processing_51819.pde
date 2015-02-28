
int len = 100;
float pos[][] = new float[len][2];
String letters[] = {"S", "W", "I", "R", "L"};
int index = 0;
int count = 5;
float r = 0;

void setup() {
 size(400,400);
 smooth();
 frameRate(30);
 noCursor();
 
  float rou = 0;
 float theta = 0;
 float dtheta = 6 * PI / 50;
 for (int i = 0; i < len; i++) {
   rou += 3 + (float)i / 40;
   pos[i][0] = rou * cos(theta);
   pos[i][1] = rou * sin(theta);
   theta += dtheta;
 }
 
 rectMode(CENTER);
 textSize(24);
 fill(0,0,255);
}

void draw() {
 background(0);
 pushMatrix();
 translate(mouseX, mouseY);
 rotate(r);
 r -= 0.02;
 for (int i = 0; i < len; i++) {
   int j = (index + i) % len;
   textSize(5+i);
   pushMatrix();
   translate(pos[i][0], pos[i][1]);
   text(letters[j%5], 0, 0);
   popMatrix();
    }
 popMatrix();
 count--;
 if (count == 0) {
   count = 4;
   index++;
   if (index == len) {
     index = 0;
   }
 }
}

