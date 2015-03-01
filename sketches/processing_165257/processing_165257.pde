
Particle [] particles = new Particle [3];

void setup() {
  size (900, 900, P3D);  
  particles[0] = new Particle(300, 250);
  particles[1] = new Particle(150, 125);
  particles[2] = new Particle(75, 62);
  // three = new Particle(150, 125);
}

void draw() {
  background(10);
  translate(width/2, height/2);
  for (int i=0; i < particles.length; i++) {
    particles[i].display();
    particles[i].display();
//    particles[i+2].display();
    
    //translate(200, 200); //caused accidental (but happy) orbit with rotation function ?
    //particles[i+1].display();
  }
}



class Particle {
  float x;
  float y;
  int circNum;
  int csizeMax;
  int csizeMin;
  int a;
  
  Particle (int tempMax, int tempMin) {
   circNum = 5;
   csizeMax = tempMax;
   csizeMin = tempMin;
   a = 1;
}

void display(){
  pushMatrix();
    for (int i=1; i < circNum; i++) {
      rotate (a*map(i, 1, circNum, .005, .0005)); // by multiplying mapping by a it provides a seperate roatation for each circle
      fill (map(i, 1, circNum, 1, random(250, 255)),  map(i, 1, circNum, 255, random(10)), 220, 150); //playing with color
      float tempSize = map(i, 0, circNum, csizeMax, csizeMin); //creating a temporary size to later adjust ellipse
      noStroke();
      ellipse(x, y, tempSize*(sin(a*map(i, 1, circNum, .005, .0005))+1), //using sin and cos provide movement
      tempSize*(cos(a*map(i, 1, circNum, .005, .005))+1));
    }
  a++;
  popMatrix();
  
}

//how can I group all the circles together in an object I can then move together?
//void move(){ 
//  y = 500*sin(0.005);
//  x = 500*cos(0.005);
//  if (y > height){
//    y = 0;
//  }
//  if (x > width){
//    x = 0;
//  }
  
    
}


