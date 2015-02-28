
int[] memMouse =  new int[4];
int[] nowMouse =  new int[4];
int[] thenMouse =  new int[4];

int little = 5;
int middle = 10;
int big    = 25;


void setup() {
  size(980, 460);
  background(colorFromPalette());
    stroke(colorFromPalette());
  fill(colorFromPalette());
  frameRate(60);
}

void draw() {
  stroke(colorFromPalette());
  fill(colorFromPalette());
  updateNowMouse();
  updateMemMouse();
}

void mouseMoved(){
  
 brushedSqares(); 
 brushPointist();
}


void brushPointist(){
  stroke(colorFromPalette(), int(random(10,60)));
  fill(colorFromPalette(), int(random(20,40)));
  rectMode(CENTER);
  rect(mouseX, mouseY, 10, 10);
  line(mouseX, mouseY, memMouse[0], memMouse[1]);
  
}

void brushedSqares(){ 
    stroke(colorFromPalette(), random(1, 10));
    fill(colorFromPalette(), int(random(1,24)));
    //rectMode(CENTER);
    //translate(mouseX, mouseY);
    //translate(width/2, height/2);
    //rotate(PI/random(1.0,360.0));
    ellipse(mouseX, mouseY, int(random(16,24)), int(random(16,24)));
    line(mouseX, mouseY, memMouse[0], memMouse[1]);
    smooth();
}

void updateThenMouse() {
  thenMouse[0] = mouseX;
  thenMouse[1] =mouseY;
  thenMouse[2] = pmouseX;
  thenMouse[3] = pmouseY;
}

void updateMemMouse() {
  memMouse[0] = mouseX;
  memMouse[1] =mouseY;
  memMouse[2] = pmouseX;
  memMouse[3] = pmouseY;
}

void updateNowMouse() {
  nowMouse[0] = mouseX;
  nowMouse[1] =mouseY;
  nowMouse[2] = pmouseX;
  nowMouse[3] = pmouseY;
}

