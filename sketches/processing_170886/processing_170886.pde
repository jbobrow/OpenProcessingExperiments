
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
 
void setup() {
  img1 = loadImage("adg.jpg");
  img2 = loadImage("efj.jpg");
  img3 = loadImage("g.jpg");
  img4 = loadImage("j.jpg");
  img5 = loadImage("vsd.jpg");
  img6 = loadImage("c.jpg");
  size(700, 700);
  noStroke();
  colorMode(HSB);
}
 
void draw() {
  background(45,0,10);

  if (mouseY< height*3/5){
    image(img1, 0, 0);
}
  if (mouseY< height*2/5){
    image(img2, 0, 0);
  }
    if (mouseY< height*3/7) {
    image(img3, 0, 0);
  }
  if (mouseY< height*4/6){
    image(img4, 0, 0);
  }
  if (mouseY< height*5/6){
    image(img5, 0, 0);

  }
  if (mouseY< height/8){
    image(img6, 0, 0);

  }
  else {
  fill(random(255),random(255),255);
  } 

  
 
  }




