
int ellx1 = 250;
int elly1 = 250;
int ellx2 = 250;
int elly2 = 250;
int ellx3 = 250;
int elly3 = 250;
int ellx4 = 250;
int elly4 = 250;

float r = 0;
float g = 0;
float b = 0;
float a = 162;

void setup() {
  // Set the size of the window
  size(500, 500);
  smooth();
  background(200);
}

void draw() {

  // Bottom Abstract design

  stroke(255);
  // var black lower L. large circle
  fill(r, g, b, a);
  ellipse(ellx1+25, elly1+30, 80, 80);

  // white lower L.med. circle
  fill(255);
  ellipse(ellx1+25, elly1+30, 60, 60);

  // var black lower R med. circle
  fill(r, g, b, a);
  ellipse(ellx1-25, elly1+30, 70, 70);

  // white lower R med. circle
  fill(255);
  ellipse(ellx1-25, elly1+30, 50, 50);

  // var black sm.med. R. circle
  fill(r, g, b, a);
  ellipse(ellx1-20, elly1, 60, 60);

  // var black sm.med. L circle
  fill(r, g, b, a);
  ellipse(ellx1+25, elly1, 60, 60);

  // white sm.med. L circle
  fill(255);
  ellipse(ellx1+25, elly1, 40, 40);

  // white upper med circle
  fill(255);
  ellipse(ellx1-20, elly1, 40, 40);

  // var black upper sm. center circle
  fill(r, g, b, a);
  ellipse(ellx1, elly1, 40, 40);

  // var black lower L. sm.med circle
  fill(r, g, b, a);
  ellipse (ellx1+25, elly1+30, 40, 40); 

  // var black upper little R circle
  fill(r, g, b, a);
  ellipse(ellx1-20, elly1, 25, 25);

  // white upper little center circle (mouseX: was originally 225, mouseY: was orig. 250)
  fill(255);
  ellipse(ellx1, elly1, 25, 25);

  // white lower L. sm. circle
  fill(255);
  ellipse(ellx1+25, elly1+30, 25, 25);

  // Top Abstract Design

  stroke(255);
  // var black lower L. large circle
  fill(r, g, b, a);
  ellipse(ellx2+25, elly2+30, 80, 80);

  // white lower L.med. circle
  fill(255);
  ellipse(ellx2+25, elly2+30, 60, 60);

  // var black lower R med. circle
  fill(r, g, b, a);
  ellipse(ellx2-25, elly2+30, 70, 70);

  // white lower R med. circle
  fill(255);
  ellipse(ellx2-25, elly2+30, 50, 50);

  // var black sm.med. R. circle
  fill(r, g, b, a);
  ellipse(ellx2-20, elly2, 60, 60);

  // var black sm.med. L circle
  fill(r, g, b, a);
  ellipse(ellx2+25, elly2, 60, 60);

  // white sm.med. L circle
  fill(255);
  ellipse(ellx2+25, elly2, 40, 40);

  // white upper med circle
  fill(255);
  ellipse(ellx2-20, elly2, 40, 40);

  // var black upper sm. center circle
  fill(r, g, b, a);
  ellipse(ellx2, elly2, 40, 40);

  // var black lower L. sm.med circle
  fill(r, g, b, a);
  ellipse (ellx2+25, elly2+30, 40, 40); 

  // var black upper little R circle
  fill(r, g, b, a);
  ellipse(ellx2-20, elly2, 25, 25);

  // white upper little center circle (mouseX: was originally 225, mouseY: was orig. 250)
  fill(255);
  ellipse(ellx2, elly2, 25, 25);

  // white lower L. sm. circle
  fill(255);
  ellipse(ellx2+25, elly2+30, 25, 25);

  // Top Abstract design Opposite Fill

  stroke(0);
  // white lower L. large circle
  fill(255);
  ellipse(ellx3+25, elly3+30, 80, 80);

  // var black lower L.med. circle
  fill(r, g, b, a);
  ellipse(ellx3+25, elly3+30, 60, 60);

  // white lower R med. circle
  fill(255);
  ellipse(ellx3-25, elly3+30, 70, 70);

  // var black R med. circle
  fill(r, g, b, a);
  ellipse(ellx3-25, elly3+30, 50, 50);

  // white sm.med. R. circle
  fill(255);
  ellipse(ellx3-20, elly3, 60, 60);

  // white sm.med. L circle
  fill(255);
  ellipse(ellx3+25, elly3, 60, 60);

  // var black sm.med. L circle
  fill(r, g, b, a);
  ellipse(ellx3+25, elly3, 40, 40);

  // var black upper med circle
  fill(r, g, b, a);
  ellipse(ellx3-20, elly3, 40, 40);

  // white upper sm. center circle
  fill(255);
  ellipse(ellx3, elly3, 40, 40);

  // white lower L. sm.med circle
  fill(255);
  ellipse (ellx3+25, elly3+30, 40, 40); 

  // white upper little R circle
  fill(255);
  ellipse(ellx3-20, elly3, 25, 25);

  // var black upper little center circle (mouseX: was originally 225, mouseY: was orig. 250)
  fill(r, g, b, a);
  ellipse(ellx3, elly3, 25, 25);

  // var black lower L. sm. circle
  fill(r, g, b, a);
  ellipse(ellx3+25, elly3+30, 25, 25);

  // Bottom Abstract design Opposite Fill

  stroke(0);
  // white lower L. large circle
  fill(255);
  ellipse(ellx4+25, elly4+30, 80, 80);

  // var black lower L.med. circle
  fill(r, g, b, a);
  ellipse(ellx4+25, elly4+30, 60, 60);

  // white lower R med. circle
  fill(255);
  ellipse(ellx4-25, elly4+30, 70, 70);

  // var black R med. circle
  fill(r, g, b, a);
  ellipse(ellx4-25, elly4+30, 50, 50);

  // white sm.med. R. circle
  fill(255);
  ellipse(ellx4-20, elly4, 60, 60);

  // white sm.med. L circle
  fill(255);
  ellipse(ellx4+25, elly4, 60, 60);

  // var black sm.med. L circle
  fill(r, g, b, a);
  ellipse(ellx4+25, elly4, 40, 40);

  // var black upper med circle
  fill(r, g, b, a);
  ellipse(ellx4-20, elly4, 40, 40);

  // white upper sm. center circle
  fill(255);
  ellipse(ellx4, elly4, 40, 40);

  // white lower L. sm.med circle
  fill(255);
  ellipse (ellx4+25, elly4+30, 40, 40); 

  // white upper little R circle
  fill(255);
  ellipse(ellx4-20, elly4, 25, 25);

  // var black upper little center circle (mouseX: was originally 225, mouseY: was orig. 250)
  fill(r, g, b, a);
  ellipse(ellx4, elly4, 25, 25);

  // var black lower L. sm. circle
  fill(r, g, b, a);
  ellipse(ellx4+25, elly4+30, 25, 25);

  // Set constrains for colors or Abstract Design
  r = constrain(r, 0, 255);
  g = constrain(g, 0, 255);
  b = constrain(b, 0, 255);

  // Coordinates: mouseX < 250 = -X  mouseY < 250 = -Y
  //(X,Y: +R,-B,-G), (-X,Y: -R,+B,-G), (-X,-Y: -R,+B,+G),(X,-Y: +R,-B,+G)
  if (mouseX < 250) {
    r = r - 1;
    b = b + 1;
  } 
  else {
    r = r + 1;
    b = b - 1;
  }

  if (mouseY < 250) {
    g = g + 1;
  }
  else {
    g = g - 1;
  }

  ellx1 = ellx1 + 1;
  elly1 = elly1 + 1;
  ellx2 = ellx2 - 1;
  elly2 = elly2 - 1;
  ellx3 = ellx3 + 1;
  elly3 = elly3 - 1;
  ellx4 = ellx4 - 1;
  elly4 = elly4 + 1;

  // Make each design stop at each corner
  ellx1 = constrain (ellx1, 80, 414);
  elly1 = constrain (elly1, 80, 414);
  ellx2 = constrain (ellx2, 80, 419);
  elly2 = constrain (elly2, 80, 419);
  ellx3 = constrain (ellx3, 80, 419);
  elly3 = constrain (elly3, 80, 419);
  ellx4 = constrain (ellx4, 80, 419);
  elly4 = constrain (elly4, 80, 419);
  
  if (mousePressed) {
  background(r, g, b, 30);
     
   }
}

