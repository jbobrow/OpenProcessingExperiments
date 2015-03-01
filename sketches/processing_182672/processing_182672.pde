
int x=0;
int y=0;

void setup(){
  size(500,500);
  smooth();
  noStroke();
   fill(0,255,0);
}

void draw(){
  background(0);
  translate(width/2,height/2);
 
  ellipse(x,y,20,20);
}

  void keyPressed() {
  if (key==' '){
   fill(int(random(255)),int(random(255)),int(random(255))); 
  }
    
    if (key == CODED) {
    if (keyCode == UP) {
     y=y-4;
    } else if (keyCode == DOWN) {
     y=y+4;
    } 
    else if (keyCode == LEFT) {
     x=x-4;
    } 
    else if (keyCode == RIGHT) {
     x=x+4;
    } 
  }
}

