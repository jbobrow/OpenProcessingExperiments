
//Irene Hwang 2012 

ArrayList normals = new ArrayList();
int speed_x;
Particle[] flies = new Particle[30];
PImage fly_pic; 
PImage hand_pic;
void setup() {
  size(500, 500);
  for (int i = 0; i<30; i++) {
   flies[i] = new Particle(random(width), random(height));
   flies[i].damping = 0.003;
   normals.add(i);
    flies[i].addForce(-2, 4);
    


  }
  
  fly_pic = loadImage("Fly.png");
  hand_pic= loadImage("1.png");
}

void draw() {
background(random(100),random(100),random(100));

  for (int i = 0; i<30; i++) {
    flies[i].update();
    flies[i].display();
  }
}
void mouseDragged() {
     for (int i=0; i<30; i++) {
//    flies [i] = (Particle) normals.get(i);
    flies[i].addAttractionForce(mouseX, mouseY, 100, 10);
  }
  stroke(3);
  fill(299);
  //ellipse(mouseX, mouseY, 200,220);
  image(hand_pic, mouseX, mouseY, 250, 250);

}
