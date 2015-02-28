
int x = 0;
int dir = 1;
int maxHeight = 450;
boolean mouseRelease = true;
void setup(){
  loop();
  size(450,450);
  background(0);
}
void draw(){
  background(0);
  bouncing_ball();
  if(mouseRelease){
     x = x -3;
     if(x <= 0){
       x = 0;
     }
  }else { 
    x = x + dir*3;
    if(x >= 450 - 90){
      dir = -1;
      maxHeight = maxHeight*3/4; 
    } else if(x <= 450 - maxHeight){
    dir =  1;
     }else if(maxHeight <= 125){
       dir = 0;
     }
  }
}
void bouncing_ball(){
  ellipse(65, 65+x, 65, 65);
  ellipse(75, 50+x, 13, 10);
}
void mousePressed(){ // When mouse is clicked it moves
  mouseRelease = false;
}
void mouseReleased(){ // When mouse is released it stops
  mouseRelease = true;
}

