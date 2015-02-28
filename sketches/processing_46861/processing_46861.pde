

  PImage PICT;
  int rand;

 
void setup() {
  size (1280,960);
  rand = int(random(1,16));
  takerandomimage("PICT" + nf(rand, 3) + ".JPG"); //CALL YOUR FUNCTION 'takerandomimage'
}
  
void takerandomimage(String fn) {
   PICT = loadImage(fn); 
   image(PICT,0,0);


/*void draw() {
      image(PICT, 0, 0); */

}

/*

PImage fragment;
int rand;

void setup() {
 size(800, 600);
 rand = int(random(0,9)); //HERE YOU CHOOSE BETWEEN 10 DIFFERENT IMAGES
 takerandomimage("frag_" + nf(rand, 3) + ".jpg"); //CALL YOUR FUNCTION 'takerandomimage'
 //REMEMBER TO NAME YOUR IMAGES "frag_000.jpg"
}
// THIS IS THE FUNCTION
void takerandomimage(String fn) {
   fragment = loadImage(fn); //LOAD RANDOM IMAGE
   image(fragment,0,0);//DISPLAY RANDOM IMAGE
}

*/


