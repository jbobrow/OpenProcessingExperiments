

PImage A;
PImage C;
PImage F;
PImage C2;


float angle =0.0;

void setup(){
  size (1000, 1000);
  imageMode(CENTER);
}

void draw (){
  background(255);
  
  
  angle += 0.07;  
  translate (width/2, height/2);
  rotate (angle);

   F= loadImage("F.png");
  image (F, 0,0);

  A = loadImage("A.png");
  image (A, 0,0);

  C = loadImage("C.png");
  image (C, 0,0);
imageMode(CENTER);
   
  
}

