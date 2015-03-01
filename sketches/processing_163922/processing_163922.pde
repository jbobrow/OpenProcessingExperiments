
void setup() {
  size(700, 700);
  background(255);
  frameRate(30);
  textSize(32);
  fill(0);
  text("Select Your Offset", 200, 150);
  text("100", 90, 290);
  text("200", 190, 290);
  text("300", 290, 290);
  text("400", 390, 290);
  text("500", 490, 290);
  text("600", 590, 290);
  textSize(20);
  text("To Save Your Image Press 'S'",220,600);
}
int x;
float y;
int c=0;
int r=100;
int d;
void draw() {
  if (mousePressed==true && mouseX<155 && mouseX>85 && 250<mouseY && mouseY<300) {
    d=100;
    background(255);
    x=0;
    y=0;
    c=5;
  } else if (mousePressed==true && mouseX<255 && mouseX>185 && 250<mouseY && mouseY<300) {
    d=200;
    background(255);
    x=0;
    y=0;
    c=5;
  } else if (mousePressed==true && mouseX<255 && mouseX>185 && 250<mouseY && mouseY<300) {
    d=200;
    background(255);
    x=0;
    y=0;
    c=5;
  } else if (mousePressed==true && mouseX<355 && mouseX>285 && 250<mouseY && mouseY<300) {
    d=300;
    background(255);
    x=0;
    y=0;
    c=5;
  } else if (mousePressed==true && mouseX<455 && mouseX>385 && 250<mouseY && mouseY<300) {
    d=400;
    background(255);
    x=0;
    y=0;
    c=5;
  } else if (mousePressed==true && mouseX<555 && mouseX>485 && 250<mouseY && mouseY<300) {
    d=500;
    background(255);
    x=0;
    y=0;
    c=5;
  } else if (mousePressed==true && mouseX<655 && mouseX>585 && 250<mouseY && mouseY<300) {
    d=600;
    background(255);
    x=0;
    y=0;
    c=5;
  } 
  x=x+c;
  y=y+c;
  //line(0,y,x,700);
  //line(700,700-y,700-x,0);
  //line(x,700,700,700-y);
  //line(700-x,0,0,y);
  //stroke(random(255),random(255),random(255));
  if (x<(700-d)) {
    line(0, y, x+d, 700);
  } else if (x<700) {
    line(0, y, 700, 1400-d-y);
  } else if (x<(1400-d)) {
    line(x-700, 700, 700, 1400-d-y);
  } else if (x<1400) {
    line(x-700, 700, 1400+(700-d)-x, 0);
  } else if (x<(2100-d)) {
    line(700, 2100-y, 2100-d-x, 0);
  } else if (x<2100) {
    line(700, 2100-y, 0, y-(2100-d));
  } else if (x<2800-d) {
    line(2800-x, 0, 0, y-(2100-d));
  } else if (x<2805) {
    line(2800-x, 0, d+x-2800, 700);
  } else if (x>3200) {
    background(0);
    textSize(32);
    fill(0, 0, 255);
    text("Want To Draw Again?", 200, 150);
    text("100", 90, 290);
    text("200", 190, 290);
    text("300", 290, 290);
    text("400", 390, 290);
    text("500", 490, 290);
    text("600", 590, 290);
      textSize(20);
  text("To Save Your Image Press 'S'",220,600);
  }
  //line(700,500-y,500-x,0);
  //line(x+200,700,700,500-y);
  //line(500-x,0,0,y+200);
  //line(x,y,0,0);
}
void keyPressed() {
  println(key);
  if (key=='s') {
    String filename = year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png";
    //This give us a unique filename for each press of "s"
    save(filename);
  }
}

