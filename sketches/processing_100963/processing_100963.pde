
String message = "t";
float x, y,xu,yu,xk,yk,xe,ye,xs,ys,xh,yh; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

void setup() {
  size(640, 360);
  
  // Create the font
  textFont(createFont("Georgia", 36));
  textAlign(CENTER, CENTER);
  
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width / 2;
  y = height / 2;
  xu = width / 2+25;
  yu = height / 2;
  xk = width / 2+50;
  yk = height / 2;
   xe = width / 2+75;
  ye = height / 2;
   xs = width / 2+100;
  ys = height / 2;
   xh = width / 2+125;
  yh = height / 2;
}

void draw() {
  // Instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top
  fill(204, 120);
  rect(0, 0, width, height);
  
  // If the cursor is over the text, change the position
  if (abs(mouseX - xs) < hr &&
      abs(mouseY - ys) < vr) {
    xs += random(-5, 5);
    ys += random(-5, 5);
  }
  
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
    x += random(-5, 5);
    y += random(-5, 5);
  }
   if (abs(mouseX - xu) < hr &&
      abs(mouseY - yu) < vr) {
    xu += random(-5, 5);
    yu += random(-5, 5);
  } if (abs(mouseX - xh) < hr &&
      abs(mouseY - yh) < vr) {
    xh += random(-5, 5);
    yh += random(-5, 5);
  } if (abs(mouseX - xk) < hr &&
      abs(mouseY - yk) < vr) {
    xk += random(-5, 5);
    yk += random(-5, 5);
  } if (abs(mouseX - xe) < hr &&
      abs(mouseY - ye) < vr) {
    xe += random(-5, 5);
    ye += random(-5, 5);
  }
  
  
  
  fill(0);
  text("S", x, y);
  text("U", xu, yu);
  text("K", xk, yk);
  text("E", xe, ye);
  text("S", xs, ys);
  text("H", xh, yh);
}
