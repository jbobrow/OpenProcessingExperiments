
float a = 30; //Creates a variable. 
 
void setup() {
  size(640, 640); //Adjusts size of the screen
  noStroke(); //Makes it so the ellipses will not have lines

}

void draw() { 

  if (keyPressed == true) {
fill(random(25,30), random(55,255), random(55,210));
} else {
fill(random(55,255), random(0,2), random(55,255));     //Makes it so everytime you press a key it changes the colors.
}
  background(40); //Changes the background.
  translate(width/2-25, height/2);
  for (int i = 0; i < 360; i+=a) {
    for(int q = -36; q < 36; q++){
      float x = i/(a/6)+tan(radians(dist(i/(a/2), i/(a/2), 0, 0)+q*50+frameCount))*a;
      ellipse(x, q*10, 5, 5); //Creates the Eliipses and tells the ellipses where to move.
          }
      }
  }
  
  
  
