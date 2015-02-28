
PImage Baby;
PImage Skull;
PImage SmallBaby;
PImage Baby4;
PImage Baby3;

void setup (){
  size(800,800);
  Baby = loadImage("3355360fe05b8fcf4185ca83b00afcd9.jpeg");
  Skull = loadImage("Skull 2.png");
  SmallBaby = loadImage("Baby2.png");
  Baby4 = loadImage("Baby4.png");
  Baby3 = loadImage("Baby3.png");
  
  fill (219,219,188);
  rect (0,0,800,800);
  fill (75,75,75);
  rect (65,25,670,750);
  fill (75,75,75);
  rect (25,100,10,625);
  fill (75,75,75);
  rect (765,100,10,625);
  
  image(Baby,104,68,592,664);

}

void draw(){
  //image(Skull,334,108,286,299);
    //image(Baby,104,68,592,664);

tint(230,220,190,mouseX* 0.31);
  fill (mouseX,mouseY,mouseX,mouseY);
  image(Skull,334,108,286,299);
  //image(SmallBaby,586,565,110,168);
  //image(Baby4,102,68,221,212);
  tint(250,250,250,50);
  
  image(Baby,104,68,592,664);
  
  //tint(117,178,176,60);
  

}



