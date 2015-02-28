
float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 3.3;

void setup(){
  size(640, 480);
}

void draw(){
  background(164, 204, 255);
  smooth();
  fill(40, 80, 250);
  rect(0, 315, 640, 640);
  fill(50, 250, 50);
  ellipse(350, 335, 215, 30);
fill(150,255,50);
  rect(300, 235, 100, 100);
  fill(255, 255, 255);
  ellipse(315, 240, 50, 50);
  ellipse(385, 240, 50, 50);
  fill(0, 0, 0);
  ellipse(325, 240, 10, 10);
  ellipse(375, 240, 10, 10);
  noFill();
  
arc(350, 270, 60, 60, HALF_PI, PI);

strokeWeight(4);
stroke(255, 160, 150);
line(322, 280, mouseX, mouseY);




noStroke();
  fill(255,10);
  rect(0,0,width,height);
   x = x + xspeed;
  y = y + yspeed;
    if ((x > 500) || (x < 0)) {
    xspeed = xspeed * -1;
     }
  if ((y > 270) || (y < 0)) {
    yspeed = yspeed * -1;
  }
    stroke(0);
  fill(175);
  ellipse(x,y,16,16);

}
