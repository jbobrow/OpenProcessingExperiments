
PImage myimage;
PImage newimage;
void setup() {
  size(600,600);
  myimage =loadImage("sky.jpg");
  image(myimage, 0,0, width, height);
  

   
}
void draw () {
  tint(mouseX);
   smooth();
   strokeWeight(random(15,100));
  line (mouseX, mouseY-random(160,400), mouseX-150, mouseY-440);
stroke (random(0,255), random(100,255),random(130,200),10);

}
 
 

