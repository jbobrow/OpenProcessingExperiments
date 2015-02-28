
float rot=0;
void setup() {
  size(700, 500);
  smooth();
  
}

void fstlyr() {
  int prim=20;
  int shpsz=10;
  ellipse(mouseX-prim, mouseY, shpsz,shpsz);
  ellipse(mouseX, mouseY-prim, shpsz,shpsz);
  ellipse(mouseX, mouseY+prim, shpsz,shpsz);
  ellipse(mouseX+prim, mouseY, shpsz,shpsz);
}
void scdlyr() {
  int prim=20*2;
  int shpsz=12;
  ellipse(mouseX-prim, mouseY, shpsz,shpsz);
  ellipse(mouseX, mouseY-prim, shpsz,shpsz);
  ellipse(mouseX, mouseY+prim, shpsz,shpsz);
  ellipse(mouseX+prim, mouseY, shpsz,shpsz);
  rect(mouseX-prim, mouseY-prim, shpsz,shpsz);
  rect(mouseX+prim, mouseY-prim, shpsz,shpsz);
  rect(mouseX-prim, mouseY+prim, shpsz,shpsz);
  rect(mouseX+prim, mouseY+prim, shpsz,shpsz);

}
void thdlyr() {
  int prim=20*3;
  int shpsz=14;
  ellipse(mouseX-prim, mouseY, shpsz,shpsz);
  ellipse(mouseX, mouseY-prim, shpsz,shpsz);
  ellipse(mouseX, mouseY+prim, shpsz,shpsz);
  ellipse(mouseX+prim, mouseY, shpsz,shpsz);
  rect(mouseX-prim, mouseY-prim, shpsz,shpsz);
  rect(mouseX+prim, mouseY-prim, shpsz,shpsz);
  rect(mouseX-prim, mouseY+prim, shpsz,shpsz);
  rect(mouseX+prim, mouseY+prim, shpsz,shpsz);
 
}
void frhlyr() {
  int prim=20*4;
  int shpsz=16;
  ellipse(mouseX-prim, mouseY, shpsz,shpsz);
  ellipse(mouseX, mouseY-prim, shpsz,shpsz);
  ellipse(mouseX, mouseY+prim, shpsz,shpsz);
  ellipse(mouseX+prim, mouseY, shpsz,shpsz);
  rect(mouseX-prim, mouseY-prim, shpsz,shpsz);
  rect(mouseX+prim, mouseY-prim, shpsz,shpsz);
  rect(mouseX-prim, mouseY+prim, shpsz,shpsz);
  rect(mouseX+prim, mouseY+prim, shpsz,shpsz);
 
}
void fthlyr() {
  int prim=20*5;
  int shpsz=18;
  ellipse(mouseX-prim, mouseY, shpsz,shpsz);
  ellipse(mouseX, mouseY-prim, shpsz,shpsz);
  ellipse(mouseX, mouseY+prim, shpsz,shpsz);
  ellipse(mouseX+prim, mouseY, shpsz,shpsz);
  rect(mouseX-prim, mouseY-prim, shpsz,shpsz);
  rect(mouseX+prim, mouseY-prim, shpsz,shpsz);
  rect(mouseX-prim, mouseY+prim, shpsz,shpsz);
  rect(mouseX+prim, mouseY+prim, shpsz,shpsz);
 
}

void draw() {
int go=1;
  float posX=mouseX;
  float posY=mouseY;
  float s = 5;
  float sI=10;
  float sII=15;
  float sIII=20;
  float sIV=25;
  float expld=30;
  float explds=0;
  float d = dist(mouseX, mouseY, pmouseX, pmouseY);
  background(d+10, d+40, d+100);
  
  
  if(d > s){
  translate(posX,posY);
  rotate(rot);
  translate(-posX,-posY);
  rot=rot+0.05;
  fstlyr ();
  }
  if(d > sI){
  scdlyr ();
  rot=rot+0.10;
  }
  if(d > sII){
 thdlyr();
 rot=rot+0.15;
  }
  if(d > sIII){
 frhlyr();
 rot=rot+0.20;
  }
  if(d > sIV){
    fthlyr();
    rot=rot+2.5;
  }


}

