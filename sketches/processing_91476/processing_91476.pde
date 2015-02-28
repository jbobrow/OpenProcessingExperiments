
void setup(){
size(400,400);
background(255);
noStroke();
}
void draw() {
  
  if (keyPressed) {
   //Subtraktive Hintergrund
   if (key == 's' || key == 'S') {
  background(255);
   }
   //Additive Hintergrund
   if (key == 'a' || key == 'A') {
  background(0);
   }
    //Subtraktive Farbmischung
        
    if (key == 'y' || key == 'Y') {/* nur bei y oder = || bei Grossem Y wird gezeichnet*/
                                  
//Yellow
fill(255,255,0,10); //RGB werte und 4 ist alphakanal
ellipse(130,230,200,200);

      }
      
      if (key == 'm' || key == 'M') {
        // Magenta
fill(255,0,255,10);
ellipse(200,140,200,200);
      }
      
        if (key == 'c' || key == 'C') {
// cyan
fill(0,255,255,10);
ellipse(270,230,200,200);
      }

    //Additive Farbmischung
    if (key == 'r' || key == 'R') {/* nur bei y oder = ||
                                   bei Grossem Y wird gezeichnet*/ 
fill(255,0,0,10); //RGB werte und 4 ist alphakanal
ellipse(130,230,200,200);

      }
      
      if (key == 'g' || key == 'G') {
        // Green
fill(0,128,0,10);
ellipse(200,140,200,200);
      }
      
        if (key == 'b' || key == 'B') {
// blue
fill(0,0,255,10);
ellipse(270,230,200,200);
      }
      //Mauskonfiguration
   if (mouseButton == LEFT) {//mit linkem click
   //Yellow
fill(255,255,0,10); //RGB werte und 4 ist alphakanal
ellipse(130,230,200,200);
 // Magenta
fill(255,0,255,10);
ellipse(200,140,200,200);
// cyan
fill(0,255,255,10);
ellipse(270,230,200,200);
  }else if (mouseButton == RIGHT) {//mit rechtem click
//red
fill(255,0,0,10); //RGB werte und 4 ist alphakanal
ellipse(130,230,200,200);
 // Green
fill(0,128,0,10);
ellipse(200,140,200,200);
// blue
fill(0,0,255,10);
ellipse(270,230,200,200);
}
}

}

