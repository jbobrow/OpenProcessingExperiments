
int a;
int eSize;

void setup() {
  size(500,500);
  background(255);
  smooth();
  a = 1;
}

void draw(){
}

void mouseDragged() {
  strokeWeight(a);
  line(mouseX,mouseY,pmouseX,pmouseY);
}

void mousePressed(){
  if(mouseButton == RIGHT){
    background(255);
  }
}


void keyPressed() {  
  
    if(keyCode == UP){
     a += 1;
       if(a >= 20){a=20;}
      }
      
      if(keyCode == DOWN){
     a -= 1;
       if(a <= 1){a=1;}
      }

switch(key) {
  case 'r':
    stroke(255,0,0);
    break;
  case 'g':
    stroke(0,255,0);
    break;
  case 'b':
    stroke(0,0,255);
    break;
  case 'c':
    stroke(0,255,255);
    break;
  case 'm':
    stroke(255,0,255);
    break;
  case 'y':
    stroke(255,212,0);
    break;
  case 'k':
    stroke(0);
    break;
  case 'w':
    stroke(255);
    break;
}
  }


