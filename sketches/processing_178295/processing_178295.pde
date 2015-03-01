
//Working with image in procesing

//Declare a PImage variable type
PImage Life;

//Load an image from HDD
/*Don't forget to add the file
to your sketch 'data' folder*/

//
//Define Color Palette
color[] rainbow = {#FAFF00,#6EFF0F, #0FFFD1, #0FB1FF, #0F31FF, #620FFF, #B60FFF, #FE0FFF, #FF0F94, #FF0F33, #FF600F, #FFAC0F, #FCF33B};
color[] palette = rainbow;
float counter =0;

float angle;
//size
float sz=200;
//random change of angle
float rndm=1.36;

void setup () {
  size (807, 590);
Life = loadImage ("Life.jpg");
fill(palette[int(random(1, 12))]);
}

void draw(){
  image (Life, 0, 0);
  angle+=PI/rndm;
  sz-=.5;
  pushMatrix();
   fill(palette[int(random(1, 12))]);
  translate(404, 245);
  rotate(angle);
  ellipse(sz,sz,10,10);
  popMatrix();
  if ((mousePressed)||(sz<-200)){
    rndm=random(1,2);
   // angle=0;
    sz=200;
    background(Life);
  }
  text(rndm,0,500);
}
//keyPressed()
void keyPressed(){
  if (key == DELETE || key == BACKSPACE) background(Life);
  if (key=='s' || key=='S') saveFrame("screenshot.png");
}


