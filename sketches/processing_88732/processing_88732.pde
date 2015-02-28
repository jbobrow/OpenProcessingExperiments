
float x = -250;
color bgcolor = color(random(50),random(50), random(50));
PImage img;

void setup(){
  size(800,500);
  background(bgcolor);
  smooth();
  img = loadImage("puppydog_2.png");
  image(img,625,150);

}

void draw(){
background(bgcolor);
 textSize(32);
fill(0, 102, 153, 204);
text("Grab the Trident! Save the Puppy!", 150, 45);
 image(img, 625, 150);
drawTrident();

if( x == 300){
  x = x ;
  background(50, 0, 0);
  for (int i = 0; i < 40; i = i+1) {
    ellipse(random(2*width/2),random(height), random(0,20), random(0,20));
textSize(47);
fill(255,0,0);
text("I'VE NEVER SEEN SO MUCH BLOOD", 0, 345);
  }}
  if (mousePressed ==true ){
  x = x;
}
  else if(x < 300){
x = x + 5;
  }
  else {
    x = x;
  }

}
void drawTrident(){
  fill(255,0,0);
  rect(x, 250, 300, 10);
  rect(x + 300, 205, 15, 100);
  rect(x + 300, 205, 50, 10);
  rect(x + 300, 250, 50, 10);
  rect(x + 300, 295, 50, 10);
  triangle(x + 350, 205, x + 370, 210, x + 350, 220);
  triangle(x + 350, 250, x + 370, 255, x + 350, 260);
  triangle(x + 350, 290, x + 370, 300, x + 350, 305);
}


