

PImage MJ;

void setup() {
  size(600 ,620);
  MJ = loadImage("King12.jpg");

}
void draw() {

     image(MJ, 320, 300);


int time= second();

  if (time % 2 == 0)
  {filter(POSTERIZE, 100);}
   else 
   {filter(THRESHOLD);}
 for (int j=0; j<100;j++)
 {

  strokeWeight(random(10));
  stroke (random(255),random(255),random(255));
  line (j,0,j,620);
  line ((500+j),0,(500+j),620);
}


}
  


