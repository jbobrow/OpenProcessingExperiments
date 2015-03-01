
void setup(){
  size(600,400);
  background(75,216,255);
  smooth();
  noStroke();
  coins();
  frameRate(30);
}

void draw(){
  fill(75,216,255);
  rect(0,0,600,129);
  rect(0,171,600,400);
  fill(75,216,255);
  ellipse(mouseX,mouseY,150,150);
  PImage webImg;
  String url="https://lh3.googleusercontent.com/-kUKEPU5ZpLw/AAAAAAAAAAI/AAAAAAAAABI/oVLnH7VD59A/photo.jpg";
  webImg=loadImage(url,"png");
  imageMode(CENTER);
  if (mouseY<300){
    image(webImg,mouseX,mouseY,75,75);
  }
  if (mousePressed==true){
    coins();
  }
  tube();
  fill(75,216,255);
  ellipse(0,0,75,75);
  fill(76,36,5);
  rect(0,300,600,100);
  x=x+xspeed;
  v=v+vspeed;
  cloud1();
  cloud2();
}

void mario(){
  background(75,216,255);
  PImage img;
  img=loadImage("Paper-Mario-icon.png");
  imageMode(CENTER);
  image(img,mouseX,mouseY,75,75);
}

void coins(){
  fill(145,164,52);
  ellipse(80,150,30,40);
  fill(246,214,68);
  ellipse(75,150,30,40);
  fill(145,164,52);
  ellipse(300,150,30,40);
  fill(246,214,68);
  ellipse(295,150,30,40);
  fill(145,164,52);
  ellipse(450,150,30,40);
  fill(246,214,68);
  ellipse(445,150,30,40);
}
int x=0;
int xspeed=3;
int v=0;
int vspeed=3;
void cloud1(){
  fill(255);
  rect(x,50,50,30);
  rect(x+10,30,30,30);
  if (x>650){
    x=-20;
  }
}

void cloud2(){
  fill(255);
  rect(v+400,65,60,30);
  rect(v+410,55,30,30);
   if (v>250){
    v=-420;
  }
}

void tube(){
  fill(0,255,96);
  rect(510,245,55,60);
  fill(34,145,0);
  rect(500,240,75,10);
}
