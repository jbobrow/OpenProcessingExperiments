
PImage[] img;
PFont font;
float transX;
float itransX;
float itransY;
float transY;
float initialX;
float initialY;
int pic;
float startTime;
float time;
float t;
float s;
int slide;
int slide2;
boolean image;
boolean bar;
boolean bar2;
boolean sliding;
boolean sliding2;
boolean translating;
boolean firstLoop;

void setup() {
  size(1200,900,P3D);
  //size(displayWidth,displayHeight,P3D);
  smooth();
  rectMode(CENTER);
  img = new PImage[16];
  for(int i = 0; i < 16; i++){
    img[i] = loadImage("WaterLevelChange" + (i+1) + ".jpg");
  }
  initialX = width/2;
  initialY = height/2;
  itransX = initialX;
  itransY = initialY;  
  transX = 0;
  transY = 0;
  pic = 0;
  //Not used in current version:
  //startTime = millis()/1000.0;
  t = 0.8;
  slide = 0;
  slide2 = 0;
  sliding = false;
  sliding2 = false;
  translating = false;
  firstLoop = true;
  font = createFont("Arial Bold",16,true);
  textFont(font,36);
  textAlign(CENTER);
  noStroke();
}

void draw() {
  background(0);
  
  //Zoom Bar:
  stroke(255);
  fill(128);
  rect(width-50,height/2,30,height-150);
  stroke(0);
  fill(255);
  rect(width-50,height-slide-75,75,25);
  noStroke();
  
  //Time Bar:
  stroke(255);
  fill(128);
  rect(width/2,height-50,width/2,30);
  stroke(0);
  fill(255);
  rect(width/4+slide2,height-50,25,75);
  noStroke();
  
  /*
  //Text:
  fill(0);
  rect(width/8,height-50,230,50);
  fill(255);
  text("1996 to " + (1997+pic),width/8,height-35);
  */
  
  /*
  //For continually cycling images:
  time = millis()/1000.0;
  pic = (int(time-startTime))%16;
  */
  
  if(firstLoop)
    printAll();
    
  pic = (int)s;  
  transCheck();
  translate(width/2, height/2);
  beginShape();
    texture(img[pic]);
    vertex(t*(-img[pic].width/2)+transX, t*(-img[pic].height/2)+transY, -1, 0, 0);
    vertex(t*(img[pic].width/2)+transX, t*(-img[pic].height/2)+transY, -1, img[pic].width, 0);
    vertex(t*(img[pic].width/2)+transX, t*(img[pic].height/2)+transY, -1, img[pic].width, img[pic].height);
    vertex(t*(-img[pic].width/2)+transX, t*(img[pic].height/2)+transY, -1, 0, img[pic].height);
  endShape();
  
  bar = (mouseX>(width-87.5) && mouseX<(width-12.5) && mouseY>62.5 && mouseY<(height-62.5));
  bar2 = (mouseX>(width/4-12.5) && mouseX<(3*width/4+12.5) && mouseY>(height-87.5) && mouseY<(height-12.5));
  image = !bar && !bar2;
  if (!mousePressed){
    sliding = false;
    sliding2 = false;
    translating = false;
    initialX = transX;
    initialY = transY;
  }
  if (mousePressed){
    if((bar || sliding) && !sliding2 && !translating)
      slideBar();
    else if ((bar2 || sliding2) && !sliding && !translating)
      slideBar2();
    else if ((image || translating) && !sliding && !sliding2)
      translation();
  }
}

void printAll(){
  for(int i = 15; i >=0; i--){
    pic = i;
    translate(width/2, height/2);
    beginShape();
      texture(img[pic]);
      vertex(t*(-img[pic].width/2)+transX, t*(-img[pic].height/2)+transY, -1, 0, 0);
      vertex(t*(img[pic].width/2)+transX, t*(-img[pic].height/2)+transY, -1, img[pic].width, 0);
      vertex(t*(img[pic].width/2)+transX, t*(img[pic].height/2)+transY, -1, img[pic].width, img[pic].height);
      vertex(t*(-img[pic].width/2)+transX, t*(img[pic].height/2)+transY, -1, 0, img[pic].height);
    endShape();
    firstLoop = false;
  }
}

void translation(){
  if (!translating){
    itransX = mouseX;
    itransY = mouseY;
  }
  transX = mouseX - itransX + initialX;
  transY = mouseY - itransY + initialY;
  translating = mousePressed;
}

void slideBar(){
  if (mousePressed)
    slide = height-mouseY-75;
  slideCheck();
  t = map(slide, 0, height-150, 0.8, 2.8);
  sliding = mousePressed;
}

void slideBar2(){
  if (mousePressed)
    slide2 = mouseX - width/4;
  slideCheck2();
  s = map(slide2, 0, width/2, 0, 15.9);
  sliding2 = mousePressed;
}

void slideCheck(){
  if (slide<0){
    slide = 0;
  } else if (slide>height-150)
    slide = height-150;
}

void slideCheck2(){
  if (slide2<0)
    slide2 = 0;
  else if (slide2 > width/2)
    slide2 = width/2;
}

void transCheck(){
  if(transX>(t*img[pic].width/2))
    transX = t*img[pic].width/2;
  else if (transX<(-t*img[pic].width/2))
    transX = -t*img[pic].width/2;
  if(transY>(t*img[pic].height/2))
    transY = t*img[pic].height/2;
  else if (transY<(-t*img[pic].height/2))
    transY = -t*img[pic].height/2;
}


