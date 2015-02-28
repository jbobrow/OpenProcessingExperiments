
PFont font;
PImage logo, bt, bt2, bt3, keyB;

float w;

int title = 0, main = 1, help = 2;
int state;



void setup() {
  size(600,600);
  smooth();
  background(255);
  font = loadFont("AS48.vlw");
  textAlign(CENTER);

  state = title;
  w = 1;
}



void draw() {
  if(state == title) {
    titleState();
  }
  if(state == help) {
    helpState();
  }
  if(state == main) {
    mainState();
  } 
}



void keyPressed() {
  if(state == title) {
    if(key == ' ') {
      state = main;
      background(255);
    }
    if(key == 'h') {
      state = help;
      fill(0,210);
      noStroke();
      rect(0,0,600,600);
      }
    }
  
  if(state == help) {
    if(key == 'b') {
      state = title; 
    }
  }
  if(state == main) {
    if(key=='n'){
      background(255);
    }
    if(key == '+') {
      w = w + 0.5;
    }
    if(w >= 1){
      if(key == '-') {
        w = w - 0.5;
      }
    }
  }
}



// TITLE ------------------------------

void titleState() {
  background(190);
  imageMode(CENTER);
  logo = loadImage("logo.png");
  image(logo, width/2, 270);
  bt = loadImage("bt.png");
  image(bt,  width/2, 410);
  bt2 = loadImage("bt2.png");
  image(bt2,  width/2, 455);
  textFont(font);
  fill(0);
  textSize(13);
  text("2010 Processing No.2 [kagamie]", 520, 590);
}



// MAIN ------------------------------

void mainState() {
  if(key=='s') {
    save("kagamie.tif");
  }
  if(mousePressed == true && state == main && mouseY < 600) {
    stroke(0);
    if(key=='q') {
      stroke(0);
    }
    if(key=='w') {
      stroke(248, 230, 11);
    }
    if(key=='e') {
      stroke(185, 12, 108);
    }
    if(key=='r') {
      stroke(26, 117, 167);
    }
    if(key=='t') {
      stroke(255);
    }
    strokeWeight(w);
    line(pmouseX,pmouseY,mouseX,mouseY);
    if(keyPressed){
      if(key == 'm') {
        strokeWeight(w);
        line(width-pmouseX,pmouseY,width-mouseX,mouseY);
      } 
      if(key == 'l') {
        strokeWeight(w);
        line(width-pmouseX,pmouseY,width-mouseX,mouseY);
        line(pmouseX,height-pmouseY,mouseX,height-mouseY);
        line(width-pmouseX,height-pmouseY,width-mouseX,height-mouseY);
      }
    }
  }
}



// HELP ------------------------------

void helpState() {
  keyB = loadImage("help2.png");
  image(keyB, width/2, height/2);
  bt3 = loadImage("bt3.png");
  image(bt3,  width/2, 550);
}

  



















