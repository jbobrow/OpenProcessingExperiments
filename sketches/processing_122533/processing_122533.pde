
int a;
int b;
int c;
int i;

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
}

void draw() {
  fill(a, b, c);
}

void mouseDragged(){
  i = i + 10;
  if(i > 100){
    i = -i;
  }
  if(mouseButton == LEFT){
    ellipse(mouseX, mouseY, i, i);
  }else if(mouseButton == RIGHT){
    fill(255);
    ellipse(mouseX, mouseY, 25, 25);
  }
}

void keyPressed(){
  switch(key){
    case 'a':
     background(255);
     println("a");
     break;
  }
}

void mouseMoved(){
  a ++;
  if(a > 255){
    a = -a;
  }
   
  b += 5;
  if(b >255){
    b = -b;
  }
   
  c += 10;
  if(c > 255){
    c = -c;
  }
}

  



