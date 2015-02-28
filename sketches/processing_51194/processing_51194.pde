
float x;
float y;
float shadowW;
float shadowH;

float gravity = 0.1;
float speed = 0;

void setup() {
  size(320, 250);
  noStroke();
  x = 50;
  y = 200;
  shadowW = 40;
  shadowH = 10;
  smooth();
}

void draw () {
  background(0, 175, 200);
  fill(0, 175, 255);
  rect (0, 200, width, 50);
  rect (0, 0, width, 30);
  fill(0, 175, 230);
  beginShape();
  vertex(0, 0);
  vertex(30, 30);
  vertex(30, 200);
  vertex(0, 250);
  endShape();
  beginShape();
  vertex(320, 0);
  vertex(290, 30);
  vertex(290, 200);
  vertex(320, 250);
  endShape();
  fill(0, 150, 200);
  ellipse(x, 218, shadowW, shadowH);
  shadowW = 40 - ((-y+200)/7);
  shadowH = 10 - ((-y+200)/25);
  fill(255, 0, 0);
  ellipse(x, y, 40, 40);
  fill(255, 70, 70);
  ellipse((x+2), (y-2), 30, 30);
  fill(255,175,175);
  ellipse((x+7), (y-7), 5, 5);
   //speed  = speed + gravity; I tried to add gravity, but I commented it off cause it wasnt quite there yet.
   //y = y + speed;
   
  /* if (y > 200) {
     speed = speed * -0.7;
   }
   if (y < 30) {
     speed = speed * -1;
   }*/
   
}

void mouseDragged () {
  x = mouseX;
  y = mouseY; 
  if (y >= 200) {
    y = 200;
  }
  if (y <= 30) {
    y = 30;
  }
  if (x <= 40) {
    x = 40;
  }
   if (x >= 280) {
    x = 280;
  }
}

/*void mouseReleased (){
 

 }*/

