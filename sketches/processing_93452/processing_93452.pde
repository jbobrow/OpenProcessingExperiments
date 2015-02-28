
int x;
int y;

void setup(){
  size(300,300);
}
void draw(){
  println();
  x = int(random(300));
  y = int(random(300));
}

void mousePressed(){
  // ^ could do the same for kepPressed:
//goes through void setup, draw and then this
//e.g. v
ellipse(x,y,50,50);
}

void keyPressed(){
  rect(x,y,50,50);
}



