
void setup() {
  size(800, 600);
  background(0);
  // sert à enlever l'aliasing
  smooth();
}

float Mspeed;



void draw() {
  Mspeed=abs(mouseX-pmouseX) ;
    if (mousePressed == true) {
    strokeWeight(random(0,5));
    stroke(random(0,255), random(0,255), random(0,255), random(0,255));
    line(random(400), mouseX, random(800), mouseY);
    line(mouseX, random(400), mouseY, random(800));
    //line(random(250,300), mouseY, random(130,200), random(300,350));

    strokeWeight(0.5+Mspeed/20);

   }
}  

