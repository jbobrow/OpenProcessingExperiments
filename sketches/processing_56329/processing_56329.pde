
void setup(){
  size(400, 400);
  frameRate(30);
  smooth();
}
void draw(){

float durchmesser = random(100);
fill(0,random(255),random(255),50);
noStroke();
//stroke(255,255,255);
strokeWeight(random(10));
ellipse(mouseX, mouseY, durchmesser, durchmesser);

}

