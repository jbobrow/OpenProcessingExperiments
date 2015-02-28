
int a;

void setup() {
  size(600,600);
  background(255);
  smooth();
  a = 1;
}

void draw() {
}

void mouseDragged() {
  strokeWeight(a);
  line(mouseX,mouseY, pmouseX,pmouseY);
}

void keyPressed() {
  //burashi saizu 
  if(keyCode == RIGHT) {
    a += 1;
    if(a >= 10) {
      a = 10;
      }
  } else if(keyCode == LEFT) {
    a -= 1;
    if(a <= 1) {
      a = 1;  
    }
  }
  switch(key) {
    case 'k': //kuro
      stroke(0);
      break;
    case 'r': //aka
      stroke(200,0,0);
      break;
    case 'g': //midori
      stroke(0,200,0);
      break;
    case 'b': //ao
      stroke(0,0,200);
      break;
    case 'o': //orenji
      stroke(240,180,35);
      break;
    case 'p': //murasaki
      stroke(190,50,200);
      break;
    case 'w': //shiro
      stroke(255);
      break;
    case 'd': //zenkeshi
      background(255);
      break;
    }
}


