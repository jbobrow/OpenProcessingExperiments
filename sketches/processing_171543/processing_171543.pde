

int dim;
int state = 0;
int count = 0;
float h;
float s;
float b;
float xpos;
float ypos;



void setup() {
  size(700, 700);
  dim = width/2;
  colorMode(HSB, 360, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
}

void draw() {
  background(0);
  
    drawGradient(width/2, height/2);
    
  } 




void drawGradient(float x, float y) {
  int radius = 2*dim;
  for (int r = radius; r > 400; --r) {
    fill(h, s, b);
    ellipse(x, y, r, r);
    h = (h + .4) % 360;
    fill(61,85,97, 200);
  ellipse(xpos, ypos, 60,60);
  }
  
  if (state == 0) {
    count++;
    h = 120;
    s = 80;
    b = 100;
    xpos = 350;
    ypos = 50;
    if (count == 5) {
      state = 1;
    }
  }
  
  if (state ==1) {
    count++;
    h = 120;
    s = 80;
    b = 80;
    xpos = 175;
    ypos = 180;
    if (count == 10) {
      state = 2;
    }
  }
  
  if (state ==2) {
    count++;
    h = 130;
    s = 75;
    b = 75;
    xpos = 100;
    ypos = 400;
    if (count == 15) {
      state = 3;
    }
  }
  
  if (state ==3) {
    count++;
    h = 150;
    s = 70;
    b = 70;
    xpos = 50;
    ypos = 680;
    if (count == 20) {
      state = 4;
    }
  }
  
  if (state ==4) {
    count++;
    h = 140;
    s = 65;
    b = 65;
    xpos = 250;
    ypos = 710;
    if (count == 25) {
      state = 5;
    }
  }
  
  if (state ==5) {
    count++;
    h = 130;
    s = 65;
    b = 40;
    xpos = 300;
    ypos = 720;
    if (count == 30) {
      state = 6;
    }
  }
  
  if (state ==6) {
    count++;
    h = 130;
    s = 55;
    b = 20;
    xpos = 350;
    ypos = 730;
    if (count == 35) {
      state = 7;
    }
  }
  
  if (state ==7) {
    count++;
    h = 130;
    s = 65;
    b = 40;
    xpos = 400;
    ypos = 720;
    if (count == 40) {
      state = 8;
    }
  }
  
  if (state ==8) {
    count++;
    h = 130;
    s = 45;
    b = 60;
    xpos = 450;
    ypos = 710;
    if (count == 45) {
      state = 9;
    }
  }
  
  if (state ==9) {
    count++;
    h = 114;
    s = 40;
    b = 80;
    xpos = 650;
    ypos = 680;
    if (count == 50) {
      state = 10;
    }
  }
  
  if (state ==10) {
    count++;
    h = 120;
    s = 50;
    b = 80;
    xpos = 600;
    ypos = 400;
    if (count == 55) {
      state = 11;
    }
  }
  
  if (state ==11) {
    count++;
    h = 130;
    s = 70;
    b = 80;
    xpos = 525;
    ypos = 180;
    if (count == 60) {
      count = 0;
      state = 0;
    }
  }
}


  





