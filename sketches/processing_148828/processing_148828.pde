
float xLast;
float yLast;
boolean backGround = true;
boolean onOff = true;
void setup() {
  size (600, 600);
  smooth();
  background(#CBB9EE);
  frameRate(20);
}
void draw () {

  if (backGround) {
    fill(#eeeeee, 10);
    noStroke();
    rectMode(CORNER);
    rect(0, 0, height, width);
    stroke(0);
  }
  if (!backGround) {
    fill(0, 10);
    noStroke();
    rectMode(CORNER);
    rect(0, 0, height, width);
    stroke(255);
  }
  //triangle(mouseX, mouseY, xLast, yLast, mouseX+60, mouseY+50);
  //triangle(xLast, yLast, mouseX+10, mouseY+20, mouseX+30, mouseY+60);
  //triangle( mouseX+30, mouseY+50, mouseX+30, mouseY+30, xLast, yLast);

  line(mouseX, mouseY, pmouseX, pmouseY);
  line(mouseX, mouseY, xLast, yLast);
  line(pmouseX, pmouseY, xLast, yLast);
  
  xLast=pmouseX;
  yLast=pmouseY;
  title();
}
void title() { 
  fill(150);
  textAlign(RIGHT);
  text("CHOI InSeo, untitled, 2014", width-50, height-20);
  textAlign(LEFT);
  text("TAB background", 50, height-20);
}
void keyPressed() {
  if (key=='s') saveFrame("frames/frame_#####.jpg");
  if (keyCode==TAB) backGround = !backGround;
}

