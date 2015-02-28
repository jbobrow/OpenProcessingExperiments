

PImage imgmap;

void setup() {
  size(1350, 600);
  imgmap = loadImage("No_colonies_blank_world_map.png");
  PFont font;
  font = loadFont("AgencyFB-Reg-48.vlw");
  textFont(font, 40);
}

void draw() {

  background(0);

  image(imgmap, 0, 0);
  {
    fill(235,252,0);
    rect(550, 100, 10, 10);
    fill(53,252,0);
    rect(200, 100, 10, 10);
    fill(255,0,0);
    rect(150, 175, 10, 10);
    fill(252,25,0);
    rect(670, 360, 10, 10);
    fill(252,75,0);
    rect(875, 80, 10, 10);
    fill(252,131,0);
    rect(350, 400, 10, 10);
    fill(252,221,0);
    rect(130, 250, 10, 10);
    fill(188,252,0);
    rect(1100, 475, 10, 10);
    fill(0,255,0);
    rect(640, 360, 10, 10);
    fill(117,252,0);
    rect(950, 200, 10, 10);
  }
  
  fill(0);
  text("Incarceration rates per 100,000      Red = high, Green = low", 20, 550);

  if (mouseX >=550 && mouseX <= 560) {
    if (mouseY >=100 && mouseY <=110) {
      fill(0);
      text("United Kindom: 156", width/4, 50);
    }
  }
  if (mouseX >=200 && mouseX <= 210) {
    if (mouseY >=100 && mouseY <=110) {
      fill(0);
      text("Canada: 117", width/4, 50);
    }
  }
  if (mouseX >=150 && mouseX <= 160) {
    if (mouseY >=175 && mouseY <=185) {
      fill(0);
      text("United States of America: 743", width/4, 50);
    }
  }
  if (mouseX >=670 && mouseX <= 680) {
    if (mouseY >=360 && mouseY <=370) {
      fill(0);
      text("Rwanda: 595", width/4, 50);
    }
  }
  if (mouseX >=875 && mouseX <= 885) {
    if (mouseY >=80 && mouseY <=90) {
      fill(0);
      text("Russian Federation: 550", width/4, 50);
    }
  }
  if (mouseX >=350 && mouseX <= 360) {
    if (mouseY >=400 && mouseY <=410) {
      fill(0);
      text("Brazil: 253", width/4, 50);
    }
  }
  if (mouseX >=130 && mouseX <= 140) {
    if (mouseY >=250 && mouseY <=260) {
      fill(0);
      text("Mexico: 200", width/4, 50);
    }
  }
  if (mouseX >=1100 && mouseX <=1110 ) {
    if (mouseY >=475 && mouseY <=485) {
      fill(0);
      text("Australia: 133", width/4, 50);
    }
  }
  if (mouseX >=640 && mouseX <= 650) {
    if (mouseY >=360 && mouseY <=370) {
      fill(0);
      text("Congo: 26", width/4, 50);
    }
  }
  if (mouseX >=950 && mouseX <= 960) {
    if (mouseY >=200 && mouseY <=210) {
      fill(0);
      text("China: 122", width/4, 50);
    }
  }
}




