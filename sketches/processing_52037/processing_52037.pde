


void setup (){
 size(800,800);
smooth();
noFill();
strokeWeight(3);

}

void draw() {
fill(34,87,155, 20);
rectMode(CENTER);
  rect(400,400,width,height);

float x= mouseX;
float y= mouseY;
float ix = width-mouseX;
float iy= height-mouseY;
stroke(255,0,0, 150);
rect(x, 400, y, y);
stroke(0.255,0, 159);
rect(ix, 400, iy, iy);

stroke(255,0,0, 150);
rect(x+20, 300, y-300, y-300);
stroke(0.255,0, 159);
rect(ix+20, 300, iy-300, iy-300);

}


