
PImage more ;
PFont atmosphere ;
int x = 0 ; //font
int x1 = 0 ;

void setup() {
  size(475, 500) ;
  more = loadImage("morebetter.jpeg") ;
  atmosphere = createFont("Apple-Chancery-48.vlw", 128) ;
  
}

void draw() {
  image(more, 0, 0) ;
  
   textFont(atmosphere, 48) ;
  text("Please put your shoes on and step into that warm weather. Go get yourself a more better for ever...", x, 450) ;
  
  x = x - 2 ;
  println(x) ;
  if (x < -2300) 
  x = width ;
  
  fill(0, 0, 0) ;
  rect(x1+100, 200, 200, 100) ; //cargo
  fill(0, 0, 0) ;
  rect(x1+290, 270, 50, 25) ; //connector
  fill(0, 0, 0) ;
  rect(x1+330, 200, 90, 100) ; //cab
  fill(0, 0, 0) ;
  rect(x1+410, 245, 60, 55) ; //engine block
  fill(0, 0, 0) ;
  ellipse(x1+135, 320, 75, 75) ; //rear tire
  fill(0, 0, 0) ;
  ellipse(x1+250, 320, 75, 75) ; //front cargo tire
  fill(0, 0, 0) ;
  ellipse(x1+390, 320, 75, 75) ; //cab tire
  
  x1+=10 ;
  println(x1) ;
  if (x1 > 500) 
  x1 = width ;
  
}


