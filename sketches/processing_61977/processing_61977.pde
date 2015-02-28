

void setup()
{ 
  size(600, 800);
  background( 0, 0, 0 );
  smooth();
  frameRate(20);
} 
void draw() 
{ 
  image(loadImage("RONDO.jpg"), 0, 0 ); 
  image(loadImage("rondokentucky.jpg"), 300, 0 );  
  image(loadImage("rondokentucky.jpg"), 0, 400 );
  image(loadImage("RONDO.jpg"), 300, 400 ); 
  fill( 255, 255, 255 );

  textSize(55);
  textAlign( CENTER );
  text(  "RAJON RONDO", 300, 400  );
  text(  "#9", 50, 200  );
  text(  "BOSTON CELTICS", 300, 800  );

  //noLoop();
}


