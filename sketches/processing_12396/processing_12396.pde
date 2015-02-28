
void setup(){
  size(400,400);
}

void draw() {
  if (mousePressed) {
     if(mouseX<width/2){
        fill(0,0,255);
        rect(0,0,width,height);
        fill(255,0,0);
        rect(50,50,300,300);
        fill(0,0,255);
        rect(100,100,200,200);
        fill(255,0,0);
        rect(175,175,50,50);
      }//if
      else{
        fill(255,0,0);
        rect(0,0,width,height);
        fill(0,0,255);
        rect(50,50,300,300);
        fill(255,0,0);
        rect(100,100,200,200);
        fill(0,0,255);
        rect(175,175,50,50);
      }//else
  }//if
  else {
    noFill();
  }//else
 }//draw

