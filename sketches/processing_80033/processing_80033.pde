
float angulo =0.0;
PImage imagen;

void setup (){
  size (800,800);
  background (0);
  smooth ();
  noStroke();
  imagen = loadImage ("circus-abstract-124.jpg");
  
}

void draw (){
  fill (0,12);
  rect (0,0,width, height);

  
  angulo= angulo +0.02;
  translate (400,400);
  rotate (angulo);
  image (imagen,0,0,100,100);
  
  angulo= angulo +0.03;
  rotate (angulo);
  image (imagen,0,0,200,200);
  
    angulo= angulo +0.3;
  rotate (angulo);
  image (imagen,0,0,50,50);
  
     angulo= angulo +0.3;
  rotate (angulo);
  image (imagen,0,0,30,30);
  
    angulo= angulo +0.2;
  translate (70,70);
  rotate (angulo);
  fill (255,0,0, 80);
  ellipse (200,200,50,50);
  
}

