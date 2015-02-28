
int x;
int y;
float eyeSize;
int bodyWidth;
int footSize;

void setup() {
 size(300,300);
 smooth(); 
}

void draw () {
 
  background(255);
  x = mouseX;
  y = mouseY;
  eyeSize= map(mouseY, 0,300, 12,20);
  bodyWidth=65;
  footSize=15;  
   //HAT
  fill(0);
    if (mouseX<80) { //HAT CHANGE SIZE
    rect(x-20,y-50, 40,50);
  } else if (mouseX>80 && mouseX<150) {
    rect(x-20,y-40,40,40);
  } else if (mouseX>150 && mouseX<220) {
    rect(x-20,y-30,40,30);
  } else {
    rect(x-20,y-25,40,25);
  }
  /*if (mousePressed) {
    ellipse (x, y-20, 40,30);
  } else {
    rect(x-20,y-30,40,30);
  }*/ //BOWLER HAT IF OPTION
  //ARMS
  strokeWeight(1);
  float r = map(mouseY, 0,300, 100,200);
  float g = map(mouseY, 0,300, 1,50);
  fill(r,g,100);
  quad(x-42,y+10,x-33,y,x-33,y+3,x-42,y+13);
  fill(r,g,100);
  ellipse(x-42,y+10,8,8);
  fill(r,g,100);
  quad(x+33,y,x+45,y-10,x+45,y-13,x+33,y-3);
  fill(r,g,100);
  ellipse(x+45,y-10,8,8);
  //BODY&FACE
  fill(r,g,100);
  ellipse(x,y,bodyWidth,40);//body
  fill(255);
  
  ellipse(x-8,y,eyeSize,eyeSize);//eye
  ellipse(x+8,y,eyeSize,eyeSize);//eye
  fill(82,205,252);
  ellipse(x-8,y-2,4,4);//eye dot
  ellipse(x+8,y-2,4,4);//eye dot
  line(x-20,y+10,x+20,y+10);//mouth
  fill(248,255,193);
  triangle(x-15,y+10,x-5,y+10,x-10,y+15);//tooth1
  triangle(x-5,y+10,x+5,y+10,x,y+15);//tooth2
  triangle(x+5,y+10,x+15,y+10,x+10,y+15);//tooth3
  fill(r,g,100);
  curve(x-5,y+15,x-15,y-10, x,y-10,x-10,y+15);//eyebrowL
  curve(x+10,y+15,x,y-10, x+15,y-10,x+5,y+10);//eyebrowR
  //LEGS
  quad(x-10,y+20,x-10,y+35,x-15,y+35,x-15,y+18);
  quad(x+10,y+20,x+10,y+35,x+15,y+35,x+15,y+18);
  fill(0);
  ellipse(x-15,y+35,footSize,footSize-5);
  ellipse(x+15,y+35,footSize,footSize-5);
  //FLOWER
  fill(255);
  stroke(4,203,29);
  strokeWeight(3);
  curve(x+20,y-20,x+20,y-20, x+30,y-35,x+50,y);
  stroke(0);
  strokeWeight(1);
  if (mousePressed) {
    fill(127,20,222);
    } else {
  fill(250,73,191);
  }
  ellipse(x+32,y-39,5,5);
  ellipse(x+36,y-36,5,5);
  ellipse(x+34,y-32,5,5);
  ellipse(x+30,y-32,5,5);
  ellipse(x+28,y-36,5,5);
  fill(250,255,111);
  ellipse(x+32,y-35,5,5);
 
  fill(0);
  rect(x-25,y-20,50,5);

  
}

