
int x;
 
void setup() {
  size(500,500);
  background(255);
  smooth();
  x = 1;
}
 
void draw() {
}
 
void mouseDragged() {
  strokeWeight(x);
  line(mouseX,mouseY, pmouseX,pmouseY);
}
 
void keyPressed() {
  //brush size
  if(keyCode == UP) {
    x += 1;
    if(x >= 10) {
      x = 10;
      }
  } else if(keyCode == DOWN) {
    x -= 1;
    if(x <= 1) {
      x = 1; 
    }
  }
  //color
  switch(key) {
    case 'k': //black
      stroke(0);
      break;
    case 'r': //red
      stroke(255,0,0);
      break;
    case 'g': //green
      stroke(0,255,0);
      break;
    case 'y': //yellow
      stroke(255,247,0);
      break;      
    case 'b': //blue
      stroke(0,0,255);
      break;
    case 'a': //aquablue
      stroke(0,232,255);
      break;
    case 'o': //orange
      stroke(255,180,5);
      break;
    case 'p': //purple
      stroke(190,0,190);
      break;
    case 'w': //brown
      stroke(165,114,0);
      break;      
    case 'e': //ereser
      stroke(255);
      break;
    case 'd': //zenkeshi
      background(255);
      break;
    }
}


