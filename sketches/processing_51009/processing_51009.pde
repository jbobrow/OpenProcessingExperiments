
boolean c1, c2;

final static int NON = 0;
final static int MID = 1;
final static int MOV = 2;

int state = NON;
int lastX = 0;
int lastY = 0;
float movTime = 0;
float midTime = 0;
float nonTime = 0;

float xSpeed, ySpeed;
int index=0;
float lastMouseX=0;
float lastMouseY=0;
float pos[][] = new float [20][2];
float horizontalShift[]={-5*xSpeed, -3*xSpeed, -2*xSpeed, -1*xSpeed, -1*xSpeed, 0, 0, 0, 1*xSpeed, 1*xSpeed, 2*xSpeed, 3*xSpeed, 5*xSpeed};
float verticalShift[]={-5*ySpeed, -3*ySpeed, -2*ySpeed, -1*ySpeed, -1*ySpeed, 0, 0, 0, 1*ySpeed, 1*ySpeed, 2*ySpeed, 3*ySpeed, 5*ySpeed};

void setup() {
  size(600,600);
  background(255);
  smooth();
  frameRate(30);
  stroke(0);
  strokeWeight(3);
  PImage mouse = loadImage("fly.png");
  mouse.resize(30,30);
  cursor(mouse);
  for (int i = 0; i < 20; i++) {
    pos[i][0] = 0;
    pos[i][1] = 0;
  }
}

void draw(){
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  stray(mouseX - 300, mouseY - 300);
  calculateState(mouseX - 300, mouseY - 300);
  boolean eye1 = leftEyeClick();
  boolean eye2 = rightEyeClick();
  if(!eye1 && !eye2){
     normalEye();
  }
  popMatrix();
}

//the stray behind the fly
void stray(int x, int y) {
  popMatrix();
  pos[index][0]=mouseX;
  pos[index++][1]=mouseY;
  if(index >= pos.length){
    index = 0;
  }
  xSpeed=mouseX-lastMouseX;
  ySpeed=mouseY-lastMouseY;
  for (int i=0; i<pos.length; i++){
    strokeWeight(2);
    point(pos[i][0], pos[i][1]);
    int index = int(random(horizontalShift.length));
    pos[i][0] += horizontalShift[index];
    pos[i][1] += verticalShift[index];
  }
  lastMouseX=mouseX;
  lastMouseY=mouseY;
  strokeWeight(3);
  pushMatrix();
  translate(width/2,height/2);
}

void calculateState(int x, int y) {
  if (abs(x - lastX) + abs(y - lastY) > 5) {
    state = MOV;
    midTime = (midTime > 1) ? midTime - 1 : 0;
    nonTime = (nonTime > 1) ? nonTime - 1 : 0;
    movTime = (movTime < 29.5) ? movTime + 1 : 30;
  } else {
    movTime = (movTime > 1.5) ? movTime - 1.5 : 0;
    if (inRect(x,y,-30,30,-30,30)) {
      state = MID;
      midTime = (midTime < 39.5) ? midTime + 1 : 40;
    } else {
      state = NON;
      nonTime = (nonTime < 39.5) ? nonTime + 1 : 40;
    }
  }
  lastX = x;
  lastY = y;
}

boolean inRect(int x, int y, int l, int r, int u, int d) {
  return (x >= l && x <= r && y >= u && y <= d);
}

boolean mouseInRect(int l, int r, int u, int d) {
  return inRect(mouseX - 300, mouseY - 300, l, r, u, d);
}

//click on the left eye, it will cry
boolean leftEyeClick() {
  c1 = c1 || mousePressed;
  c1 = c1 && mouseInRect(-130, -30, -30, 30);
  if (c1) {
    line(-100, -30, -30, +30);
    line(-100, +30, -30, -30);
    fill(0);
    ellipse(+70, 0, 60, 60);
    noFill();
    ellipse(+70, +35, 30, 50);
  }
  return c1;
}

//click on the right eye, it will cry
boolean rightEyeClick() {
  c2 = c2 || mousePressed;
  c2 = c2 && mouseInRect(30,130,-30,30);
  if(c2) {
    line(+100, -30, +30, +30);
    line(+100, +30, +30, -30);
    fill(0);
    ellipse(-70, 0, 60, 60);
    noFill();
    ellipse(-70, +35, 30, 50);
  }
  return c2;
}

void normalEye(){
  float x1,y1,x2,y2,d1,d2;
  float easing=0.2;
  d1 = d2 = 40;
  y1 = y2 = 0;
  
  float movMod = movTime - 10;
  float midMod = midTime - 10;
  float nonMod = nonTime - 20;
  movMod = (movMod < 0) ? 0 : movMod;
  midMod = (midMod < 0) ? 0 : midMod;
  nonMod = (nonMod < 0) ? 0 : nonMod;
  
  //left eye
  //when mouse is on, it will close
  if(mouseInRect(-130, -30, -30, 30)) {
    bezier(-130,+10,-85,-20,-80,-20,-30,+10);
  } else {
    //normal state
    line(-130,-30,-30,-30+movMod);
    noFill();
    bezier(-100,+30,-70,+40,-70,+40,-40,+30);
    
    x1 = map(mouseX - 300,-300,300,-100,-50);
    y1 = map(mouseY - 300,-300,300,-10,+13);
    fill(0);
    
    y1 += movMod;
    x1 += midMod;
    if(mouseY-300>30)
      y1 += 0.5*nonMod;
    if(mouseY-300<-30)
      y1 -= 0.5*nonMod;
    ellipse(x1,y1,5,d1-movMod-nonMod);
  }
   
  //right eye
  //when mouse is on, it will close
  if(mouseInRect(30,130,-30,30)) {
    bezier(+130,+10,+85,-20,+80,-20,+30,+10);
  } else {
    //normal state
    line(130,-30,30,-30+movMod);
    noFill();
    bezier(+100,+30,+70,+40,+70,+40,+40,+30);
    
    x1 = map(mouseX - 300,-300,300,50,100);
    y1 = map(mouseY - 300,-300,300,-10,+13);
    fill(0);
    
    y1 += movMod;
    x1 -= midMod;
    if(mouseY-300>30)
      y1 += 0.5*nonMod;
    if(mouseY-300<-30)
      y1 -= 0.5*nonMod;
    ellipse(x1,y1,5,d1-movMod-nonMod);
  }
}

