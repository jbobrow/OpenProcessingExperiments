
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/74884*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//paint with your mouse paintings Gottfried Beyreuther

PImage img;

float angle = 0.0;
   void setup() {
     size(800, 800);
     
     img = loadImage("gbor01.jpg");

  image(img, 0, 0);
     smooth();
     frameRate(30);
}
   void draw() {
     translate(mouseX, mouseY);
     rotate(angle);
    
  //IMAGEMANIPULATIONSTUFF///////////////////////////////////////////   
      image(img, 0, 0, width/4, height/4);
     fill(random(100, 200), random(200, 255), random(0, 100));
     angle += 3;
}

void keyPressed()
{
   println(key);
  if (key =='s');// pour sauvegarder l image
saveFrame("pict######.png");



}


