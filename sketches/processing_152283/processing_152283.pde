
void setup() {
size (600,600);
int x = (int) random(50,300);
int y = (int) random(50,300);
  frameRate(5);
}


 
void draw() {
//  frameRate(1);
strokeWeight(5);
//beginShape(POINTS);
//fill(random(250));
fill( random(250), random(250), random(250) );

beginShape();
vertex(random(50,550), random(50,550));
vertex(random(50,550), random(50,550));
vertex(random(50,550), random(50,550));
vertex(random(50,550), random(50,550));
endShape(CLOSE);
}
