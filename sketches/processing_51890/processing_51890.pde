
int ellipsexy = 200;
int rect1x = 255;
int rect2x = 280;
int rect3x = 310;
int rect4x = 285;
int rect5x = 290;
int rect6x = 270;
int maxjitter = 10;
float op;
float jitter = random(maxjitter);


void setup () {
  background(255);
  size(400,400);
  frameRate(10);
}

void draw() {
  background(255);
  if (jitter < 0) {
   jitter = random(maxjitter)*-1;
  } else {
   jitter = random(maxjitter); 
}
  if (mousePressed == true) {
    fill(0);
    smooth();
    ellipse(ellipsexy+jitter, ellipsexy, 300, 300);
    fill(255);
    noStroke();
    rect(rect1x+jitter, 93, 80, 35);
    rect(rect2x+jitter, 132,70,30);
    rect(rect3x+jitter, 167,47,37);
    rect(rect4x+jitter, 210, 70, 35);
    rect(rect5x+jitter, 250, 70, 30);
    rect(rect6x+jitter, 285, 90, 35);
    fill(190, 114, 0);
    stroke(0);
    strokeWeight(1);
    rect(260+jitter, 95, 10, 10);
    rect(260+jitter, 115, 10, 10);
    rect(275+jitter, 95, 10, 10);
    rect(275+jitter, 115, 10, 10);
    rect(290+jitter, 95, 10, 10);
    rect(290+jitter, 115, 10, 10);
    rect(305+jitter, 115, 10, 10);
    rect(285+jitter, 134, 10, 10);
    rect(285+jitter, 150, 10, 10);
    rect(300+jitter, 134, 10, 10);
    rect(300+jitter, 150, 10, 10);
    rect(315+jitter, 134, 10, 10);
    rect(315+jitter, 150, 10, 10);
    rect(315+jitter, 169, 10, 10);
    rect(315+jitter, 189, 10, 10);
    rect(330+jitter, 169, 10, 10);
    rect(330+jitter, 189, 10, 10);
    rect(290+jitter, 212, 10, 10);
    rect(290+jitter, 232, 10, 10);
    rect(305+jitter, 212, 10, 10);
    rect(305+jitter, 232, 10, 10);
    rect(320+jitter, 212, 10, 10);
    rect(320+jitter, 232, 10, 10);
    rect(335+jitter, 212, 10, 10);
    rect(335+jitter, 232, 10, 10);
    rect(295+jitter, 252, 10, 10);
    rect(295+jitter, 267, 10, 10);
    rect(310+jitter, 252, 10, 10);
    rect(310+jitter, 267, 10, 10);
    rect(325+jitter, 252, 10, 10);
    rect(275+jitter, 287, 10, 10);
    rect(275+jitter, 305, 10, 10);
    rect(290+jitter, 287, 10, 10);
    rect(290+jitter, 305, 10, 10);
    rect(305+jitter, 287, 10, 10);
  
    jitter *= -1;
// Snow code borrowed from Johan Lee, altered slightly by me    
  fill(0, 0, 0, 75);
  //rect(200, 200, width, height);
  stroke(255, 255, 255);
  strokeWeight(3);
 
  for (int i = 0; i < 10; i = i+1)
  {
    for (int j=0; j<10; j=j+1)
    {
      point(random(i*40, (i+1)*40), random(height));
    }
  }
 
  fill(255, 255, 255);
  rect(0, (550-frameCount/5), width, (50+frameCount/5));
 
  noStroke();
    
  } else {
    fill(0);
    smooth();
    ellipse(ellipsexy,ellipsexy, 300,300);
    fill(255);
    noStroke();
    rect(rect1x, 93, 80, 35);
    rect(rect2x, 132,70,30);
    rect(rect3x, 167,47,37);
    rect(rect4x, 210, 70, 35);
    rect(rect5x, 250, 70, 30);
    rect(rect6x, 285, 90, 35);
    
   //color c = color(255, 204, 0, op);
   fill(190, 114, 0, op);
    if (random(10) > 7) {
      op = random(70,100);
    } else {op = random(0,30);
    } 
    stroke(0);
    strokeWeight(1);
    rect(260, 95, 10, 10);
    rect(260, 115, 10, 10);
    rect(275, 95, 10, 10);
    rect(275, 115, 10, 10);
    rect(290, 95, 10, 10);
    rect(290, 115, 10, 10);
    rect(305, 115, 10, 10);
    rect(285, 134, 10, 10);
    rect(285, 150, 10, 10);
    rect(300, 134, 10, 10);
    rect(300, 150, 10, 10);
    rect(315, 134, 10, 10);
    rect(315, 150, 10, 10);
    rect(315, 169, 10, 10);
    rect(315, 189, 10, 10);
    rect(330, 169, 10, 10);
    rect(330, 189, 10, 10);
    rect(290, 212, 10, 10);
    rect(290, 232, 10, 10);
    rect(305, 212, 10, 10);
    rect(305, 232, 10, 10);
    rect(320, 212, 10, 10);
    rect(320, 232, 10, 10);
    rect(335, 212, 10, 10);
    rect(335, 232, 10, 10);
    rect(295, 252, 10, 10);
    rect(295, 267, 10, 10);
    rect(310, 252, 10, 10);
    rect(310, 267, 10, 10);
    rect(325, 252, 10, 10);
    rect(275, 287, 10, 10);
    rect(275, 305, 10, 10);
    rect(290, 287, 10, 10);
    rect(290, 305, 10, 10);
    rect(305, 287, 10, 10);
  } 
  if (mouseButton == RIGHT) {
  maxjitter = 0;
  translate(400, 0);
  rotate(PI/2.0);
  fill(0);
  smooth();
  ellipse(ellipsexy,ellipsexy, 300,300);
  fill(255);
  noStroke();
  rect(rect1x, 93, 80, 35);
  rect(rect2x, 132,70,30);
  rect(rect3x, 167,47,37);
  rect(rect4x, 210, 70, 35);
  rect(rect5x, 250, 70, 30);
  rect(rect6x, 285, 90, 35);
  fill(190, 114, 0);
    stroke(0);
    strokeWeight(1);
    rect(260, 95, 10, 10);
    rect(260, 115, 10, 10);
    rect(275, 95, 10, 10);
    rect(275, 115, 10, 10);
    rect(290, 95, 10, 10);
    rect(290, 115, 10, 10);
    rect(305, 115, 10, 10);
    rect(285, 134, 10, 10);
    rect(285, 150, 10, 10);
    rect(300, 134, 10, 10);
    rect(300, 150, 10, 10);
    rect(315, 134, 10, 10);
    rect(315, 150, 10, 10);
    rect(315, 169, 10, 10);
    rect(315, 189, 10, 10);
    rect(330, 169, 10, 10);
    rect(330, 189, 10, 10);
    rect(290, 212, 10, 10);
    rect(290, 232, 10, 10);
    rect(305, 212, 10, 10);
    rect(305, 232, 10, 10);
    rect(320, 212, 10, 10);
    rect(320, 232, 10, 10);
    rect(335, 212, 10, 10);
    rect(335, 232, 10, 10);
    rect(295, 252, 10, 10);
    rect(295, 267, 10, 10);
    rect(310, 252, 10, 10);
    rect(310, 267, 10, 10);
    rect(325, 252, 10, 10);
    rect(275, 287, 10, 10);
    rect(275, 305, 10, 10);
    rect(290, 287, 10, 10);
    rect(290, 305, 10, 10);
    rect(305, 287, 10, 10);
    
  // Snow code borrowed from Johan Lee, altered slightly by me    
  fill(0, 0, 0, 75);
  //rect(200, 200, width, height);
  stroke(255, 255, 255);
  strokeWeight(3);
 
  for (int i = 0; i < 10; i = i+1)
  {
    for (int j=0; j<10; j=j+1)
    {
      point(random(i*40, (i+1)*40), random(height));
    }
  }
  } 
}




