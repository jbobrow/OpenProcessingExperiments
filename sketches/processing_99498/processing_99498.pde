
int colora = 0;
int colorb = 0;
float tamanoa = 0;
float tamanob = 0;
float strokevaria = 0;
float fillvaria = 0;
float fillvaria2 = 0;

void setup () {
  size(1024, 576);
  background (0);
}

void draw () {
  fill (map (fillvaria, -1, 1, 193, 251), map (fillvaria, -1, 1, 39, 176), 45);
  stroke (0);
  strokeWeight (strokevaria);
  //rect (mouseX, mouseY, mouseY, mouseX);
  rect (mouseX, mouseY, map (fillvaria, -1, 1, 10, 100), map (fillvaria2, -1, 1, 10, 100));
  //rect (mouseX, mouseY, map (fillvaria, -1, 1, 10, 100), map (fillvaria2, -1, 1, 10, 100));
  tamanoa = tamanoa + 1;
  strokevaria = sin (tamanoa)*5+5;
  colora = colora + 1;
  fillvaria = cos (colora);
  fillvaria2 = tan (colora)/10;
  noCursor (); 
  
  //map (fillvaria2, -10, 10, 10, 100)
  //println (tamanoa);
  //println (strokevaria);
  println (fillvaria2);
  
  
  }



