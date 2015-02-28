
float x;
float y;
//float easing = 0.04;
int speed = 4;


void setup () {
  smooth();
  size(400,400);
}

void draw () {
  
  /* float targetX = mouseX;
  x+= (targetX-x) * easing;
  //x=135;
  float targetY = mouseY;
  y+= (targetY-y) *easing;
  //y=100;*/

 x+= speed;
if (x>360) {
  speed*=-1;
} else if (x<0) {
  speed*=-1;
}
y = 150;

  float r = map(mouseX,0,400,20,40);
  float g = map(mouseX,0,400,20,50);
  float b = map(mouseX,0,400,50,200);
  background(r,g,b);
  //background(59,117,137);
  fill(170,180,183);
  ellipse(x,y+105,20,30);
  ellipse(x+30,y+105,20,30);
  ellipse(x+15,y+60,60,100);
  ellipse(x+15,y+20,100,100);
  if (mousePressed) {
    fill(255);
    ellipse(x-5,y+10,40,40);
    ellipse(x+35,y+10,40,40);
    fill(0);
    ellipse(x-5,y+15,15,15);
    ellipse(x+35,y+15,15,15);
  } else {
      fill(255);
      ellipse(x-5,y+10,35,35);
      ellipse(x+35,y+10,35,35);
      fill(0);
      ellipse(x-5,y+15,10,10);
      ellipse(x+35,y+15,10,10);
  }
    strokeWeight(3);
  line(x,y+40,x+30,y+40);
   if (mousePressed) {
  arc(x+15,y+40,30,20, 0, PI);
  }
  strokeWeight(2);
  fill(0);
  triangle(x+5,y+70,x-15,y+85,x-15,y+55);
  triangle(x+25,y+70,x+45,y+85,x+45,y+55);
  ellipse(x+15,y+70,25,25);
}

