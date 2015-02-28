
/*
 
 width
 height
 smooth
 mouseX
 random
 map
 
*/

color canvasColor = color(255,255,255,20);

void setup() {
  size(400, 400);
  print("das fenster ist " + width + "px breit"); //width ist die breite des fensters
  println(" und " + height + "px hoch");          //height ist die höhe des fensters
  smooth();                                       //kanten glätten
  noStroke();
}

void draw() {
  fill(canvasColor);
  rect(0,0,width,height);                         //background(canvasColor);
  
  int x = mouseX;                                 //füllt x mit dem horizontalen koordinatenwert der maus 
  int y = mouseY;                                 //füllt y mit dem vertikalen koordinatenwert der maus 
  int randomGrey = (int)random(0,255);            //randomGrey soll eine ganzzahl zwischen 0 und 255 sein
  float ellipseSize = map(mouseX,0,width,0,50);   //mouseX wird im verhältnis 0 - 400 zu 0 - 50 proportioniert
  
  fill(randomGrey);
  ellipse(x,y,ellipseSize,ellipseSize);
}


