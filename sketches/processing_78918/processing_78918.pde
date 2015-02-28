
PImage myImg;
float h,s,b;
 
void setup(){
  size(700,800);
  myImg = loadImage("crazy.png");
  colorMode(HSB,360,100,100,100);
  background(0);
}
 
void draw(){
  image(myImg,0,120);
  color cp = get(mouseX, mouseY);
  h = hue(cp);
  s = saturation(cp);
  b = brightness(cp);

  
  if (mousePressed) {     //inspired by Dana's poptart cat drawing program
    fill (h, s, b);
    stroke (h, s, b);
    strokeWeight (.2);
    ellipse (mouseX, mouseY-200, 2,2);
    rect(mouseX, mouseY+200,1, random(20));

  }

}




//PImage myImage = loadImage("crazy.png");
//
//void setup(){
//    size(960,720);
//    background(0);
//}
//
//void draw(){
//    image(cam, 0, 0);
//    color cp = get(mouseX, mouseY);
//    fill(cp);
//    noStroke();
//    rect(25, 25, 50, 50);
//}

