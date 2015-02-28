
Eye[]eye=new Eye[101];
PImage eyepic1;

void setup() {
  size(700, 700);
  eyepic1 = loadImage("eyeball1.png");
  for (int i=0; i<101; i+=1) {
    eye[i]=new Eye((int)random(700), (int)random(700), (int)random(10), (int)random(10));
  }
}

void draw() {
  background(150, 150, 0);

  for (int i=0; i<101; i+=1) {

    eye[i].move();
    eye[i].bounce();  
    eye[i].display();
  }
}


