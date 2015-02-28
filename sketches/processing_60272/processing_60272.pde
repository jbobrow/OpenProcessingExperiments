
int r=0;
int rnum=33;
int p=0;

float rectsize = 0;


boolean down = false;
boolean up = true;

int pmax = 100;
int pmin = 0;
 
void setup(){
  size( 1200, 600 );
  background(0);
  smooth();
  frameRate(1000);
  colorMode(RGB, 100);
  noStroke();
  noFill();
}

void keyPressed(){
  switch(keyCode){
    case UP:
    rnum++;
    break;
    case DOWN:
    rnum--;
    break;
}
}
  void mouseReleased() {
    fill(0,0,0,0);
}

void draw() {
  noStroke();
  if (mousePressed) {
    fill(random(255),0,random(255), 30);
  }


/*  if (mousePressed && key == 'w') {
    fill(255, 255, 255, 0);
*/

    if (keyPressed){
      if ( key == '1' ){
    fill(random(255),0,0, 30);
    }
    }
      if (keyPressed){
      if ( key == '2' ){
    fill(random(255), random(255), 0, 50);
    }
    }
      if (keyPressed){
      if ( key == '3' ){
    fill( 0, random(255), 0, 50);
    }
    }
      if (keyPressed){
      if ( key == '4' ){
    fill( 0, random(255), random(255), 50);
    }
    }
          if (keyPressed){
      if ( key == '5' ){
    fill( 0, 0, random(255), 50);
    }
    }
          if (keyPressed){
      if ( key == '6' ){
    fill( random(255), 0, random(255), 50);
    }
    }
    
    if (keyPressed){
      if ( key == ' ' ){
    background(0);
    }
    }
 
  translate(mouseX, mouseY);
  rotate(r);
  ellipse(p, p, rectsize, rectsize);
 r+=rnum;
if (down) { 
  p--;
}
else if (up) {
  p++;
}
if(p==pmax){
  down=true;
  up=false;
}
else if (p==pmin){
  down=false;
  up=true;
}

if (p > 0) {
   rectsize = 12;
 }
  if (p > 10) {
   rectsize = 10;
 }
  if (p > 20) {
   rectsize = 8;
 }
  if (p > 30) {
   rectsize = 6;
 }
 if (p > 40) {
   rectsize = 4;
 }
    println(rnum);
}

