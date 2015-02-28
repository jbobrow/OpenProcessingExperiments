
// Based on an original marrimekko print 'unikko', the code 
//provides the user with a constantly changing background colour and different 
// colours for each letter key



PImage poppys;
import processing.pdf.*;
int pdfCounter = 0;


// PDF setup
void mousePressed() {
  pdfCounter++;
  saveFrame("frame-####.png");  // use png seems to support transparency more consistently
}

// Background
void setup () {
  size (500, 700) ;
  poppys = loadImage ("redpoppys3.png");// load image during setup (only loads once
  frameRate (1);
  smooth ();
  strokeWeight (1);
}


//original image/background
void draw (){
  float r = random (199, 0);
  float g = random (50, 255);
  float b = random (255, 140);
  background (r, g, b);
  
  //flower centres
   background (r, g, b);
//
// } else {
//   fill (255);
// }
// ellipse (55, 30, 114, 133);
// }
   
   
   // other circles
     fill (22, 44, 98);
     if (keyPressed) {
   if (key == 'a' || key == 'A') {
 fill (224, 174, 72);
   }
    if (key == 'b' || key == 'B') {
 fill (178, 113, 48);
   }
    if (key == 'c' || key == 'C') {
 fill (71, 228, 234);
   }
    if (key == 'd' || key == 'D') {
 fill (23, 10, 82);
   }
    if (key == 'e' || key == 'E') {
 fill (24, 77, 12);
   }
    if (key == 'f' || key == 'F') {
 fill (227, 44, 224);
   }
    if (key == 'g' || key == 'G') {
 fill (149, 148, 145);
   }
    if (key == 'h' || key == 'H') {
 fill (245, 237, 222);
   }
    if (key == 'i' || key == 'I') {
 fill (105, 48, 121);
   }
    if (key == 'j' || key == 'J') {
 fill (101, 183, 94);
   }
    if (key == 'k' || key == 'K') {
 fill (134, 149, 97);
   }
    if (key == 'l' || key == 'L') {
 fill (253, 255, 165);
   }
    if (key == 'm' || key == 'M') {
 fill (165, 23, 35);
   }
    if (key == 'n' || key == 'N') {
 fill (22, 44, 98);
   }
   if (key == 'o' || key == 'O') {
 fill (245, 158, 52);
   }
    if (key == 'p' || key == 'P') {
 fill (245, 173, 211);
   }
    if (key == 'q' || key == 'Q') {
 fill (224, 212, 70);
   }
    if (key == 'r' || key == 'R') {
 fill (245, 23, 15);
   }
    if (key == 's' || key == 'S') {
 fill (245, 199, 151);
   }
    if (key == 't' || key == 'T') {
 fill (65, 193, 214);
   }
    if (key == 'u' || key == 'U') {
 fill (46, 79, 175);
   }
    if (key == 'v' || key == 'V') {
 fill (173, 19, 191);
   }
      if (key == 'w' || key == 'W') {
 fill (255);
   }
      if (key == 'x' || key == 'X') {
 fill (120);
   }
      if (key == 'y' || key == 'Y') {
 fill (255, 248, 41);
   }
      if (key == 'z' || key == 'Z') {
 fill (255, 133, 52);
   }
   
     } 
     
   ellipse (55, 30, 114, 133);  
  ellipse (440, 33, 140, 135);
  ellipse (40, 220, 115, 150);
  ellipse (290, 200, 118, 118);
  ellipse (440, 290, 110, 120);
  ellipse (45, 620, 120, 120);
  ellipse (280, 510, 120, 120);
  ellipse (440, 620, 150, 135);
 
   image(poppys, 0, 0);
  
}


// PDF closer
void mouseReleased() {
  endRecord();
}  
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}



