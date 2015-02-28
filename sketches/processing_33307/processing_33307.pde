
/*

 Jason Moran
 Aug. 8, 2011
 For Loops Homework
 
 */
PImage lemons;
PImage lemons2;
PImage lemonbackground;
float xlemonPos;
float ylemonPos;
float xlemon2Pos;
float ylemon2Pos;
int lemonsour;
int lemonsweet;

void setup() {
  size(600, 600);
  background(80);
  smooth();
  lemons = loadImage("lemons.png");
  lemons2 = loadImage("lemons2.png");
  lemonbackground = loadImage("lemonbackground.jpg");
  xlemonPos = 3600;
  xlemon2Pos = 10;
  ylemonPos= height/2;
  ylemon2Pos= 10;
  lemonsour = 30;
  lemonsweet = 30;
}

void draw() {
  background(80);
  image(lemonbackground, 0, 0);
  /*for (define counter and set to zero; condition under which the code is executed (how many times you want things to happen); how to increment the counter) {} "i++"-->"i=i+1"*/
  //for (int i = 0; i < lemonsour; i++) {
    //image(lemons + 20*i, ylemonPos, 10, 10);
  // }

  for (int i = 0; i < lemonsour; i++) {
    image(lemons, xlemonPos + -100*i, ylemonPos);
  }
//
 // for (int i = 0; i < lemonsweet; i++) {
  //  image(lemons2, xlemon2Pos + -100*i, ylemon2Pos);
 // }
  // (pow(-1,i) is equivalent to -1 to the power of i
  // for all even values of i, the expression will evaluate to 1
  // for all odd values of i, it will evaluate to -1

  xlemonPos -=1;
  //ylemonPos +=3;

  /*
  THE FOR LOOP TAKES THE PLACE OF HAVING TO TELL THE COMPUTER TO MANUALLY DRAW THESE CIRCLES!
   ellipse(40, 20,10,10);
   ellipse(60,20,10,10);
   */
}


