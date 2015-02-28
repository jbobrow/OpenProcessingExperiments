
float circle_x = random(width-50);
float circle_y = random(height-50);
float circle2_x = random(width-50);
float circle2_y = random(height-50);
float circle3_x = random(width-50);
float circle3_y = random(height-50);
float circle4_x = random(width-50);
float circle4_y = random(height-50);
float diam = 50;
float move1 = random(4, 5);
float move2 = random(3, 4);
float move3 = random(4, 5);
float move4 = random(3, 4);
float move5 = random(4, 5);
float move6 = random(3, 4);
float move7 = random(4, 5);
float move8 = random(3, 4);
int menu = 0;
int a = 0;
void setup() {
  smooth();
  size(600, 400);
  frameRate(100);
}

void mousePressed() {
  menu = menu+1;
}
void draw() {
  if (menu < 1) {
    cursor();
    fill(0);
    rect(0, 0, width, height);
    fill(#26EDEB);
    textSize(50);
    text("SPACE DODGER", 40, 50);
    textSize(25);
    fill(255);
    text("Click to start", 140, 200);
    fill(255, 0, 0);
    text("here", 165, 225);
  }
  if (menu == 1) {

    a = a +1;
    noCursor();
    background(0);
    stroke(#32ED26);
    fill(#26EDEB);
    ellipse(mouseX, mouseY, diam, diam);

    stroke(#FF0009);
    strokeWeight(4);
    fill(#FFF303);
    ellipse(circle_x, circle_y, diam, diam);
    ellipse(circle2_x, circle2_y, diam, diam);
    circle_x= circle_x + move1;
    circle_y = circle_y + move2;
    circle2_x= circle2_x + move3;
    circle2_y = circle2_y + move4;
    float d1 = dist(circle_x, circle_y, mouseX, mouseY);
    float d2 = dist(circle2_x, circle2_y, mouseX, mouseY);
    if (circle_x>width) {
      circle_x = width;
      move1= -move1;
    }
    if (circle_y > height) {
      circle_y = height;
      move2 = -move2;
    }
    if (circle_x < 0) {
      circle_x = 0;
      move1 = -move1;
    }
    if (circle_y < 0) {
      circle_y=0;
      move2= -move2;
    }
    if (circle2_x>width) {
      circle2_x = width;
      move3= -move3;
    }
    if (circle2_y > height) {
      circle2_y = height;
      move4 = -move4;
    }
    if (circle2_x < 0) {
      circle2_x = 0;
      move3 = -move3;
    }
    if (circle2_y < 0) {
      circle2_y=0;
      move4= -move4;
    }
    fill(255);
    textSize(12);
    text("Score "+a/65, 0, 10);
    if (d1 < diam) {
      menu = menu + 1;
    }
    if (d2 < diam) {
      menu = menu + 1;
    }
  }
  if (a/65 >19) {
    fill(#FFF303);
    ellipse(circle3_x, circle3_y, diam, diam);
    circle3_x= circle3_x + move5;
    circle3_y = circle3_y + move6;
     float d3 = dist(circle3_x, circle3_y, mouseX, mouseY);
      if (circle3_x>width) {
      circle3_x = width;
      move5= -move5;
    }
    if (circle3_y > height) {
      circle3_y = height;
      move6 = -move6;
    }
    if (circle3_x < 0) {
      circle3_x = 0;
      move5 = -move5;
    }
    if (circle3_y < 0) {
      circle3_y=0;
      move6= -move6;
    }
       if (d3 < diam) {
      menu = menu + 1;
    }
  }
    if (a/65 >39) {
    fill(#FFF303);
    ellipse(circle4_x, circle4_y, diam, diam);
    circle4_x= circle4_x + move7;
    circle4_y = circle4_y + move8;
     float d4 = dist(circle4_x, circle4_y, mouseX, mouseY);
      if (circle4_x>width) {
      circle4_x = width;
      move7= -move7;
    }
    if (circle4_y > height) {
      circle4_y = height;
      move8 = -move8;
    }
    if (circle4_x < 0) {
      circle4_x = 0;
      move7 = -move7;
    }
    if (circle4_y < 0) {
      circle4_y=0;
      move8= -move8;
    }
       if (d4 < diam) {
      menu = menu +1;
      
    }
  }

    if (menu > 1) {
      noStroke();
      fill(0);
      rect(0, 0,width, height);
      fill(255, 0, 0);
      textSize(50);
      text("YOU DIED", 100, 100);
      fill(255);
      textSize(25);
      text("Final Score:" +a/65, 130, 200);
      text("Press R to restart", 110, 250);
    }
      
  }

  void keyPressed() {
    if(key == 'r' ||key == 'R'){
      menu = 0;
   int( a = 0);
    circle_x = random(width);
    circle_y = random(height);
    circle2_x = random(width);
    circle2_y = random(height);
    circle3_x = random(width);
    circle3_y = random(height);
    circle4_x = random(width);
    circle4_y = random(height);
    move1 = random(4, 5);
    move2 = random(3, 4);
    move3 = random(4, 5);
    move4 = random(3, 4);
    move5 = random(4, 5);
    move6 = random(3, 4);
    move7 = random(4, 5);
    move8 = random(3, 4);
  }
  }
