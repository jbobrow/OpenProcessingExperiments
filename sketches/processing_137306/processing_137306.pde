
int X=0;
int Y= 150;
 
void setup() {
  size (300, 300);
  }
 
void draw() {
  background(255);
  stroke(0);
  fill(175);
  ellipse(X,Y, 30,30);
}
 
void keyPressed(){
    if(key == CODED){
    if (keyCode == RIGHT){
      ellipse(X,Y, 30,30);
     X= X+4;
    }
    } if(key == CODED){
    if (keyCode == LEFT){
      ellipse(X,Y, 30,30);
     X=X-4;
    }
  } if(key == CODED){
    if (keyCode == UP){
      ellipse(X,Y, 30,30);
     Y=Y-4;
    }
  } if(key == CODED){
    if(keyCode == DOWN){
    ellipse(X,Y, 30,30);
    Y=Y+4;
  }
}
}
