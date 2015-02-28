
//by Michal Piasecki
  
int a = 0;
int b = 0;
boolean q = false;
boolean w = false;
boolean e = false;
boolean r = false;
boolean t = false;

void setup(){
  size(900,450);
  background(0);
  }
  
void draw(){
  a = mouseX;
  b = mouseY;
    
  if (q == true) {
    newtriangle(a,b);
  } else if (w == true) {
    bezierc1 (a,b);
  } else if (e == true) {
    bezierc2 (a,b);
  } else if (r == true) {
    bezierc3 (a,b);
  } else if (t == true) {
    bezierc4 (a,b);
  }

  if (mousePressed) {
    q = false;
    w = false;
    e = false;
    r = false;
    t = false;
  }  
}

void keyReleased() {
  if (key == 'q' || key == 'Q') {
    q = true;
    w = false;
    e = false;
    r = false;
    t = false;
  } else if (key == 'w' || key == 'W') {
    q = false;
    w = true;
    e = false;
    r = false;
    t = false;
  } else if (key == 'e' || key == 'E') {
    q = false;
    w = false;
    e = true;
    r = false;
    t = false;
  } else if (key == 'r' || key == 'R') {
    q = false;
    w = false;
    e = false;
    r = true;
    t = false;
  } else if (key == 't' || key == 'T') {
    q = false;
    w = false;
    e = false;
    r = false;
    t = true;
  }
}

void newtriangle(int x, int y) {
  stroke(0,200);
  fill(255,10);

  if ((y < height/2) && (x > width/4) && (x < (width - (width/4)))){
    triangle(0,0,x,y,900,0);
  } else if ((y > height/2) && (x > width/4) && (x < (width - (width/4)))) {
    triangle(0,450,x,y,900,450);
  } else if (x < width/4) {
    triangle(0,0,x,y,0,450);    
  } else if (x > (width - (width/4))) {
    triangle(900,0,x,y,900,450);   
  } 
}

void bezierc1(int x, int y){
  stroke(255,200);
  fill(0,5);
  bezier(0,0,x*2,y*2,x+50,y+50,900,450);
}

void bezierc2(int x, int y){
  stroke(255,200);
  fill(0,5);
  bezier(900,0,x*2,y*2,x*2,y*2,0,450);
}


void bezierc3(int x, int y){
  stroke(255,200);
  fill(0,5);
  translate(x/5,0);
  bezier(0,0,x,y,x,y,0,height);
}

void bezierc4(int x, int y){
  stroke(255,200);
  fill(0,5);
  
  if (y < height/2) {
    translate(0, -(height/2)+y);
    bezier(0,(height/2),x,y,x,y,width,(height/2));
  } else if (y > height/2) {
    translate(0, -(height/2) + y);
    bezier(0,(height/2),x,y,x,y,width,(height/2));
  }
}

