

void setup()  {
  size (320, 480);
  smooth();
}

void draw()  {
  background (0);
  //+++++++++++++++++++++ Background
  int steps = 10;
  for (int i = 0; i < width; i = i+5) {
    line (i, 0, i, height);
  }
  
  //+++++++++++++++++++++ Face
  beginShape();
    noStroke();
    fill(0);
    vertex(58,185);
    bezierVertex(58,185,66,86,154,85);
    bezierVertex(242,84,260,118,272,181);
    bezierVertex(272.0, 181.0, 270.0, 263.0, 250.0, 330.0);
    bezierVertex(250,330,161,451,70,335);
    bezierVertex(70.0, 335.0, 45.0, 287.0, 58.0, 185.0);
  endShape();  
  
  stroke(150); 
  steps = 30;
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);  
    float x = bezierPoint(58, 58, 66, 154, t);
    float y = bezierPoint(185, 185, 86, 85, t);
    line (x, y, x, 480);
  }
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);  
    float x = bezierPoint(154, 242, 260, 272, t);
    float y = bezierPoint(85, 84, 118, 181, t);
    line (x, y, x, 480);
  }
  
  beginShape();
    noStroke();
    fill(0);
    vertex(0,355);
    bezierVertex(0,355,42,338,70,335);
    bezierVertex(70.0, 335.0, 45.0, 287.0, 58.0, 185.0);
  endShape();
  
  beginShape();
    noStroke();
    fill(0);
    vertex(320,365);
    bezierVertex(284,350,257,319,250,330);
    bezierVertex(250,330,270,263,272,181);
    vertex(320,330);
  endShape();
  
  steps = 10;
  for (int i = 0; i < width; i = i+5) {
    line (i, 0, i, height);
    stroke (100);
  }
  
  //+++++++++++++++++++++ Neck 
  beginShape();
    fill(0);
    noStroke();
    vertex(70.0, 335.0);
    bezierVertex(70.0, 335.0, 161.0, 451.0, 250.0, 330.0);
    vertex(250,480);
    vertex(70,480);
  endShape();
  
  stroke(180); 
  steps = 35;
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);  
    float x = bezierPoint(70, 70, 161, 250, t);
    float y = bezierPoint(335, 335, 451, 330, t);
    line (x, y, x, y+480);
  }
  
  //+++++++++++++++++++++ Shirt 
  
  beginShape();
    noStroke();
    fill(0);
    vertex(0,355);
    bezierVertex(0,355,42,338,70,335);
    bezierVertex(90,427,160,480,160,480);
    vertex(0,480);
  endShape();
  
  beginShape();
    vertex(180,480);
    bezierVertex(180,480,229,432,230,395);
    bezierVertex(236,357,243,341,250,330);
    bezierVertex(257,319,284,350,320,365);
    vertex(320,480);
  endShape();
  
  stroke(255);
  steps = 15; 
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);
    float x = bezierPoint(0, 0, 42, 70, t);
    float y = bezierPoint(355, 355, 338, 335, t);
    line (x, y, x, 480);
  }

  steps = 20;
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);
    float x = bezierPoint(70, 90, 160, 160, t);
    float y = bezierPoint(335, 427, 480, 480, t);
    line (x, y, x, 480);
  }

  steps = 10;
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);
    float x = bezierPoint(180, 180, 229, 230, t);
    float y = bezierPoint(480, 480, 432, 395, t);
    line (x, y, x, 480);
  }
  
  steps = 5;
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);
    float x = bezierPoint(230, 236, 243, 250, t);
    float y = bezierPoint(395, 357, 341, 330, t);
    line (x, y, x, 480);
  }
  
  steps = 15;
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);
    float x = bezierPoint(250, 257, 284, 320, t);
    float y = bezierPoint(330, 319, 350, 365, t);
    line (x, y, x, 480);
  }
  
  //+++++++++++++++++++++ Ear  
  stroke(150);
  steps = 5;
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);
 
    float ax = bezierPoint(58, 50, 33, 42, t);
    float ay = bezierPoint(200, 200, 184, 213, t);
    line (ax, ay, ax, ay+35);
 
    float bx = bezierPoint(42, 33, 46, 51, t);
    float by = bezierPoint(213, 242, 249, 270, t);
    line (bx, by, bx, by-10);
  }
  
  //+++++++++++++++++++++ Hair
  stroke(150);  
  steps = 35;
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);
    float bx = bezierPoint(58, 58, 66, 154, t);
    float by = bezierPoint(185, 185, 86, 85, t);
    float tx = bezierPoint(54, 54, 0, 160, t);
    float ty = bezierPoint(184, 184, 23, 30, t);
    line (bx, by, tx, ty);
  }
  
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);
    float bx = bezierPoint(154, 242, 260, 272, t);
    float by = bezierPoint(85, 84, 118, 181, t);
    float tx = bezierPoint(160, 292, 273, 276, t);
    float ty = bezierPoint(30, 27, 131, 179, t);
    line (bx, by, tx, ty);
  }
  
  //+++++++++++++++++++++ Lips 
  stroke(255); 
  steps = 5;
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);
    float ax = bezierPoint(128, 128, 143, 150, t);
    float ay = bezierPoint(321, 321, 317, 305, t);
    line (ax, ay, ax, 322);
    
    float bx = bezierPoint(150, 157, 166, 167, t);
    float by = bezierPoint(305, 293, 308, 308, t);
    line (bx, by, bx, 320);
    
    float cx = bezierPoint(167, 168, 173, 176, t);
    float cy = bezierPoint(308, 308, 311, 307, t);
    line (cx, cy, cx, 322);
    
    float dx = bezierPoint(176, 179, 188, 192, t);
    float dy = bezierPoint(307, 303, 297, 304, t);
    line (dx, dy, dx, 320);

    float ex = bezierPoint(192, 196, 218, 209, t);
    float ey = bezierPoint(304, 311, 322, 320, t);
    line (ex, ey, ex, 322);
  }
  beginShape();
    noFill();
    stroke(0);
    vertex(131.0, 322.0);
    bezierVertex(131.0, 322.0, 172.0, 303.0, 207.0, 322.0);
  endShape();
  stroke(255);
  
  //+++++++++++++++++++++ Glasses
  steps = 20;
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);
    float x = bezierPoint(73, 73, 173, 160, t);
    float y = bezierPoint(190, 190, 194, 195, t);
    line (x, y+2, x, y-2);
  }
  
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);
    float x = bezierPoint(183, 195, 295, 270, t);
    float y = bezierPoint(193, 204, 185, 195, t);
    line (x, y+2, x, y-2);
  }
    
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);
    float x = bezierPoint(270, 270, 282, 226, t);
    float y = bezierPoint(195, 195, 244, 244, t);
    line (x, y+2, x, y-2);
  }
  
  steps = 15;
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);
    float x = bezierPoint(226, 170, 180, 178, t);
    float y = bezierPoint(244, 244, 226, 217, t);
    line (x, y+2, x, y-2);
  }
  
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);
    float x = bezierPoint(160, 160, 165, 117, t);
    float y = bezierPoint(216, 216, 248, 246, t);
    line (x, y+2, x, y-2);
  }
  
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);
    float x = bezierPoint(117, 69, 73, 71, t);
    float y = bezierPoint(246, 244, 233, 217, t);
    line (x, y+2, x, y-2);
  }
  
  steps = 5;
  for (int i = 0; i <= steps; i++)  {
    float t = i / float(steps);
    float x = bezierPoint(160, 160, 171, 183, t);
    float y = bezierPoint(195, 195, 204, 193, t);
    line (x, y, x, y+10);
  }
  
  if (mousePressed)  {
    stroke(100);
    for (int i = 0; i < 1000; i = i+10)  {
    line(mouseX, i, i, mouseY);
    line(-mouseX, i, i, -mouseY);
    }
  }
}



