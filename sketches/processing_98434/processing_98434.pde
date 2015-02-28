
 var audioElement = document.createElement("audio");
PImage img;
PImage img2;
float midax;
float miday;
void setup() {
  size(600, 600);
  img = loadImage("missil.png");
  img2 = loadImage("Explosion__Stock__by_EnforcedCrowd.jpg");
  noSmooth();
         }
void draw() {
    for (int o=0; o<height; o++) {
    stroke((100-o/4)/4, (255-o/2)/2, 255-o/2, (255-o/4)/4);
    line(0, o, width, o);
 }
  midax=200;
 miday=20;
    imageMode(CENTER);
  image(img, mouseX, mouseY, midax, miday);
  noCursor();
 }
void mousePressed() {
  audioElement.setAttribute("src", "Explosion sound.mp3");
  audioElement.play();
  fill(0); 
  rect(0,0,width,height);
 image(img2, mouseX, mouseY, width+100, height+100);  
  }


