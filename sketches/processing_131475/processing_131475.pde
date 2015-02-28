

int spacing=0;
color brushColor;
float someScale=1;
float someRotate=1;
float inc=.1;
float old_mouseX=0;
float old_mouseY=0;

void setup() {
  size(640, 480);
  fill(0, 0, 0);
  colorMode(RGB);
  println("KEYS: 1 = bigger, 2 = smaller, 3 = counter spin, 4 = clock spin");
  println("BRUSH: LMB = plain brush, MMB = freeform ilne tool, RMB = Ellipse/Tint Canvas");
  println("Hint: Brushes use 1,2,3 & 4 to adjust parameters");
}

void draw() {

  if (keyPressed) {
    if (key == '1'&& someScale<8) {
      someScale+=.2;
    }
    if (key == '2'&&someScale>0.1) {
      someScale-=.1;
    }
    if (key == '4') {
      if (someRotate<2*PI&&someRotate>0) {
        someRotate-=0.1;
        //println(someRotate);
      }
      else if (someRotate<=0) {
        someRotate=6.28;
      }
    }
    if (key == '3') {
      if (someRotate<2*PI) {
        someRotate+=0.1;
        //println(someRotate);
      }
      else if (someRotate>=2*PI||someRotate<0) {
        someRotate=0;
      }
    }
  }

  if (mousePressed == true && mouseX < 64 && mouseY < 64 ) {
    brushColor = get(mouseX, mouseY);
  }
  if (mousePressed==true && (mouseButton == RIGHT)&&(mouseX > 64 || mouseY > 64)) {
    strokeWeight(someScale);
    stroke(brushColor);
    line(mouseX, mouseY, old_mouseX, old_mouseY);
    line(mouseX, mouseY, mouseX+(someScale*random(-16,16)), mouseY+(someScale*random(-16,16)));
    line(mouseX, mouseY, mouseX+(someScale*random(-16,16)), mouseY+(someScale*random(-16,16)));
    old_mouseX=mouseX;
    old_mouseY=mouseY;
  }
  if (mousePressed==true && (mouseButton == CENTER)&&(mouseX > 64 || mouseY > 64)) {

    ellipseMode(CENTER);
    fill(brushColor, 255);
    ellipse(mouseX, mouseY, random(-16,16)*someScale, random(-16,16)*someScale);
    fill(brushColor, someRotate*4);
    rect(0, 0, width, height);
    old_mouseX=mouseX;
    old_mouseY=mouseY;
    println(someRotate);
    println(someScale);
  }
  if (mousePressed && (mouseButton == LEFT)&&(mouseX > 64 || mouseY > 64)) {

    fill(brushColor);


    pushMatrix();
    translate(mouseX, mouseY);
    rotate(someRotate);
    scale(someScale);  
    triangle(-16, -16, 16, -16, 8, 16);

    popMatrix();

    println(someRotate);
    old_mouseX=mouseX;
    old_mouseY=mouseY;
  }
  fill(255);
  noStroke();
  fill(255);
  rect(0, 0, 64, 64);
  for (int w=0;w<3;w++) {//draw color circle grid
    for (int h=0;h<3;h++) {
      fill(w*85, h*85, 255);
      noStroke();
      ellipse(16*w+16, 16*h+16, 16, 16);
    }
  }
}



