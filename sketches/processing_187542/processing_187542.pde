
//Revolving_Arcs_2
//Draws partial arcs of increasing width and distance 
//appart that rotate in random directions
//I owe my modest understanding of Processing to many people
//who graciously share their code on line.

PImage img; 

int num=41, frames=100;
long rs;
float theta;


void setup() {
  img = loadImage("paper.png");
  size(800, 800);
  rs = (long) random(10000);
 
}

void draw() {
  image(img, 0, 0);
  rotateArc();
}

void rotateArc() {
  randomSeed(rs);      
   for (float i=5; i<= num; i= i + 2) {
    float x = width/2;
    float y = height/2;
    pushMatrix();
    translate(x, y);
    int speed=int(random(1, 4));
    int dir=random(1)>.5 ? 1 : -1; //rotation random clockwise/counter clockwise
    rotate(theta*dir*speed);
    float w = random(width*.2, width*1.2);
    float h = w;
    float start = random(TWO_PI);
    
    float end = start + random(2, TWO_PI);
    float sw = 5;
    sw = sw + i;
    stroke(#5DB5DA);
    strokeWeight(sw);
    noFill();
    arc(0, 0, sw*i, sw*i, start, end);
    popMatrix();
  }
  theta += TWO_PI/frames;
 
}

void mousePressed () {
  setup();
}



