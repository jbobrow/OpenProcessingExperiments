
//Sketch by Karen Vertierra 2012
 
void setup() {
  size(400, 400);
  background(0, 163, 136);
  smooth();
  rectMode(CORNERS);  
  noStroke();
}
 
float count = 40;
float buildings;
float spread;
float wdthVary;
float htVary;
float bkgrdColorPulse;
 
void draw() {
 
  if (count > 0) {  // count is less than num is true; this sets the following tests into motion
    buildings = random(1, 18);  // randomly a number between 1 and 12 will be used and change color of buildings
    if ((buildings >= 1) && (buildings <= 6)) { 
      fill(255, 97, 56);  // orange buildings
    }
     
    if ((buildings >= 7) && (buildings <= 12)) { 
      fill(190, 235, 159);  // light green buidings     
    }
    if ((buildings >= 13) && (buildings <= 18)) { 
      fill(121, 189, 143, 99);  // indigo buildings
    }
    if (count % 40 == 0) {  // this makes the background reset when building count equals 40
      bkgrdColorPulse = random(10, 50);  // this makes the background color change within a random, but still remains blue
      background(2+bkgrdColorPulse, 11+bkgrdColorPulse, 33+bkgrdColorPulse);       
    }
    else {
 
      if (count % 160 == 4) {  // this makes the background reset when building count equals 160; each cycle is actually looping on top of the previous one (it is not resetting or loopin in the literal sense)
        background(0, 163, 136);
      } 
      spread = random(1, 400);  // makes the buldings spread randomly across the width of the sketch screen
      wdthVary = random(20, 80);  // makes the buidling widths vary randomly with a constrained range
      htVary = random(50, 380);  // makes the building heights vary randomly with a constrained range
      rect(spread, htVary, spread + wdthVary, 400);
      
    }
    count++;
  }

  fill(255, 255, 177, 75);
  
  //star 1
  triangle(45, 34, 51, 45, 38, 46); 
  triangle(34, 45, 45, 51, 45, 38);
  triangle(55, 45, 44, 51, 45, 38);
  triangle(45, 55, 48, 49, 40, 48);
  
  //star 2
  triangle(120, 12, 120, 17, 115, 15);
  triangle(112, 15, 119, 15, 117, 20);
  triangle(115, 22, 115, 15, 121, 19);
  triangle(122, 19, 116, 20, 119, 14);
  
  //star 3
  triangle(215, 11, 213, 26, 227, 20);
  triangle(208, 27, 224, 29, 217, 15);
  triangle(225, 34, 212, 24, 227, 19);
  triangle(231, 17, 216, 15, 222, 31);
  
  //star 4
  triangle(316, 32, 316, 48, 301, 40);
  triangle(319, 50, 304, 49, 312, 36);
  triangle(302, 54, 316, 46, 303, 39);
  triangle(298, 36, 306, 50, 313, 37);
  
  //star 5
  triangle(371, 1, 371, 12, 380, 7);
  triangle(367, 13, 374, 4, 378, 15);
  triangle(379, 18, 369, 12, 380, 7);
  triangle(383, 7, 373, 5, 377, 16);
  
  //star 6
  triangle(13, 7, 13, 14, 19, 10);
  triangle(10, 14, 15, 8, 18, 15);
  triangle(18, 17, 12, 13, 19, 9);
  triangle(21, 9, 17, 15, 13, 8);
  
  }

 


