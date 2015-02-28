
PImage kotti;
PImage geld;
PImage panda;
PImage geld1;
PImage panda2;
PImage panda3;
PImage regen1;
int grenzeX = 200;
int grenze1X = 210;
int grenzeY = 260;
float y = 0.1;
void setup () {
  size (520,347);
  kotti = loadImage("kottifoto.jpg");
  geld1 = loadImage("geld1.png");
  geld = loadImage("geld.png");
  panda = loadImage("panda.png");
  panda2 = loadImage("panda2.png");
  regen1 =loadImage("kottiregen.png");
  panda3 = loadImage("panda3.png");
  background (200);
  smooth();


}
void draw(){
   noCursor();
//println(mouseX); 
  
  image(kotti, 0,0);
  image(panda, 150, 150);
  image(geld1, mouseX, mouseY);
 

 if (mouseX >= grenzeX && mouseX <= grenze1X && mouseY >= grenzeY) {
  image(panda2, 150, 150);
   image(geld, mouseX-5, mouseY);

}
if (mousePressed && mouseX >= grenzeX && mouseX <= grenze1X &&
mouseY >= grenzeY) {
image(panda3,  150, 150);

}

y = y+4;
  if (y > 520){
    y=0;
}

  image(regen1,0, +y);
  image(regen1,0, +y-520);

  
}



