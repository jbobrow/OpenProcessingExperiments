

PFont font;
float x = 0;


void setup (){
  size(250, 250);
  font = loadFont ("Courier-20.vlw");
  textFont (font);
}

void draw () {
  background(#9B0000, 100);
  //strokeWeight(13);
  //stroke(#FFBC03, 70);
  //line(0, 118, 250, 118);
  
  fill(255, 150); //white text
  text("m2k2v6", x, 125); //text sits in middle
  x += 95.0; //speed
  
  //fill(255, 150);
  fill(#FF5703); //dark orange capitols
  text("M K V ", x, 125);
  
  if (x > width){
    x = -100; //text starts from off the grid
    
  fill(255, 70);
  text("m2k2v6", x, 125);
  }
}



