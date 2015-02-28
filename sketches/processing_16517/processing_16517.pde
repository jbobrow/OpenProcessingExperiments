
PShape o1, o2, o3, o4, o5, o6;
int page = 0;
PFont f1, f2;

void setup() {
  size(640, 480);
  smooth();
  o1 = loadShape("1.svg");
  o2 = loadShape("5.svg");
  o3 = loadShape("6.svg");
  o4 = loadShape("7.svg");
  o5 = loadShape("8.svg");
  o6 = loadShape("10.svg");
  f1=loadFont("AgencyFB-Bold-48.vlw");
  f2=loadFont("AgencyFB-Reg-30.vlw");
} 

void draw() {
  if(page == 0) {
    background(228, 235, 237);
    pageStart(0,0);
  }
  else if(page == 1) {
    background(255);
    pageOne(0,0);
  }
  else if(page == 2) {
    background(255);
    pageTwo(0,0);
  }
  else if(page == 3) {
    background(255);
    pageThree(0,0);
  }
  else if(page == 4) {
    background(228, 235, 237);
    pageFour(0,0);
  }
  else if(page == 5) {
    background(228, 235, 237);
    pageFive(0,0);
  }
  else if(page == 6) {
    background(228, 235, 237);
    pageSix(0,0);
  }
  else if(page == 7) {
    background(228, 235, 237);
    pageSeven(0,0);
  }
  else if(page == 8) {
    background(255);
    pageEight(0,0);
  }
  else if(page == 9) {
    background(242, 226, 231);
    pageEnd(0,0);
  }
}

void mousePressed() {    
  if (page == 0) {    
    page = 1;
  }   
  else if (page == 1) {    
    page = 2;
  }  
  else if (page == 2) {  
    page = 3;
  }  
  else if (page == 3) {  
    page = 4;
  }    
  else if (page == 4) {  
    page = 5;
  }    
  else if (page == 5) {  
    page = 6;
  }   
  else if (page == 6) {  
    page = 7;
  }  
  else if (page == 7) {  
    page = 8;
  }
  else if (page == 8) {  
    page = 9;
  }
}  

void pageStart(int x, int y) {

  shape(o3, -700, -100);
  shape(o3, -700, -400);

  shape(o3, -650, -50);
  shape(o3, -650, -250);

  shape(o3, -600, -350);
  shape(o3, -600, -150);

  shape(o3, -550, -450);
  shape(o3, -550, -200);

  shape(o3, -500, -100);
  shape(o3, -500, -250);

  shape(o3, -450, -400);
  shape(o3, -450, 50);

  shape(o3, -400, -50);

  shape(o3, -350, -350);
  shape(o3, -350, 0);

  shape(o3, -300, -50);
  shape(o3, -300, -250);

  shape(o3, -250, -150);
  shape(o3, -250, -450);

  shape(o3, -200, 0);
  shape(o3, -200, -300);

  shape(o3, -150, -400);
  shape(o3, -150, -100);

  o1.disableStyle();
  fill(207, 232, 220);
  stroke(139, 205, 193);
  shape(o1, -220, -430);  

  textFont(f1);
  textSize(48);
  fill(255);
  text("DIFFERENT COLOR", 200, 330);
}

void pageOne(int x, int y) {
  o1.disableStyle();
  fill(207, 232, 220);
  stroke(139, 205, 193);
  shape(o1, -200, -350);

  textFont(f2);
  textSize(30);
  fill(228, 235, 237);
  text("I'm alone.", 150, 250);
}

void pageTwo(int x, int y) {
  o1.disableStyle();
  fill(207, 232, 220);
  stroke(139, 205, 193);
  shape(o1, -200, -350);

  fill(56, 116, 85);
  stroke(26, 85, 74);

  shape(o1, -560, -400);
  shape(o1, -560, 0);

  shape(o1, -430, -650);
  shape(o1, -430, -250);

  shape(o1, -300, -550);
  shape(o1, -300, -150);

  shape(o1, -70, -600);
  shape(o1, -70, -200);

  shape(o1, 60, -350);
}

void pageThree(int x, int y) {
  o1.disableStyle();
  fill(207, 232, 220);
  stroke(139, 205, 193);
  shape(o1, -200, -350);

  fill(56, 116, 85);
  stroke(26, 85, 74);

  shape(o1, -560, -400);
  shape(o1, -560, 0);

  shape(o1, -430, -650);
  shape(o1, -430, -250);

  shape(o1, -300, -550);
  shape(o1, -300, -150);

  shape(o1, -70, -600);
  shape(o1, -70, -200);

  shape(o1, 60, -350);

  o2.disableStyle();
  fill(146, 29, 65);
  stroke(115, 35, 66);

  shape(o2, -890, -585);
  shape(o2, -890, -185);

  shape(o2, -760, -435);
  shape(o2, -760, -35);

  shape(o2, -630, -335);

  shape(o2, -400, -385);

  shape(o2, -270, -535);
  shape(o2, -270, -135);
}

void pageFour(int x, int y) {
  o1.disableStyle();
  fill(207, 232, 220);
  stroke(139, 205, 193);
  shape(o1, -200, -350);

  textFont(f2);
  textSize(30);
  fill(255);
  text("Always alone.", 150, 250);
}

void pageFive(int x, int y) {
  o1.disableStyle();
  fill(207, 232, 220);
  stroke(139, 205, 193);
  shape(o1, -200, -350);

  shape(o3, -700, -100);
  shape(o3, -700, -400);

  shape(o3, -650, -50);
  shape(o3, -650, -250);

  shape(o3, -600, -350);
  shape(o3, -600, -150);

  shape(o3, -550, -450);
  shape(o3, -550, -200);

  shape(o3, -500, -100);
  shape(o3, -500, -250);

  shape(o3, -450, -400);
  shape(o3, -450, 50);

  shape(o3, -400, -50);

  shape(o3, -350, -350);
  shape(o3, -350, 0);

  shape(o3, -300, -50);
  shape(o3, -300, -250);

  shape(o3, -250, -150);
  shape(o3, -250, -450);

  shape(o3, -200, 0);
  shape(o3, -200, -300);

  shape(o3, -150, -400);
  shape(o3, -150, -100);

  textFont(f1);
  textSize(48);
  fill(255);
  text("WHY?", 130, 230);
}

void pageSix(int x, int y) {
  o1.disableStyle();
  fill(207, 232, 220);
  stroke(139, 205, 193);
  shape(o1, 0, -350);

  shape(o3, -500, -100);
  shape(o3, -500, -400);

  shape(o3, -450, -50);
  shape(o3, -450, -250);

  shape(o3, -400, -350);
  shape(o3, -400, -150);

  shape(o3, -350, -450);
  shape(o3, -350, -200);

  shape(o3, -300, -100);
  shape(o3, -300, -250);

  shape(o3, -250, -400);
  shape(o3, -250, 50);

  shape(o3, -200, -50);

  shape(o3, -150, -350);
  shape(o3, -150, 0);

  shape(o3, -100, -50);
  shape(o3, -100, -250);

  fill(255);
  noStroke();
  rect(0, 0, 320, 480);

  o4.disableStyle();
  fill(237, 215, 220);
  stroke(219, 170, 187);
  shape(o4, -550, -350);

  textFont(f1);
  textSize(48);
  fill(228, 235, 237);
  text("HE", 280, 240);

  textFont(f1);
  textSize(48);
  fill(255);
  text("Y!", 320, 240);
}

void pageSeven(int x, int y) {
  shape(o3, -500, -100);
  shape(o3, -500, -400);

  shape(o3, -450, -50);
  shape(o3, -450, -250);

  shape(o3, -400, -350);
  shape(o3, -400, -150);

  shape(o3, -350, -450);
  shape(o3, -350, -200);

  shape(o3, -300, -100);
  shape(o3, -300, -250);

  shape(o3, -250, -400);
  shape(o3, -250, 50);

  shape(o3, -200, -50);

  shape(o3, -150, -350);
  shape(o3, -150, 0);

  shape(o3, -100, -50);
  shape(o3, -100, -250);

  fill(255);
  noStroke();
  rect(0, 0, 320, 480);

  o5.disableStyle();
  fill(207, 232, 220);
  stroke(139, 205, 193);
  shape(o5, -50, -350);

  o4.disableStyle();
  fill(237, 215, 220);
  stroke(219, 170, 187);
  shape(o4, -550, -350);

  textFont(f2);
  textSize(30);
  fill(228, 235, 237);
  text("Why don", 250, 200);

  textFont(f2);
  textSize(30);
  fill(255);
  text("'t know?", 320, 200);
}

void pageEight(int x, int y) {
  o5.disableStyle();
  fill(207, 232, 220);
  stroke(139, 205, 193);
  shape(o5, -50, -350);

  o4.disableStyle();
  fill(237, 215, 220);
  stroke(219, 170, 187);
  shape(o4, -550, -350);

  textFont(f2);
  textSize(30);
  fill(228, 235, 237);
  text("You're not alone.", 235, 200);
}

void pageEnd(int x, int y) {
  shape(o6, -700, -100);
  shape(o6, -700, -400);

  shape(o6, -650, -50);
  shape(o6, -650, -250);

  shape(o6, -600, -350);
  shape(o6, -600, -150);

  shape(o6, -550, -450);
  shape(o6, -550, 0);

  shape(o6, -500, -50);

  shape(o6, -450, -150);
  shape(o6, -450, -400);

  shape(o6, -400, -100);

  shape(o6, -350, -350);
  shape(o6, -350, 0);

  shape(o6, -300, -50);
  shape(o6, -300, -300);

  shape(o6, -250, -150);
  shape(o6, -250, -450);

  shape(o6, -200, 0);
  shape(o6, -200, -300);

  shape(o6, -150, -400);
  shape(o6, -150, -100);

  o4.disableStyle();
  fill(237, 215, 220);
  stroke(219, 170, 187);
  shape(o4, -480, -380);

  o5.disableStyle();
  fill(207, 232, 220);
  stroke(139, 205, 193);
  shape(o5, -130, -330);

  textFont(f1);
  textSize(49);
  fill(255,150,150);
  text("Cause I'm stand by YOU.", 147, 351);

  textFont(f1);
  textSize(48);
  fill(255);
  text("Cause I'm stand by YOU.", 150, 350);
}


