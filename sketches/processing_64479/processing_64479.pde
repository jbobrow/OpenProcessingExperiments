
PImage cats;
float angle = 0.0;

void setup() {
  size(600, 600);
  cats = loadImage("cats.png");
  imageMode(CENTER);
}

void draw() {
  background(225);
  angle +=0.1;

  for (int i=0; i<=width; i+=80) { //nested forloop (to get repeated ellipse in horizontal)

    for (int j=0; j<=height; j+=80) { //nested forloop (repeating in the vertical)8

      float breath = map( sin(frameCount/10.0 + i + j), -1, 1, 100, 300);
      tint(255, 20);
      image(cats, i, j, breath, breath);
    }
  }
  
  translate(mouseX,mouseY); //tricking rect to think mouseX&Y is 0,0
  rotate(frameCount/10.0);
  tint(250,217,243);
  image(cats,0,0,300,300);
}


