
PImage box;
PFont BlackoakStd20;
int ellipsey=200;
int ellipsex=300;

void setup(){
  size(500,500);
  box = loadImage("box.jpg");
  BlackoakStd20 =loadFont("BlackoakStd-20.vlw");
}

void draw(){
    background(255);
  image(box, 150,200, box.width*1, box.height*1);
  textFont(BlackoakStd20);
  text("click",220,320);
  fill(255,8,1);
  if (mousePressed) {
   ellipse(ellipsex,ellipsey,20,20);
   ellipsey = ellipsey-1;
  } else {
    ellipse(ellipsex,ellipsey,20,20);
    ellipsey = ellipsey+1;
  }
}



