
float x = 0;
float y = 0;
float radx = 100;
float rady = 60;
PImage img;
float speed = .2;
float angle = 0.0;
float x1 = x;
float y1 = y;
float scalar = 10;

void setup(){
  size(600, 400);
  ellipseMode(RADIUS);
  img = loadImage("seaBackground.jpg");
  
}

void draw(){
 image(img, 0, 0, 600, 400);

fish(mouseX, mouseY, -1);


}

void fish(float posx, float posy, float d){
  pushMatrix();
  scale(d,1);
  translate(d*posx, posy);
  noStroke();
  fill(255, 255, 0);
  ellipse(x, y, radx, rady);//body
  fill(0);
 ellipse(x+(radx/2), y-(rady/4), radx/10, rady/6);//eye
fill(0, 0, 255);
float x1 = sin(angle); //gives movement to tailfin
float y1 = sin(angle)*scalar;
angle += speed;
arc(x-(radx+45), y1, radx/2, rady-10,4.08, TWO_PI);//tailfin
arc(x-(radx+45), y1, radx/2, rady-10, 0, 2.2);
 rotate(.2);
arc(x, y+(rady/5), radx/5, rady+10,.16, PI); //fin
popMatrix();
  
}






