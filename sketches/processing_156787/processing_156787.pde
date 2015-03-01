
float x, y, d;
PImage gost;
PImage pac;
int gostX = 50;
int pacX = 450;

void setup() {
  size(600, 400);
  smooth();
  frameRate(10);
  fill(#FFEF00);
  gost = loadImage("gost.png");
  pac = loadImage("pac.png");
}

void draw() {
  background(0);
  pacMan();
  image(gost,gostX,50,100,100);
  gostX=gostX+10;
  image(pac,pacX,250,100,100);
  pacX=pacX-10;
  if (gostX>450) {
    gostX=-50;
  }
  if (pacX<-50){
  pacX=450;
  }
}

void pacMan(){
  noStroke();
   x = random(width);
   y = random(height);
   d = random(20, 100);
//  fill (#FFEF00);
  arc(x,y,d,d,PI*0.2, PI*1.8);
//  if (mousePressed && (dist(mouseX,mouseY,x,y)<d)) {
//     fill(255);
//  }
}

void mouseClicked(){
  if ((dist(mouseX,mouseY,x,y)<d)){
  fill(255);
  }else{
        fill(#FFEF00);
  }
}

//void mouseReleased(){
//    fill(#FFEF00);
//}


