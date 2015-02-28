
void setup (){
  size (500,500);
}

void draw () {
   background (255,255);

  for (int i = 0; i < width; i=i+10) {
    for (int r = 0; r <height; r=r+10){
      stroke (0);
      fill (200,200,200);
      ellipse (i, r, 10,10);
      }
  }
//bottom right
  if (mouseX > width/2  && mouseY > height/2) {
     noStroke();
     fill (51,153,255);
     rect (width/2, height/2, width/2, height/2);
 
      }
//bottom left
  else if (mouseX < width/2  && mouseY > height/2) {
    noStroke();
     fill (51,153,255);
     rect (0, height/2, width/2, height/2);
      }
//top right
  else if (mouseX > width/2  && mouseY < height/2) {
    noStroke();
    fill (51,153,255);
    rect (width/2, 0, width/2, height/2);
    }
//top left
else if (mouseX < width/2  && mouseY < height/2) {
  noStroke();
   fill (51,153,255);
   rect (0,0, width/2, height/2);
    }
}



