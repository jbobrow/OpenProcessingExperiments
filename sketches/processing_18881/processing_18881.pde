
float easing =0.01;
float pouseX;
float pouseY;
float angle1=0.0;
float angleDirection = 1;
float speed= 0.005;


void setup() {
  size(600, 500);
}

void draw() {
  background(100);
  smooth();


  float targetX = mouseX;
  pouseX += (targetX- pouseX)*easing;
  float targetY =mouseY ;
  pouseY += (targetY- pouseY)*easing; 

  float r = dist (mouseX, mouseY, pouseX+50, pouseY);
  float l = dist (mouseX, mouseY, pouseX-50, pouseY);

  fill(255, 0, 0);
  ellipse(pouseX, pouseY +80, 200, 200);




  if(mousePressed) {

    strokeWeight(5);

    fill(255);
    ellipse(pouseX, pouseY+ 100, 80, 60);//mouth
    line(pouseX - 10, pouseY+ 90, pouseX- 50, pouseY-20);
    line(pouseX - 90, pouseY + 90, pouseX - 50, pouseY-20);
    line(pouseX -50, pouseY + 100, pouseX - 50, pouseY-20);
    line(pouseX + 10, pouseY+ 90, pouseX+ 50, pouseY-20);
    line(pouseX + 90, pouseY + 90, pouseX + 50, pouseY-20);
    line(pouseX + 50, pouseY + 100, pouseX + 50, pouseY-20);
    fill(255, 0, 0);  
    ellipse(pouseX - 50, pouseY, 100, 100);
    ellipse(pouseX + 50, pouseY, 100, 100);
    fill(0);
    ellipse(pouseX, pouseY+50, 60, 40);//nose
  }

  else if(l < 25) {
    strokeWeight(5);
    stroke(0);

    line(pouseX - 10, pouseY- 90, pouseX- 50, pouseY +20);
    line(pouseX - 90, pouseY - 90, pouseX - 50, pouseY+20);
    line(pouseX -50, pouseY - 100, pouseX - 50, pouseY+20);
    line(pouseX + 10, pouseY- 90, pouseX+ 50, pouseY+20);
    line(pouseX + 90, pouseY - 90, pouseX + 50, pouseY+20);
    line(pouseX + 50, pouseY - 100, pouseX + 50, pouseY+20);
    fill(255);  
    ellipse(pouseX - 50, pouseY, 100, 100);
    ellipse(pouseX + 50, pouseY, 100, 100);

    //righteye
    float centerX2 = pouseX + 50;
    float centerY2 = pouseY;
    float radius2 = 25;

    float angle2 = atan2(mouseY - centerY2, mouseX - centerX2);

    // draw the center point  
    fill(255);
    noStroke();
    ellipse(centerX2, centerY2, 1, 1);

    // draw the limit
    noFill();
    stroke(255);
    ellipse(centerX2, centerY2, radius2 * 2, radius2 * 2);

    // the magic circle equation
    float x2 = centerX2 + cos(angle2) * radius2;
    float y2 = centerY2 + sin(angle2) * radius2;

    // draw the guy
    fill(0);
    stroke(0);
    ellipse(x2, y2, 40, 40);

    fill(0);
    ellipse (pouseX-50, pouseY, 40, 40);//right eye
    fill(255);
    ellipse(pouseX, pouseY+ 90, 80, 10);
    fill(0);
    ellipse(pouseX, pouseY+50, 60, 40);//nose
  }

  else if(r < 25) {
    strokeWeight(5);
    stroke(0);

    line(pouseX - 10, pouseY- 90, pouseX- 50, pouseY +20);
    line(pouseX - 90, pouseY - 90, pouseX - 50, pouseY+20);
    line(pouseX -50, pouseY - 100, pouseX - 50, pouseY+20);
    line(pouseX + 10, pouseY- 90, pouseX+ 50, pouseY+20);
    line(pouseX + 90, pouseY - 90, pouseX + 50, pouseY+20);
    line(pouseX + 50, pouseY - 100, pouseX + 50, pouseY+20);
    fill(255);  
    ellipse(pouseX - 50, pouseY, 100, 100);
    ellipse(pouseX + 50, pouseY, 100, 100);

    //lefteye
    float centerX = pouseX - 50;
    float centerY = pouseY;
    float radius = 25;

    float angle = atan2(mouseY - centerY, mouseX - centerX);

    // draw the center point  
    fill(255);
    noStroke();
    ellipse(centerX, centerY, 1, 1);

    // draw the limit
    noFill();
    stroke(255);
    ellipse(centerX, centerY, radius * 2, radius * 2);

    // the magic circle equation
    float x = centerX + cos(angle) * radius;
    float y = centerY + sin(angle) * radius;

    // draw the guy
    fill(0);
    stroke(0);
    ellipse(x, y, 40, 40);

    fill(0);
    ellipse (pouseX+50, pouseY, 40, 40);//right eye
    fill(255);
    ellipse(pouseX, pouseY+ 90, 80, 10);
    fill(0);
    ellipse(pouseX, pouseY+50, 60, 40);//nose
  }
  else {

    strokeWeight(5);
    line(pouseX - 10, pouseY- 90, pouseX- 50, pouseY +20);
    line(pouseX - 90, pouseY - 90, pouseX - 50, pouseY+20);
    line(pouseX -50, pouseY - 100, pouseX - 50, pouseY+20);
    line(pouseX + 10, pouseY- 90, pouseX+ 50, pouseY+20);
    line(pouseX + 90, pouseY - 90, pouseX + 50, pouseY+20);
    line(pouseX + 50, pouseY - 100, pouseX + 50, pouseY+20);
    fill(255);  
    ellipse(pouseX - 50, pouseY, 100, 100);
    ellipse(pouseX + 50, pouseY, 100, 100);

    //lefteye
    float centerX = pouseX - 50;
    float centerY = pouseY;
    float radius = 25;

    float angle = atan2(mouseY - centerY, mouseX - centerX);

    // draw the center point  
    fill(255);
    noStroke();
    ellipse(centerX, centerY, 1, 1);

    // draw the limit
    noFill();
    stroke(255);
    ellipse(centerX, centerY, radius * 2, radius * 2);

    // the magic circle equation
    float x = centerX + cos(angle) * radius;
    float y = centerY + sin(angle) * radius;

    // draw the guy
    fill(0);
    stroke(0);
    ellipse(x, y, 40, 40);
    //righteye
    float centerX2 = pouseX + 50;
    float centerY2 = pouseY;
    float radius2 = 25;

    float angle2 = atan2(mouseY - centerY2, mouseX - centerX2);

    // draw the center point  
    fill(255);
    noStroke();
    ellipse(centerX2, centerY2, 1, 1);

    // draw the limit
    noFill();
    stroke(255);
    ellipse(centerX2, centerY2, radius2 * 2, radius2 * 2);

    // the magic circle equation
    float x2 = centerX2 + cos(angle2) * radius2;
    float y2 = centerY2 + sin(angle2) * radius2;

    // draw the guy
    fill(0);
    stroke(0);
    ellipse(x2, y2, 40, 40);

    fill(255);
    ellipse(pouseX, pouseY+ 90, 80, 10);
    fill(0);
    ellipse(pouseX, pouseY+50, 60, 40);//nose
  }

  translate(pouseX, pouseY+100);
  rotate(angle1);
  fill(255, 0, 0);
  ellipse(100, 100, 100, 100);
  translate(100, 100);
  rotate(angle1);
  ellipse(60, 60, 50, 50);
  angle1 += speed * angleDirection;
  if ((angle1 > HALF_PI) || (angle1 < -QUARTER_PI)) {
    angleDirection *= -1 ;
  }
}


