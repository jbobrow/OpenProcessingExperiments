
PImage plate;
PImage cookies;
PImage sugar;
PImage bite;

float hX;
float mX;
float sX;

void setup(){
  size(400, 400);
  smooth();
    plate = loadImage("plate.jpg");
    cookies = loadImage("cookies.png");
    bite = loadImage("bite.png");
    sugar = loadImage("sugar.png");
 }

void draw(){

   //text((hour()+":"+minute()+":"+second()),30,50);
  
   PImage myImage = loadImage("plate.jpg");
  imageMode(CENTER);
  image(myImage, width/2, height/2);
  
  hX = map(hour(), 0, 200, 100, (height-50));
  mX = map(minute(), 0, 200, 250, (height-50));
  sX = map(second(), 0, 50, 60, (height-50));
  
  image(bite, 200, width-hX);
  image(cookies, 250, height-mX);
  image(sugar, 90, height-sX);
  
  /*fill(255, 150, 200);
  ellipse(hX, 0, 45, 50);
  fill(255, 0, 255);
  rect(mX, 100, 5, 100);
  fill(255, 100, 100);
  rect(sX, 200, 25, 50);*/
 
}




