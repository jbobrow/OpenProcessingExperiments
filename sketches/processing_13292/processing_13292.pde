
float ang;
float x = 200;
float y = 200;


void setup() {
  noStroke();
  background(255);
  size(400, 400);
  frameRate(20);
}
 
void draw() { 
      if(mousePressed) {
         float ang = atan2(mouseY-y, mouseX-x);
         translate(200,200);
         rotate(ang);

      beginShape();
        fill(random(255),random(255),random(255),random(255));
        rotate(radians(-90));
        vertex(30,0);
        vertex(30,50);
        vertex (50,50);
        vertex(0,100);
        vertex(-50,50);
        vertex(-30,50);
        vertex(-30,0);
  endShape(CLOSE);
   }


}
