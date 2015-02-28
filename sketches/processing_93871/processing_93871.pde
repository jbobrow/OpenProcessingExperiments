
float dragbarx = 112.5; //drag bar x
float dragbary = 125; //dragbar starting Y
float dragbarw = 25; //dragbar width
float dragbarh = 10; //dragbar height
float rectx = 100; // large rectangle x
float recty = 75; // large rectangle y
float rectw = 50; // large rectangle width
float recth = 100; // large rectangle height
float linex1 = 125;
float linex2 = 75;
float liney1 = 125;
float liney2 = 175;
void setup() {
  size(250, 250); // size of canvas
  colorMode(RGB, 255, 255, 255);
}
void mouseDragged() {
  dragbary = constrain(mouseY,75,165);
  float sY = norm(mouseY,75,175);
}
void draw() {
  background(255);
  rect(rectx, recty, rectw, recth); //large rectangle
  line(linex1, linex2, liney1, liney2); // center line
  rect(dragbarx, dragbary, dragbarw, dragbarh);
      if (dragbary<80) {
    text("100%", 50, 90);
    fill (227,27,27);
  } 
    else if (dragbary<85) {
        text("90%", 50, 90);
    fill (255,0,0);
    }
  else if (dragbary<95) {
        text("80%", 50, 90);
    fill (255,0,0);
  }
  else if (dragbary<105) {
        text("70%", 50, 90);
    fill (255, 77, 0);
  }
  else if (dragbary<115) {
        text("60%", 50, 90);
    fill (232, 139, 16);
  }
  else if (dragbary<125) {
            text("50%", 50, 90);
    fill (242, 201, 111);
  }
  else if (dragbary<135) {
            text("40%", 50, 90);
    fill (111,229,242);
  }
    else if (dragbary<145) {
              text("30%", 50, 90);
    fill (58,131,214);
  }
    else if (dragbary<155) {
              text("20%", 50, 90);
    fill (68,23,232);
  }
      else if (dragbary<165) {
                text("10%", 50, 90);
    fill (39,51,217);
  }
        else if (dragbary<170) {
                text("0%", 50, 90);
    fill (39,51,217);
  }
 
  else {
    fill(255);
  }
}

