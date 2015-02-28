
int h = 0, s = 100, b = 50;
int oldH;
boolean bUp = true, bLoop = true, hLoop = false;
PImage monocle;

void setup() {
  noStroke();
  size(400, 400);
  PFont font;
  font = loadFont("Garamond-100.vlw");
  textFont(font, 90);
  colorMode(HSB, 100);
  frameRate = 60;
  monocle = loadImage("monocle.jpg");
  noCursor();
}

void draw() {  
  if(bLoop){
    if(b == 100 || b == 0)
      bUp = !bUp;
    if(bUp)
      b++;
    else
      b--;
  }
  else if(hLoop){    
    float hFactor = 1.4*sq(oldH-h);
    h+= (int)round(hFactor);
    if(h >= 100)
      h = 0;
  }
  background(0,0,100);
  drawAvatar(275,275);
  fillFancyCrap();
  fill(h,s,b);
  rect(0, 50, width, height/2 - 60);
  fill(h*2,100,100-b);
  text("Luke",30,height/2 - 85);
  text("Davis",30,height/2 - 20);
  smooth();
}

void drawAvatar(int left, int top) {  
  stroke(1);
  strokeWeight(2);
  //starting point of the body line
  int bLeft = monocle.width/2+left;
  int bTop = top+monocle.height, bBot = bTop+30;
  line(bLeft,bTop,bLeft,bBot);
  //left leg
  line(bLeft,bBot,bLeft+15,bBot+15);
  //right leg
  line(bLeft,bBot,bLeft-15,bBot+15);
  //left arm
  int aTop = bTop+(bBot-bTop)/2;
  line(bLeft,aTop,bLeft+15,aTop+10);
  //right arm (waves!)
  float mouseAnim = ((height-mouseY)/(1.0*height));
  int animX = (bLeft-15)+(int)(mouseAnim*3);
  int animY = (int)round((bTop-bBot)*mouseAnim)+10;
  line(bLeft,aTop,animX,aTop+animY);
  image(monocle,left,top);
  noStroke();
}

void fillFancyCrap(){
  for(int i = 0; i<width; i+=3) {
    for(int j = 0; j<height; j+=3) {
      fill(i/(width/100),100-abs(i-mouseX),abs(j-mouseY));
      rect(i,j,3,1);
    }
  }
}

void keyPressed() {
  oldH = h+1;
  bLoop = false;
  hLoop = true;
}

void keyReleased() {
  bLoop = true;
  hLoop = false;
}

