
/*Adapted from Paolo Decaro*/

long x;
long y;
int a;
PFont font1, font2, font3, font4, font5, font6;
 
void setup() {
  size(400, 400);
  smooth();
  font1 = loadFont ("JellykaDeliciousCake-187.vlw");
  font2 = loadFont ("Churli_Cute-200.vlw");
  font3 = loadFont ("Churli_Cute-250.vlw");
  font4 = loadFont ("Churli_Cute-100.vlw");
  font5 = loadFont ("Churli_Cute-50.vlw");
  font6 = loadFont ("Churli_Cute-30.vlw");
}
 
void draw() {
 
textFont(font1); //Set first font
fill(255, 20);
text("Fade", 15,395);
//text("Fade", -40, 400);

textFont(font2); //Second font
fill(110, 109, 109, 50);
text("U", 145, 330);

textFont(font3); //Third font
fill(48, 48, 48, 50);
text("U", 30, 400);

textFont(font4); //Fourth font
fill(159, 158, 159, 50);
text("U", 230, 190);

textFont(font5); //Fourth font
fill(204, 203, 203, 50);
text("U", 300, 100);

textFont(font6); //Fourth font
fill(236, 235, 235, 50);
text("U", 380, 50);


  if (mousePressed) {
    a=0;
    noStroke();
    fill(pmouseX, 160, pmouseY, 25);
ellipse(mouseY, mouseX, mouseX+x, mouseY+y);

  }
  else {
    if (a != 255) {
      a=a+1;
      noStroke();
      fill(255,a);
      rect(0,0,400,400);
    }
  }

  x=100;
  y=100;
 
  }   



