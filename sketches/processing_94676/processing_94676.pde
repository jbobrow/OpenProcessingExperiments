
float change2 = 1.1;


int winkel;
int change = 30;
PFont f;
void setup() {

  size(800, 800);
  f =createFont("Helvetica", 14, true);
  winkel = 0;
} 
void draw() {
  background(0);
  textAlign(CENTER);
  textFont(f, 14);
  fill(255);
  
  text("use mouse ", 400, 200);
  noFill();

  

  strokeWeight(1);
  smooth();
  
  for (int i = mouseY; i<800 ;i += 13) {

    stroke(255);
    line(0, height/2, width, height - width *tan(radians((winkel-change)+i/2)));
    line(width, height/2, 0, height - width*tan(radians(winkel-change+i/2)));

    //line(0, height/2, width, height - width *tan(radians(winkel-i)));
  }
}





