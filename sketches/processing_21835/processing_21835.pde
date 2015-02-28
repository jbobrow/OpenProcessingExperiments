
//PMM2
PImage squ;
PImage squ2;

void setup() {
  size(600,200);
  squ= loadImage("sq.png");
  squ2= loadImage("sq2.png");
  image(squ2,0,0);
  image(squ,100, 0);
  translate(200,200);
  rotate(radians(180));
  image(squ2,0,0);
  image(squ,100, 0);
}
void draw() {
  translate(200,0);
  for (int i=0; i<20; i++){
  image(squ2,0,0);
  image(squ,100, 0);
  translate(200,200);
  rotate(radians(180));
  image(squ2,0,0);
  image(squ,100, 0);
  }
    translate(200,0);
  for (int i=0; i<20; i++){
  image(squ2,0,0);
  image(squ,100, 0);
  translate(200,200);
  rotate(radians(180));
  image(squ2,0,0);
  image(squ,100, 0);
  }

 
  

 
}


