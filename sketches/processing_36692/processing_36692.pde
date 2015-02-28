
void setup() {
  size(800, 800);
  background(255);
  smooth();
  noStroke();
}

void draw() {


  // Face:

  for (int x = 40; x <= width; x += 80) {
    for (int y = 40; y <= height; y += 80) {

      fill(255, 185, 244);  // pink (medium)
      ellipse(x, y, 50, 50);
    }
  }

/*
  // Ear Left:

  for (int x1 = 28; x1 <= width; x1 += 80) {
    for (int y1 = 37; y1 <= height; y1 += 80) {
      for (int x2 = 23; x2 <= width; x2 += 80) {
        for (int y2 = 20; y2 <= height; y2 += 80) {
          for (int x3 = 38; x3 <= width; x3 += 80) {
            for (int y3 = 28; y3 <= height; y3 += 80) {

              fill(255, 185, 244);  // pink (medium)
              triangle(x1, y1, x2, y2, x3, y3);
            }
          }
        }
      }
    }
  }
*/

/*
  // Ear Right:
  
  fill(255, 185, 244);  // pink (medium)
  triangle(375, 275, 625, 275, 523, 375);
*/

  // Eye Left - Shadow:

  for (int x = 34; x <= width; x += 80) {
    for (int y = 42; y <= height; y += 80) {

      fill(185, 144, 174, 75);  // pink (dark transparent)
      ellipse(x, y, 30, 30);  // drop shadow 1 pixel right & down
    }
  }


  // Eye Left - Lid, Sclera, Pupil:

  for (int x = 33; x <= width; x += 80) {
    for (int y = 41; y <= height; y += 80) {

      fill(91, 94, 98);  // gray
      ellipse(x, y, 30, 30);  // eyelid

      fill(229, 242, 255);  // blue (light)
      float BlinkLeft = constrain(mouseY, 0, 30);
      ellipse(x, y, 30, BlinkLeft);  // sclera

      fill(91, 94, 98);  // gray
      arc(x, y, 5, 25, radians(10), radians(350));  // pupil
    }
  }


  // Eye Right - Shadow:

  for (int x = 57; x <= width; x += 80) {
    for (int y = 42; y <= height; y += 80) {

      fill(185, 144, 174);  // pink (dark)
      ellipse(x, y, 12, 12);  // shadow 1 pixel right & down
    }
  }


  // Eye Right - Lid, Sclera, Pupil:

  for (int x = 56; x <= width; x += 80) {
    for (int y = 41; y <= height; y += 80) {

      fill(91, 94, 98);  // gray
      ellipse(x, y, 12, 12);  // eyelid 

      fill(229, 242, 255);  // blue (light)
      float BlinkRight = constrain(mouseY, 0, 12);
      ellipse(x, y, 12, BlinkRight);  // sclera

      fill(91, 94, 98);  // gray
      arc(x, y, 2, 5, radians(10), radians(350));  // pupil
    }
  }

  /*
 The trick for the blink is to control the size of the
   light blue elipse (the sclera)... Not the gray eyelid.
   The pupil appears to be covered by the eyelid,
   but in fact it remains in front of the moving eyelid.
   This only works because the pupil and eyelid are the same color.
   Thank you, Eric!!     :)
   */

  /*
    // Whiskers:
    
   fill(91, 94, 98);  // gray
   
   beginShape();  // left top whisker
   vertex(400, 485);
   vertex(115, 525);
   vertex(110, 522);
   endShape(CLOSE);
   
   beginShape();  // right top whisker
   vertex(400, 475);
   vertex(680, 475);
   vertex(685, 472);
   endShape(CLOSE);
   
   beginShape();  // left bottom whisker
   vertex(400, 490);
   vertex(215, 550);
   vertex(210, 548);
   endShape(CLOSE);
   
   beginShape();  // right bottom whisker
   vertex(400, 480);
   vertex(580, 500);
   vertex(585, 498);
   endShape(CLOSE);
   
   */
}


