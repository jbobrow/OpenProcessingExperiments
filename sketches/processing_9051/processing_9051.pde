
int x = 10;
PImage a;

void setup(){
  size(418,488);
}

void draw (){
  x =  x + 3;
  if (x > 255)
    x = 255;

  PImage a;
  a = loadImage ("01.jpg");
  tint (10+x); 
  image (a,0,0);


  PFont font;
  font = loadFont("Garamond-Italic-48.vlw"); 
  fill (random (150,255),random (50,200),0);
  textFont(font,20); 
  text("LA IMPORTANCIA DE LO IMPROBABLE", 25, 350);
  text ("PLAZA CUICUILCO",120,400);
  text ("MAYO 2010", 150,450);
}



