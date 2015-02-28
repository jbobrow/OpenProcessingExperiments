
float sizex = 50;
float sizey = 50;
color c = 0;
float x = 1;
float y = 1;  
float x1 = 1;
float y1 = 1;
float count = 0;
//float q = 255;
void setup() {
  size(480, 480);
  background(255);
}

void draw() {


  if (mousePressed) {
    x=mouseX;
    y=mouseY;
   fill(random(0, 255), random(0, 255), random(0, 255));
  stroke(155, 0, 0);
  point(x, y);
  while (count<100) {
    x1 = x+random(0, 4);
    y1 = y+random(0, 4);
    stroke(155, 0, 0);
    point(x1, y1);
    stroke(222, 128, 69,80);
    point(x1+1, y1);
    point(x1, y1+1);
    point(x1-1, y1);
    point(x1, y1-1);
    x=x+random(0, 2);
    y=y+random(0, 2);
    count++;
  }

  count = 0;
  } 
  else {
    fill(random(0, 255));
    sizex = random(30, 100);
    sizey = random(30, 100);
  }
}
void flame() {
 
}


