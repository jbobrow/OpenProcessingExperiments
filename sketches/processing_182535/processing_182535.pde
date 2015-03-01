
//creiamo una finestra di 600x600 pixel di colore rosa chiaro//
void setup(){
  size (600,600);
  background (252,181,204);
  fill(19,112,185);
  smooth();
  //diamo il comdando per muovere il il mouse//
 //diamo il comando che se il mouse è premuto inverti i colori//
  //sia lo sfondo che il riempimento//
}void draw (){
  if (mousePressed){
    background (19,112,185);
    fill (252,181,204);
  }else{
    fill (255,235,3);
  }
  ellipse(mouseX,mouseY,80,100);
}


