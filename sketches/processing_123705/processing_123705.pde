
import netscape.javascript.*;

background (0, 0, 0);
size (560, 560);
ellipseMode(CENTER);
for (int i = 100; i < 560; i = i+180) {
  for (int j = 100; j<560; j = j+180) {
    if (i <= 100) {
      fill (95, 159, 159);
      ellipse (i, j, 160, 160);
    }
    else if (i <= 280) {
      fill (135, 31, 120);
      ellipse (i, j, 160, 160);
    }
    else if (i <= 460)
      fill (255, 127, 0);
    ellipse (i, j, 160, 160);
  }
}

// círculo 1x1
strokeWeight(3);
line (150, 140, 150, 60);
line (150, 140, 100, 140);
line (80, 140, 40, 140);
line (40, 140, 40, 110);
line (40, 90, 40, 60);
line (40, 60, 100, 60);
line (120, 60, 150, 60);
line (80, 140, 80, 110);
line (80, 90, 80, 60);
strokeWeight(1);
stroke(240, 240, 240);
line (40, 110, 40, 90);
line (80, 110, 80, 90);
line (100, 140, 80, 140);
line (100, 60, 120, 60);

//círculo 2x1
strokeWeight(3);
stroke(0, 0, 0);
line (40, 280, 100, 220);
line (100, 220, 160, 280);
line (100, 220, 100, 280);
line (40, 280, 160, 280);
line (50, 320, 150, 320);
line (50, 320, 50, 280);
line (150, 280, 150, 300);
strokeWeight(1);
stroke(240, 240, 240);
line (150, 300, 150, 320);

//círculo 3x1
strokeWeight(3);
stroke(0, 0, 0);
fill (160, 200, 55);
quad (40, 460, 60, 420, 140, 420, 160, 460);
line (50, 460, 50, 510);
line (150, 460, 150, 510);
line (50, 510, 90, 510);
line (110, 510, 150, 510);
quad (90, 480, 110, 480, 110, 510, 90, 510);

//círculo 1x2
noFill();
rect (220, 60, 120, 80);
line (290, 60, 290, 90);
line (290, 110, 290, 140);
strokeWeight(1);
stroke (240, 240, 240);
line (290, 90, 290, 110);
line (240, 140, 280, 140);
line (300, 140, 320, 140);

//círculo 2x2
strokeWeight(3);
stroke(0,0,0);
quad (240, 220, 320, 220, 320, 340, 240, 340);
line (240, 270, 320, 270);
strokeWeight(1);
stroke (240,240,240);
line (320, 338.5, 320, 318.5);
line (320, 240, 320, 260);

//círculo 3x2
strokeWeight(3);
stroke(0,0,0);
fill (160, 20, 55);
rect (220, 420, 120, 80);
fill (115, 60, 240);
rect (240, 480, 40, 20);
rect (300, 440, 20, 20);

//círculo 1x3
noFill();
rect (420, 40, 80, 40);
rect (450, 80, 50, 40);
rect (470, 120, 30, 40);
strokeWeight(1);
stroke(240,240,240);
line (420, 50, 420, 70);
line (450, 90, 450, 110);
line (470, 130, 470, 150);
line (475, 40, 495, 40);
line (475, 80, 495, 80);
line (475, 120, 495, 120);
line (475, 160, 495, 160);

//círculo 2x3
strokeWeight(3);
stroke (0,0,0);
rect (410, 280, 30, 40);
rect (440, 250, 30, 70);
rect (470, 220, 30, 100);
strokeWeight (1);
stroke (240,240,240);
line (410, 290, 410, 310);
line (440, 290, 440, 310);
line (470, 290, 470, 310);
line (500, 290, 500, 310);

//círculo 3x3
strokeWeight(3);
stroke(0,0,0);
fill(0,0,200);
rect (410, 460, 30, 40);
fill (0,100,120);
rect (440, 430, 30, 70);
fill (0,0,120);
rect (470, 400, 30, 100);
fill (130, 0, 20);
rect (450, 450, 10, 10);
rect (480, 450, 10, 10);
rect (480, 420, 10, 10);
rect (420, 480, 10, 20);
rect (450, 480, 10, 20);
rect (480, 480, 10, 20);


