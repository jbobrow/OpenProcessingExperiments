
/* @pjs preload="mado.jpg"; */

int i=0, cnt=0;
PImage bg;
void setup() {

  bg=loadImage("mado.jpg");
    frameRate(60);
  size(640, 360);
  background(bg);
  fill(255, 0, 0, 30);
  stroke(0, 80);
  strokeWeight(10);
 // ellipse(width/2, height/2, 1, 1);
}
void draw() {

  if ( mousePressed ) {
    background(bg);
    //background(255,80);
    noFill();
    stroke(random(55), 0, 255, 100);
    ellipse(mouseX, mouseY, i, i);
    i+=10;
    if (i>=800) {
      i=0;
    }
    //fill(255,90);
    //rect(-10,-10,width+110,height+110);
    //background(bg);
  }
  else if (mousePressed==false) {
    //fill(255);
    //rect(-100,-100,width*width,height*height);
    background(bg);
    i=0;
    textSize(16);
    fill(0);
    text("Keep your mouse Clicked", width/4, height/2);
  }
}

//void mouseClicked(){
// if(cnt>3){
//   stop();
//   textSize(32);
//   color(255,80);
//   text("Thank you for your click",width/2,height/2);
//  noFill();
//  stroke(random(255),noise(random(255)),noise(random(255)),90);
//  ellipse(mouseX,mouseY,i,i);
//  i+=10;
//  if(i>=800){
//    i=0;
//  }
//  fill(255,90);
//  rect(-10,-10,width+110,height+110);
//
//}



