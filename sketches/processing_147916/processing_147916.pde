

PImage MJ;

void setup() {
  size(600 ,620);
  MJ = loadImage("King.jpg");
  

}
void draw() {


     image(MJ, 0, 0, width, height);


int time= second();

    if (time % 2 == 0)
  {MJ.filter(THRESHOLD);}
   else if (time % 2 == 1) 
   {MJ.filter(GRAY);}

 for (int j=0; j<100;j++)
 {

  strokeWeight(random(10));
  stroke (random(255),random(255),random(255));
  line (j,0,j,620);
  line ((500+j),0,(500+j),620);
}


}
  


