
PImage bild;
 
void setup (){
  size (700, 500);
  smooth();
  noCursor();
  bild = loadImage ("leiter.jpg");
  }
 
void draw() {
  background(bild);
   
  if (mousePressed == true) {
 
    for ( int x=0; x<= width; x+=40) {
      for ( int y=0; y<=height; y+=40) {
        float durchmesser = 20-dist(mouseX, mouseY, x, y)/30;
        durchmesser += dist(width/2, height/2, x, y)/30;
 
        if (durchmesser > 0) {
          strokeWeight(durchmesser/5);
          stroke(bild.pixels[0]);
         
          line(x, y, x+durchmesser, y+durchmesser);
        }
      }
    }
  }

 
   
  else {
    for ( int x=0; x<= width; x+=5) {
      for ( int y=0; y<=height; y+=5) {
        float durchmesser = 50-dist(mouseX, mouseY, x, y)/30;
        durchmesser += dist(width/2, height/2, x, y)/30;
        if (durchmesser > 0) {
          strokeWeight(durchmesser/40);
          stroke (bild.pixels[(x + width)]);
          float a = atan2(mouseY-height/2, mouseX-width/2);
          rotate(a/20);
          line(x, y, x+durchmesser, y+durchmesser);
        }
      }
    }
  }


}
 
void keyPressed () {
 if (key == 's') {
   println("Frame abspeichern");
   saveFrame("leiter-####.png");
 }
}


