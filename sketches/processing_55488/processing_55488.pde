
void setup() {
    size(250, 250);                           //determines size of sketch window
    background(50,0, 0);
    rectMode(CENTER);                        //location at which the rect is drawn from, includes corner and center 
    noStroke();
    smooth();
  }    

void draw(){
  
  color bigColour = color(0, 50, 0);       //colour variable 
  int rsize = 250;                          //variables containing integers
 
  for (int i = 0; i<300; i = i+5) {
  fill(50+i, 0+i, 0, 255-i);
  translate(300, 100);
  rotate(2.20);                                 //in angle
  rect(125, 125, rsize, rsize);
  rsize = rsize-5;
  }

}

