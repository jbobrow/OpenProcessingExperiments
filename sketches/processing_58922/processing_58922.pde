
String message = "tickle";
float x, y, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text
int opacity1 = 255;
int opacity2 = 255;
int opacity3 = 255;
int opacity4 = 255;
int opacity5 = 255;
int opacity6 = 255;
int opacity7 = 255;
int opacity8 = 255;


void setup() {
  size(500, 500);
  PFont font = loadFont("LetterGothicStd-100.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width / 2;
  y = height / 2;

 x2 = width / 2;
  y2 = height / 2;
  
   x3 = width / 2;
  y3 = height / 2;
  
   x4 = width / 2;
  y4 = height / 2;
  
   x5 = width / 2;
  y5 = height / 2;
  
   x6 = width / 2;
  y6 = height / 2;
  
   x7 = width / 2;
  y7 = height / 2;
  
   x8 = width / 2;
  y8 = height / 2;
  


}

void draw() {
  // instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top
  fill(57, 2, 35);
  rect(0, 0, width, height);
  fill(0);
  // If the cursor is over the text, change the position
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
    x += random(-5, 5);
    y += random(-5, 5);
    opacity1 = opacity1 - 1;
      }
    
 if (abs(mouseX - x2) < hr &&
      abs(mouseY - y2) < vr) {
    x2 += random(-5, 5);
    y2 += random(-5, 5);
    opacity2 = opacity2 - 1;

      }
    
 if (abs(mouseX - x3) < hr &&
      abs(mouseY - y3) < vr) {
    x3 += random(-5, 5);
    y3 += random(-5, 5);
     opacity3 = opacity3 - 1;
      }
    

 if (abs(mouseX - x4) < hr &&
      abs(mouseY - y4) < vr) {    
    x4 += random(-5, 5);
    y4 += random(-5, 5);
     opacity4 = opacity4 - 1;
      }
    

 if (abs(mouseX - x5) < hr &&
      abs(mouseY - y5) < vr) {    
    x5 += random(-5, 5);
    y5 += random(-5, 5);
     opacity5 = opacity5 - 1;
      }
      
      
 if (abs(mouseX - x6) < hr &&
      abs(mouseY - y6) < vr) {    
    x6 += random(-5, 5);
    y6 += random(-5, 5);
     opacity6 = opacity6 - 1;
      }
    

 if (abs(mouseX - x7) < hr &&
      abs(mouseY - y7) < vr) {    
    x7 += random(-5, 5);
    y7 += random(-5, 5);
     opacity7 = opacity7 - 1;
      }
      
 if (abs(mouseX - x8) < hr &&
      abs(mouseY - y8) < vr) {      
    x8 += random(-5, 5);
    y8 += random(-5, 5);
     opacity8 = opacity8 - 1;
    
    
    
  }
  fill(209, 126, 162, opacity1);
  text("erase", x, y);
    
    fill(160, 113, 154, opacity2);
  text("delete", x2, y2);
      
      fill(123, 117, 165, opacity3);
  text("obliterate", x3, y3);
  
  fill(117, 154, 165, opacity4);
  text("expunge", x4, y4);
  
  fill(225, 242, 149, opacity5);
  text("excise", x5, y5);
  
  fill(164, 201, 182, opacity6);
  text("sponge out", x6, y6);
  
  fill(209, 194, 135, opacity7);
  text("eliminate", x7, y7);
  
  fill(209, 168, 135, opacity8);
  text("eradicate", x8, y8);
}



