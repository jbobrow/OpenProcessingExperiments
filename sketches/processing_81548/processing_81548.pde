
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/48855*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage img0;
PImage a;
PImage b;
PFont font;


void setup() {
  size(400, 450);
  noCursor();
   smooth();
   a =loadImage("alpha.png");
   b =loadImage("beta.png");
   img0 = loadImage("cat.png");
   background(img0);
   font = loadFont("Futura-Medium-48.vlw");
  textFont(font);
}
 
void draw(){
  background(img0);
   textSize(25);
  text("Find the monster...",20, 100);
  if (mousePressed ==true){
         image (a, mouseX-500, mouseY-500);
  }

if (mousePressed ==false){
  image(b, 0,0);
  //mouseX, mouseY);

} 


}

 
 

