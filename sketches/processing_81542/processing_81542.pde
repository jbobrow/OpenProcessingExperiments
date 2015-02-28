
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/48855*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage img0;
PImage a;
PImage b;
PImage c;
PImage d;

void setup() {
  size(300, 402);
  noCursor();
   smooth();
   a =loadImage("scoop.png");
   c =loadImage("food.png");
   b =loadImage("scoop2.png");
   d =loadImage("happy.png");
   
   img0 = loadImage("bowl.JPG");
   background(img0);
}
 
void draw(){
  background(img0);
  if (mousePressed ==false){
         image (a, mouseX, mouseY);
  }

if (mousePressed ==true){
  image(c,  85,110);
  //mouseX, mouseY);
image(b, mouseX,mouseY);
   }
   
if (keyPressed == true) {
  image (d,0,0);
 }
}


