
int a;
int b;
int c;
int i;
int x, y;
int d;

void setup() {
  size(600, 600);
  background(255);
  noStroke();
  smooth();
  fill(0);

  a = 0;
  b = 0;
  c = 0;
  i = 0;
  d = 0;
  x = width/2;
  y = height/2;
}

void draw() {
  fill(a, b, c, d);
   ellipse(x, y, 100, 100);
}

void mouseDragged() {
  i = i + 10;
  if (i > 100) {
    i = -i;
    d += 1;
  if(d > 255) {  
    d = 255;
  }
  }
  if (mouseButton == LEFT) {
    ellipse(mouseX, mouseY, i, i);
  }
  else if (mouseButton == RIGHT) {
    fill(255);
    ellipse(mouseX, mouseY, 25, 25);
  }
}

void keyPressed() {
  switch(key) {
  case 'a':
    background(255);
    println("a");
    break;
  }
}

void mouseMoved() {
  a ++;
  if (a > 255) {
    a = -a;
  }

  b += 5;
  if (b >255) {
    b = -b;
  }

  c += 10;
  if (c > 255) {
    c = -c;
  }
   d -= 1;
  if(d <0) {  
    d = 0;
  }
    ellipse(mouseX, mouseY, 1.7, 1.7);
   if(key == CODED){
    if(keyCode == LEFT){
      rect(mouseX, mouseY, 6.5, 6.5);
     }else if (keyCode == UP){
      ellipse(mouseX, mouseY, 1.7, 1.7);
     }else if (keyCode == RIGHT){
      ellipse(mouseX, mouseY,22,22);
      fill(255,255,255);
     }else if (keyCode == DOWN){
     ellipse(mouseX, mouseY,11,11);
       fill(255,255,255);
  }


  
  
}

}
 



