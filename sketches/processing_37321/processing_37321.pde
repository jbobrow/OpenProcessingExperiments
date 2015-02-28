

float size1;
float size2;
float colora = 0;
float colorb;
float colorc;
int strokeR = 100;
int strokeG = 100;
int strokeW = 5;
boolean timer;
boolean colorchange;
float maxed=0;


void setup() {
  size(500, 500);
  background(255);
  size1 = 20;
  size2 = 20;
  smooth();
  //noStroke();
  colorchange = false;
}

void draw() {
  fill(random(1, 255), random(1, 255), colorc);
  println(colora);
  if (timer==true && maxed<30) {
    ellipse(mouseX, mouseY, size1, size2);
    size1+=5;
    size2+=5;
    maxed+=1;
  }
  if (maxed>29) {
    maxed=0;
    timer=false;
    size1=1;
    size2=1;
  }
  println(maxed);
  if (mousePressed) {

    ellipse(mouseX, mouseY, random(1, 100), random(1, 100));
    stroke(229, 242, 255);
    //stroke(220,255,255);
    strokeWeight(strokeW);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  fill(0);
  fill(0, 8);
  rect(0, 400, 500, 100);
  fill(72, 165, 255);
  text("Effects:", 20, 405, 500, 500);
  text("Stroke:", 200, 405, 500, 500);
  fill(strokeR, strokeG, 0);
  text(strokeW, 242, 417);
  fill(255);
  text("-Click once and drag", 20, 420, 500, 500);
  text("-Hold and drag", 20, 435, 500, 500);
  text("-Hold in place", 20, 450, 500, 500);
  text("-Press Z to clear", 20, 465, 500, 500);
  //
  text("-Up Arrow to increase (max 10)", 200, 420, 500, 500);
  text("-Down Arrow to decrease (min 0)", 200, 435, 500, 500);
  fill(72, 165, 255);
  text("Roy V.", 390, 480, 500, 500);
}

void keyPressed() {
  if (key=='z' || key == 'Z') {
    background(255);
  }
  if (keyCode==UP && strokeW<10) {
    strokeW+=1;
    strokeR+=30;
    strokeG-=30;
  }
  if (keyCode==DOWN && strokeW>0) {
    strokeW-=1;
    strokeR-=30;
    strokeG+=30;
  }
}

void mousePressed() {

  if (timer==false) {
    timer=true;
  }
}

void mouseDragged() 
{
  if (colorchange==false) {
    colorc = colorc + 5;
  }
  if (colorc > 255) {
    colorchange= true;
  }
  if (colorchange) {
    colorc-=5;
  }
  if (colorc<0) {
    colorchange=false;
  }
}


