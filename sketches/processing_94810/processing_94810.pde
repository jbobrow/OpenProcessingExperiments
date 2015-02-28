
/* The Random Pokeballs    */
int value = 0;

void setup(){ 
  size(1000, 800);  //set of canvas
  background(64);  //gray background
  frameRate(10);  //
  
}

void draw () {
  fill(value);
 poke(random(1, 1000 ), random(1, 800));
      
}

void poke(float x, float y) {
  fill(255, 0, 0);  //start out pure red
  ellipse(0+x, 0+y, 200, 200);  //red top
  fill(255);  //white
  arc(0+x, 0+y, 200, 200, 0, PI); //white bottom
  fill(0);
  rect(-100+x, 0+y, 200, 10);  //black middle
  ellipse(0+x, 0+y, 60, 60); //black cirlce outside
  fill(255);
  ellipse(0+x, 0+y, 50, 50);  //white circle inside
  fill(0); 
  ellipse(0+x, 0+y, 35, 35);  //black cirlce inside
  fill(value);
  ellipse(0+x, 0+y, 25, 25); //white cirlce inside

  }
void mousePressed() {
    if(value == 0) {
    value = 255; 
  } else {
    value = 0;
  }
}


