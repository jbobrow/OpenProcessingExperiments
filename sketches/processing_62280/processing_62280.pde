

void setup()
{ 
  size(600, 800);
  background( 0, 0, 0 );
  smooth();
  frameRate(20);
} 
void draw() 
{ 
  image(loadImage("lb.jpg"), 0, 0 ); 
  image(loadImage("24.jpg"), 300, 0 ); 
  image(loadImage("kd.jpg"), -150, 300 );

 
 
  fill( 255, 255, 255 );

  textSize(55);
  textAlign( CENTER );
  text(  "LBJ6 or KB24???", 300, 350  );

  

  //noLoop();
}

