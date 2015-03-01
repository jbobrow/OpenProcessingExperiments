
/*-----------------------------
Rectangle
Created 4 February 2015
by Catherine Lee
-----------------------------*/
void setup () {
 size(700,500);
 background(0);
  
}

void draw () {
 rectMode(CENTER);
 rect(width/2,height/2,width/3,height/3);
  /*rectMode(CORNER);
  noStroke();
  rect(width/3,height/3,width/6,height/3);
  rect(width/2, height/3, width/6,height/3);*/
}

void mouseMoved() {
  fill(255);
  if((mouseX<width/2) && (mouseX>width/3) && (mouseY>height/3)
  &&(mouseY<height*2/3))
    fill(0,0,200);
  if ((mouseX>width/2) && (mouseX<width*2/3) && (mouseY>height/3)
  &&(mouseY<height*2/3))
    fill(0,200,200);

}

