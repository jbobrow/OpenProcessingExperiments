
//Lathem Wojno
//ChasingCreatures: Mad creatures chasing scared creature
//8/5/2013

float x;
float y;
float easing = 0.05;
float diameter = 12;

void setup() {
  size(1000, 1000);
  smooth();
}

//Draw Creatures
void draw() {
  if (mousePressed) {
    background(0);
    myScaredCreature();
  } else {
    background(225);
    myMadCreature();
    myScaredCreature();
  }
}

void myMadCreature() {

  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;

  //Draw Mad Creature
  
    //body
      fill(225, 6, 6);
  rect(x, y, 100, 200);

  
  //eyes
  ellipse(x+30, y+50, 30, 50);
  ellipse(x+70, y+50, 30, 50);

  //mouth
  rect(x+15, y+150, 70, 30);

  //eyebrows
  line(x+35, y+15, x+45, y+25);
  line(x+65, y+15, x+55, y+25);
  
}

void myScaredCreature() {

  //DrawScaredCreature

  //body
    fill(6, 6, 225);
  rect(mouseX, mouseY, 100, 200);

  
  //eyes
  ellipse(mouseX+30, mouseY+50, 30, 50);
  ellipse(mouseX+70, mouseY+50, 30, 50);

  //mouth
  rect(mouseX+15, mouseY+100, 70, 80);

  //eyebrows
  line(mouseX+30, mouseY+15, mouseX+15, mouseY+25);
  line(mouseX+70, mouseY+15, mouseX+85, mouseY+25);

}
