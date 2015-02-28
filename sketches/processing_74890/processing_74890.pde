
void shapeA()
{
  fill(rouge, 100) ;
  stroke(rouge) ;
  int size = 75 ;
  float amp = 2.5 ;
  ellipse( width /2.0 , height /2.0 -size /amp , size, size ) ;
  
  fill(blanc) ;
  textFont(myFont, 48);
  text ("A", width /2.0  -16 , height /2.0 -size /amp +12 ) ;
}

void shapeB()
{
  fill(jaune, 100) ;
  stroke(jaune) ;
  int size = 75 ;
  float amp = 2.5 ;
  ellipse( width /2.0 +size /amp, height /2.0 , size, size ) ;
  
  fill(blanc) ;
  textFont(myFont, 48);
  text ("B", width /2.0  +size /amp -16 , height /2.0 +12 ) ;
}

void shapeC()
{
  fill(bleu, 100) ;
  stroke(bleu) ;
  int size = 75 ;
  float amp = 2.5 ;
  ellipse( width /2.0 , height /2.0 +size /amp , size, size ) ;
  
  fill(blanc) ;
  textFont(myFont, 48);
  text ("C", width /2.0 -16 , height /2.0 +size /amp +12 ) ;
}

void shapeD()
{
  fill(vert, 100) ;
  stroke(vert) ;
  int size = 75 ;
  float amp = 2.5 ;
  ellipse( width /2.0 -size /amp, height /2.0 , size, size ) ;
  
  fill(blanc) ;
  textFont(myFont, 48);
  text ("D", width /2.0 -size /amp -16, height /2.0 +12 ) ;
}

