
int x=0;
int y=0;
boolean moveup= true;
boolean movediag= true;
boolean moveright= true;
void setup() {
  size(600, 600);
  background(0);
 
}
 
void draw() {
text("Press and hold S, A or D",1,580);
}
 
void keyPressed() {
  
  if (key == 's'){
    background(0);
    rect(width/2,y,65,65);
    fill(y/2,x/2,x/2);
      if(moveup) {
      y+=10;
        } else {
        y-=10;
        }
        if(y>width-50){
        moveup = false;
        } else if (y<0){
        moveup = true;
        }
  }
    else if (key == 'a'){
       background(0);
       rect(x,height/2,65,65);
       fill(x/2,y/2,y/2);
  if(moveright) {
    x+=10;
  } else {
    x-=10;
  }
  if(x>height-50){
    moveright = false;
  } else if (x<1){
    moveright = true;
  }
  }
   
    else if (key == 'd'){
      background(0);
  rect(x,y,65,65);
  fill(y/2,y/2,155);
  if(movediag) {
    y+=10;
    x+=10;
  } else {
    y-=10;
    x-=10;
  }
  if(y>width-50){
    movediag = false;
  } else if (y<0){
    movediag = true;
  }
  if(x>height-50){
    movediag = false;
  } else if (x<1){
    movediag = true;
  }
     
  }
  }
