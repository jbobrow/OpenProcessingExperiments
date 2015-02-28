
int diamtere=50;
int r = 255;
int b = 255;
int g = 255;
void setup ()
{
  background(0);
  size(800,800);
  smooth();
}
void draw ()
{
  fill(r,g,b);
  ellipse(mouseX,mouseY,diamtere,diamtere);
  ellipse(width-mouseX,mouseY,diamtere,diamtere);
  key1();
  key2();
  key3();
  key4();
  key5();
  key6();
}
void key1(){
  if(keyPressed && (key=='r')){
     r=r-10;
  }
}
void key2(){
  if(keyPressed && (key=='b')){
     b=b-10;
  }
}
void key3(){
  if(keyPressed && (key=='g')){
     g=g-10;
  }
}
void key4() {
  if(keyPressed && (key=='e')){
    r=r+10;
  }
}
void key5() {
  if(keyPressed && (key=='f')){
    g=g+10;
  }
}
void key6() {
  if(keyPressed && (key=='v')){
    b=b+10;
  }
}

void mousePressed(){
  noLoop();
}

void mouseReleased(){
  loop();
}



