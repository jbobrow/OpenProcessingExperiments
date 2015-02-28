
//P112
PImage squ;
PImage squ2;

void setup() {
  size(600,100);
  squ= loadImage("sq.png");
  squ2= loadImage("sq2.png");
}
void draw() {
  for(int i=0;i<6;i++){
     image(squ,i*200,0);
    }
  for(int i=0; i<7; i++){
    translate(i*200,100);
    rotate(radians(180));
    image(squ,0,0);
  }

}


