
int rojo=int(random(255));
int verde=int(random(255));
int azul=int(random(255));
color cp=color(rojo, verde, azul);

PImage merca;
int X=int(random(140));
int Y=int(random(320));

void setup(){
      /* @pjs preload="mercado.jpg"; */
size(400, 400);
background(255);
merca=loadImage("mercado.jpg");
image(merca, 0, 0, 200, 400);
}
void draw(){

PImage crop=get(X,Y,60,80);
noFill();
strokeWeight(7);
stroke(255);
rect(X,Y,60,80);
noStroke();
image(crop,200,0,200,400);
for (int i=200; i<400; i++) {
  for (int j=0; j<400; j++) {
    set(i, j, get(i, j)+cp);
  }
}
  for (int w=X; w<X+60; w++) {
  for (int h=Y; h<Y+80; h++) {
    set(w, h, get(w, h)+cp);
  }
  }
delay(150);
}

void mousePressed() {

      X=mouseX;
 Y=mouseY;
 image(merca, 0, 0, 200, 400);
}


