
PImage cat;

void setup() {
 size(800,300); 
 cat =loadImage("cat.jpg");
 cursor(HAND);
 
}

void draw(){
  noStroke();
  image(cat,0,0);
  noLoop();
}

void mousePressed() {
  int size=40;
  for (int x=0;x<size; x++){
    for (int y=0; y<size; y++){
  color pixel= get(mouseX-400+x, mouseY+y);
  fill(pixel);
  rect(mouseX+x, mouseY+y,1,1);
}
  }
}


