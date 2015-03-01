
PImage img;  
float x = 0;
float y = 0;
int my = 12;
int mx = 12;

void setup() {
  size (800,800);
frameRate(300);
}

void draw() {
  background (150);
  
  paul(mouseX,mouseY);
  stickman(x,y);
  x += mx;
  y += my;
  if (y > height || y < 0){
    my *= -1;
  }
  if (x > width || x < 0){
    mx *= -1; 
  }
 
 if (abs(x-pmouseX)<25 && abs(y-pmouseY)<25){
    
    x = random(30);
    y = random(400);

 }
}
void paul(float x, float y){
  img = loadImage("paulwayblackandwhite.jpg");
    imageMode (CENTER);
    image(img, x, y);
}
void stickman(float x, float y){
  fill(255);
  ellipse(x, y - 30, 20,20);
  strokeWeight(2);
  line(x,y-20,x,y+20);
  line(x,y+20, x+15, y+ 40);
  line(x, y+20, x-15, y+40);
  line(x, y-5, x+20, y-10);
  line(x, y-5, x-20, y-10);
}


