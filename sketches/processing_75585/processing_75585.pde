

int page = 1;
PImage start11;
PImage start2;
PImage page2;
PImage page22;

boolean hovermouse = false;

void setup()
    {
      size(700,700);
      start11 = loadImage("start_screen.png");
      start2 = loadImage("start_screen_highlight.png");
      page2 = loadImage("screen_2_ifyouarereading.png");
      page22 = loadImage("screen_3_hover_ifyouare.png");
    }

void draw() {
  hovercheck();
  background(255);
  drawpage();
}
    
  
void mousePressed() {
  if (page == 1) {
    //Condition to turn page
    if (mouseX>300 && mouseX<380 && mouseY>325 && mouseY<365 ){
      page = 2;
    }
  }
  else if (page == 2) {
    
  }
}

void hovercheck() {
  if (page == 1) {
    if (mouseX>300 && mouseX<380 && mouseY>325 && mouseY<365 ) {
      hovermouse = true;
    }
    else {
      hovermouse = false;
    }
  }
  else if (page == 2) {
    if (mouseX>300 && mouseX<355 && mouseY>400 && mouseY<435 ) {
      hovermouse = true;
    }
    else {
      hovermouse = false;
    }
  }
}

void drawpage() {
  //Edit this to change page, increasing for each new page
  if (page == 1) {
    if (hovermouse) {
      //Hovering
      image(start2, 0, 0);
    }
    else {
      //Normal page
      image(start11, 0, 0);
    }
  }
  else if (page == 2) {
    if (hovermouse) {
      //Hovering
      image(page22, 0, 0);
    }
    else {
      //Normal page
      image(page2, 0, 0);
    }
  }
}

