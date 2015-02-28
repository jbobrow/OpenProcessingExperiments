
PFont font;
PImage img;
int x = 0;
int x2 = 0;
int x3 = 0;
 
void setup() {
  size(500,400);
  font = loadFont("Impact-48.vlw");
  img = loadImage("knigi.jpg");
  textFont(font);
  smooth();
  noStroke();  
  background(210,210,210);
  image(img, 0,-50,350,450);

}

void draw() {
    background(210,210,210);
    image(img, 0,-50,350,450);
    pushMatrix();
    translate(x,0);  
    fill(255,0,0);
    text("BLAH", 250,250);  
    popMatrix();
    x+=2;
    if (x>20){
      pushMatrix();
      translate(x2,0);
      fill(200,0,0);
      text("BLAH", 300,300);
      popMatrix();
    }
    x2+=2;
    if (x2>40){
      pushMatrix();
      translate(x3,0);
      fill(150,0,0);
      text("BLAH", 400,350);
      popMatrix();
    x3+=2;
    }
  }



