

float grados = radians(137.5);
void setup(){
  size(1000, 1000);
}

void draw(){
  background(0);
  noFill();
translate(width/2, height/2);
for(int i=0; i<51; i++) {
rotate(grados);
pushMatrix();
translate(mouseX-1000,mouseY-1000);
circulo(0,0);
 if(mousePressed == true) {
   noFill();
  stroke(250);
   ellipse(mouseY, mouseX, 200, 200);
  }

popMatrix();
}

}
void circulo(int x, int y) {

     translate(x, y);
 

noStroke();

fill (0, 0, 255, 225);
arc(250, 250, 200, 200, radians(0), radians(60));
fill (0, 255, 0, 225);
arc(250, 250, 200, 200, radians(60), radians(120));
fill (255, 0, 0, 225);
arc(250, 250, 200, 200, radians(120), radians(180));
fill (255, 255, 0, 225);
arc(250, 250, 200, 200, radians(180), radians(240));
fill (255, 0, 255, 225);
arc(250, 250, 200, 200, radians(240), radians(300));
fill (0, 255, 255, 225);
arc(250, 250, 200, 200, radians(300), radians(360));

}
