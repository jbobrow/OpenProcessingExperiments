
// From a design at:
// http://lifeboat.com/ex/warning.signs.for.tomorrow
 
  color bgColor = color(255,255,0);
  PFont font;
 
  int screenWidth = 641;
  int screenHeight = 810;
   
  float xMargin = screenWidth / 10;
  float yMargin = screenHeight / 9;
  float triangleMargin = screenHeight / 3.74  ;
 
void setup() {
 
   
  size(screenWidth,screenHeight);
  
  background(bgColor);
  // textFont(loadFont("ArialMT-18.vlw"));
  smooth();
  fill(255,255,0);
}
  
void draw() {
    noLoop();
  
  beginShape();  // Triangle
    strokeWeight(35);
    strokeCap(ROUND);
    strokeJoin(ROUND);
    vertex(0 + xMargin, screenHeight - yMargin - triangleMargin);
    vertex(screenWidth - xMargin, screenHeight - yMargin - triangleMargin);
    vertex(screenWidth / 2, yMargin);
  endShape(CLOSE);
 
  beginShape();  // warning shape
   strokeJoin(ROUND);
   fill(0);
     strokeWeight(3);
     vertex(screenWidth / 2.000, screenHeight / 3.563);  // 1
     vertex(screenWidth / 2.264, screenHeight / 3.104);  // 2
     vertex(screenWidth / 2.124, screenHeight / 3.104);  // 3
     vertex(screenWidth / 2.124, screenHeight / 2.852);  // 4
     vertex(screenWidth / 2.479, screenHeight / 2.852);  // 5
     vertex(screenWidth / 2.479, screenHeight / 2.484);  // 6
     vertex(screenWidth / 2.746, screenHeight / 2.484);  // 7
     vertex(screenWidth / 2.746, screenHeight / 2.633);  // 8
     vertex(screenWidth / 3.26, screenHeight / 2.362);   // 9
     vertex(screenWidth / 2.746, screenHeight / 2.149);   // 10
     vertex(screenWidth / 2.746, screenHeight / 2.251);   // 11
     vertex(screenWidth / 2.479, screenHeight / 2.251);   // 12
     vertex(screenWidth / 2.479, screenHeight / 2.018);   // 13
     vertex(screenWidth / 2.124, screenHeight / 2.018);   // 14
     vertex(screenWidth / 2.124, screenHeight / 1.907);   // 15
     vertex(screenWidth / 2.264, screenHeight / 1.907);   // 16
     vertex(screenWidth / 2.000, screenHeight / 1.763);   // 17
     vertex(screenWidth / 1.799, screenHeight / 1.907);   // 18
     vertex(screenWidth / 1.897, screenHeight / 1.907);   // 19
     vertex(screenWidth / 1.897, screenHeight / 2.018);   // 20
     vertex(screenWidth / 1.680, screenHeight / 2.018);   // 21
     vertex(screenWidth / 1.680, screenHeight / 2.251);   // 22
     vertex(screenWidth / 1.577, screenHeight / 2.251);   // 23
     vertex(screenWidth / 1.577, screenHeight / 2.149);   // 24
     vertex(screenWidth / 1.445, screenHeight / 2.362);   // 25
     vertex(screenWidth / 1.577, screenHeight / 2.633);   // 26
     vertex(screenWidth / 1.577, screenHeight / 2.484);   // 27
     vertex(screenWidth / 1.680, screenHeight / 2.484);   // 28
     vertex(screenWidth / 1.680, screenHeight / 2.852);   // 29
     vertex(screenWidth / 1.897, screenHeight / 2.852);   // 30
     vertex(screenWidth / 1.897, screenHeight / 3.104);   // 31
     vertex(screenWidth / 1.799, screenHeight / 3.104);   // 32
      
   endShape(CLOSE);
 
 
// Text
//  Warning Self-Replicating Device
 
// The font must be located in the sketch's
// "data" directory to load successfully
// font = loadFont("LevenimMT-Bold-200.vlw");
// textFont(font, 200);
// text("SELF-REPLICATING", 360 , 2350);
 
//text("DEVICE", 870, 2600);
 
save("Self_Replication_3.png");
noLoop();
 
  }             
