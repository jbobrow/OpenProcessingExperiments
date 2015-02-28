
void setup() {
  size(300, 300);
  background(34, 45, 209);
}
/*
int x= 10;
 int y= 50;
 
 void draw() {
 background (220, 145, 0);
 fill(250, 255, 18);
 stroke(mouseX);
 ellipse(30, 30, x, x);
 
 if (x>50) {
 x=y;
 y--;
 }
 else {
 x++;
 }
 }
 this is not working smoothly. will ask how to fix later*/
int dynX=150; //dynamite x coord
int dynY=30; //dynamite Y coord


int fuseL=25; //fuse length
int fuseH=dynY-fuseL; //fuse height
int fuseH2=180;



void draw() {
  background(34, 45, 209);
  fill(75, 26, 2);
  rect(-1, 280, width, 20);
  //clouds
  fill(255,255,255);
  noStroke();
  ellipse(45,50,120,17);
  ellipse(80,35,35,35);
  ellipse(45,35,40,40);
  ellipse(15,35,35,35);
  
  ellipse(245,150,120,17);
  ellipse(280,135,35,35);
  ellipse(245,135,40,40);
  ellipse(215,135,35,35);

  //safety zone
  fill(47, 216, 39);
  rect(0, 295, width, 5);
  //dynamite
  strokeWeight(2);
  fill(255, 0, 0);

  //the top of the rect is dynY
  rect(dynX-10, dynY, 21, 75);
  ellipse(dynX, dynY, 20, 8);
  strokeWeight(0);
  ellipse(dynX, dynY+75, 20, 8);

  //write TNT if you have time

  //fuse
  fill(255, 255, 255);
  rect(dynX-2, fuseH, 4, fuseL);

  //flame
  fill(255, 255, 0);
  triangle(dynX-2, fuseH, dynX, fuseH-8, dynX+2, fuseH);

  //drop
  dynY++;
  fuseH++;

  if (fuseH>dynY-25) {
    fuseH=fuseH2;
  }

  if (dynY> 205) {
    dynY=205;
    fuseH2++;
    fuseL--;
  }
  if (fuseL < 1) {
    fuseL=0;
    fuseH2=205;
    background(255, 255, 255);
  }
  if (mouseY>=295) {
    noLoop();
  }
}


