
float a = 20;
float b = 20;
float c = 20; 
float d = 20;
float e = 20;
float f = 20; 
Boolean hover1 = false;
Boolean hover2 = false;
Boolean hover3 = false;
Boolean hover4 = false;
Boolean hover5 = false;
Boolean hover6 = false;
Boolean bt_hover1 = false;
Boolean bt_hover2 = false;
Boolean bt_press1 = false;
Boolean bt_press2 = false;
PImage bg_pic;
PImage bt_coool;
PImage bt_ahole;

void setup() {
  size(500, 500);
  bg_pic = loadImage("bg_pic.jpg");
  bt_coool = loadImage("bt_coool.png");
  bt_ahole = loadImage("bt_ahole.png");
}


void draw() {
  background(0, 0, 0);
  noStroke();

  float cr = 241;
  float cg = 255;
  float cb = 57;


  if (hover1 == true) {
    a = mouseY;
  }
  if (hover2 == true) {
    b = mouseY;
  }
  if (hover3 == true) {
    c = mouseY;
  }
  if (hover4 == true) {
    d = mouseY;
  }
  if (hover5 == true) {
    e = mouseY;
  }
  if (hover6 == true) {
    f = mouseY;
  }

  if (bt_hover1 == true) {
    tint(random(255), random(255), random(255));
  }
  image(bt_coool, 450, 270);  //bottons
  noTint();

  if (bt_hover2 == true) {
    tint(random(255), random(255), random(255));
  }
  image(bt_ahole, 450, 380);
  noTint();

  if (bt_press2 == true) {
    noTint();
  }
  if (bt_press1 == true) {
    tint(random(255), random(255), random(255), 100);
    image(bg_pic, 0, 0);
    cr = random(255);
    cg = random(255);
    cb = random(255);
    a = random(height);
    b = random(height - 10);
    c = random(height - 20);
    d = random(height - 10);
    e = random(height - 20);
    f = random(height - 10);
  }



  fill(cr, cg, cb); //drawing rects
  rect(0, 0, 50, a);
  rect(60, 0, 50, b);
  rect(120, 0, 50, c);
  rect(180, 0, 50, d);
  rect(240, 0, 50, e);
  rect(300, 0, 50, f);
}

void mouseMoved() {
  if (mouseX >0 && mouseX < 50) {
    hover1 = true;
    hover2 = false;
    hover3 = false;
    hover4 = false;
    hover5 = false;
    hover6 = false;
  } else if (mouseX >60 && mouseX < 110) {
    hover2 = true;
    hover1 = false;
    hover3 = false;
    hover4 = false;
    hover5 = false;
    hover6 = false;
  } else if (mouseX >120 && mouseX < 170) {
    hover3 = true;
    hover1 = false;
    hover2 = false;
    hover4 = false;
    hover5 = false;
    hover6 = false;
  } else if (mouseX >180 && mouseX < 230) {
    hover4 = true;
    hover1 = false;
    hover2 = false;
    hover3 = false;
    hover5 = false;
    hover6 = false;
  } else if (mouseX >240 && mouseX < 290) {
    hover5 = true;
    hover1 = false;
    hover2 = false;
    hover4 = false;
    hover3 = false;
    hover6 = false;
  } else if (mouseX >300 && mouseX < 350) {
    hover6 = true;
    hover1 = false;
    hover2 = false;
    hover4 = false;
    hover5 = false;
    hover3 = false;
  } else if (mouseX > 450 && mouseX < 500 && mouseY > 270 && mouseY < 370) {
    bt_hover1 = true;
  } else if (mouseX > 450 && mouseX < 500 && mouseY > 380 && mouseY < 480) {
    bt_hover2 = true;
  } else {
    hover1 = false;
    hover2 = false;
    hover3 = false;
    hover4 = false;
    hover5 = false;
    hover6 = false;
    bt_hover1 = false;
    bt_hover2 = false;
  }
}  

void mousePressed() {
  if (mouseX > 450 && mouseX < 500 && mouseY > 270 && mouseY < 370) {
    bt_press1 = true;
  } else if (mouseX > 450 && mouseX < 500 && mouseY > 380 && mouseY < 480) {
    bt_press2 = true;
    bt_press1 = false;
  }
}



