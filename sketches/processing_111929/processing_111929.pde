
/*
 This sketch references code available in "Form + Code."
 * Form+Code in Design, Art, and Architecture 
 * by Casey Reas, Chandler McWilliams, and LUST
 * Princeton Architectural Press, 2010
 * ISBN 9781568989372
 
*/
 
 

void setup() {
  size( 600, 900 );
  smooth();
  fill(51,22,121); 
}

void draw() {   
  background(132,208,211);
  stroke(241,242,205 );
  strokeWeight(.9);
  
  float Size = map( mouseX, 400, width, 0, 300 );
  println( mouseX + " : " + Size);
  
  for (int x = 0; x < width; x += 80) {
    for (int y = 0; y < height; y+=50) {
      line(x, y, Size, Size);
    }
  }
 stroke(193,97,6);   
 strokeWeight(.7);
  println( mouseX + " : " + Size);
  
  for (int x = 0; x < width; x += 10) {
    for (int y = 0; y < height; y+=90) {
      line(x, y, Size, Size);
    }
  }
    println( mouseX + " : " + Size);
  

}
