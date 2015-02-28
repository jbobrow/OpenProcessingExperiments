
int x = 1;
int b = 1;
void setup(){
  size(600,600);
  background(255);
}




void draw(){
  x = x + b;
  line(0,0+x,600-x,600-x);
  line(0+x,0,600-x,600-x);
  line(600,600-x,0+x,0+x);
  line(600-x,600,0+x,0+x);
  
  line(0+x,600-x,600-x,0);
  line(0+x,600-x,600,0+x);
  line(0,600-x,600-x,0+x);
  line(0+x,600,600-x,0+x);
  
}

  void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      b = +1;
    } else if (keyCode == DOWN) {
      b = -1;
    } 
  } else {
    background(255);
  }
}



void mousePressed() {
  exit(); 
}

