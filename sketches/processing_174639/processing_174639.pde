
int c;
int b;
int a;

 
void setup() {
  size(500,500);
  background(0);
  smooth();
  a = 24;
  c = 20;  
  b = 120;
}
 
void draw() {
}
 
void mouseDragged() {
  strokeWeight(1);
  fill(b,200
  ,200
  ,c); 
  stroke(b,200
  ,200
  ,c);  
  rectMode(CENTER);
  rect(mouseX,mouseY, a,a);
}

void keyPressed() {
  //burashi saizu
  if(keyCode == RIGHT) {
    c += 1;
  if(c > 255) { 
    c = 255;
  }

  } else if(keyCode == LEFT) {
  c -= 1;
  if(c <0) {
    c = 0;
  }
}else if(keyCode == UP){
  b += 3;
  if(b > 255) {  
    b = 255;
  }
}else if(keyCode == DOWN){
 b -= 3;
  if(b <0) { 
    b = 0;
  }
}

  switch(key) {
   
    case 'd': //zenkeshi
      background(0);
      break;
    }
}


