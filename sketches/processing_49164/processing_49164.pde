
Boxer[] myBoxers = new Boxer[10];

void setup() {
  size(400, 400);
  smooth(); 
 // noStroke(); 


  for (int i=0; i<myBoxers.length; i++) {

    myBoxers[i] = new Boxer(i*50,random(0,height), color(255, 255, 0) );
  }
}

void draw() {

  background(255);
  for (int i=0; i<myBoxers.length; i++) {

    myBoxers[i].update();
    myBoxers[i].drawBoxer();
  }
}

void mousePressed() {
  for (int i=0; i<myBoxers.length; i++) {

    myBoxers[i].checkMousePress();
  }
}







