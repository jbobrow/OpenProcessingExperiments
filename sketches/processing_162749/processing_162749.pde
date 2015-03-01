
PImage bgpic;
int count=0;
int value = 0;
int fart = 0;
int value2 = 102;
void setup() {
//size(bgpic.width,bgpic.height);
  bgpic=loadImage("zatch.jpg");
  pic=loadImage("Copy.jpg");
size(723,1038); //80% of image. 904x1297 normal

frameRate(60);

//bgpic.resize(723,1038); //80% of image. 904x1297 normal
//image(bgpic,0,0);
//
}
/*
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  println(e);
}
*/
void mouseReleased() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}

void mousePressed() {
  if (count == 0 && (mouseButton == LEFT)) {
    count = 1;
  } else if (count == 0 && (mouseButton == RIGHT)) {
    count = 2;
  } else {
    count = 0;
  }
}

void keyPressed() {
  if (fart == 0 && (key == 'a')) {
    fart = 1;
  } else if (fart == 0 && (key =='b')){
    fart = 2;
  } else if (fart == 0 && (key == 'c')) {
    fart = 3;
  }else if (fart == 0 && (key == 'q')){
    fart = 4;
  }else if(fart == 0 && (key == 'w')){
    fart = 5;
  } else if (fart == 0 && (key == 'e')){
    fart = 6;
  }else if (fart == 0 && (key == 'r')){
    fart = 7;
  }else {
    fart = 0;
    }
}

void draw() {
bgpic.resize(723,1038); //80% of image. 904x1297 normal
image(bgpic,0,0);

  //fill(value);
  //rect(25, 25, 50, 50);
if (fart == 1) {
  color c = color(0,126,255,102);
  fill(c);
ellipse(mouseX, mouseY, pmouseX+10, pmouseY+40);
float value2 = alpha(c);
//pic.resize(-mouseX,-mouseY);
}

if (fart == 2) {
  color c = color(255,100,200,200);
  fill(c);
  rect(mouseX, mouseY, pmouseX-50, pmouseY-83, mouseX+100);
}

if (fart == 4) {
  bgpic=loadImage("jay1.jpg");
}

if (fart == 5) {
  bgpic=loadImage("jay2.jpg");
}

if (fart == 6) {
bgpic=loadImage("jay3.jpg");
}

if (fart == 7) {
bgpic=loadImage("zatch.jpg");
}
 image(pic,pmouseX-36,pmouseY-52);


if (value == 255) {
   pic.resize(72,104);
  pic=loadImage("reverse.jpg");
  
}
else {
  pic=loadImage("Copy.jpg");
 pic.resize(72,104);

}

if (fart == 3) {
  color c = color(0,255,200,200);
  fill(c);
  triangle(mouseX, mouseY, pmouseX-50, pmouseY-83, mouseX+100, pmouseY+100);
}


if (count == 1) {
  bgpic.filter(THRESHOLD, .5);
} else if (count == 2){
  bgpic.filter(INVERT);
} else{ 
  count = 0;
}


  
}



