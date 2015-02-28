

//Übung 1.4.0 - Random
  int g = 30;
  float rot = 255;
  float positionX = width/2;
  float positionY = height/2;

void setup (){
  background(255); 
  size (500,500);
  smooth();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
}


void draw(){
  //rotate(0.25);
  rotate(random(0,255));
  rot = random (0,255);
  fill (random(0,255),random(0,255), random(0,255));
  noStroke(); 
  rect (positionX, positionY,g,g);
  positionX = random(0,width);
   positionY = random(0,height);

}

void mousePressed(){
  saveFrame("konfetti.png");
}

