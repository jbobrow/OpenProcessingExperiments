
//PM11
PImage squ;
PImage squ2;

void setup() {
  size(600,100);
  squ= loadImage("sq.png");
  squ2= loadImage("sq2.png");
 
}
void draw() {

  for(int i=0; i<4; i++){
     image(squ,i*200,0);
  } 
  image(squ2,100,0);
  translate(200,0);
  image(squ2,100,0);
  translate(200,0);
  image(squ2,100,0);
}

