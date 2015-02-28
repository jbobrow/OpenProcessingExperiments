
void setup(){
 size(700,400);
 smooth();
 background(77,185,255);
 strokeWeight(8);
}
void draw(){
  fill(254,255,0);
 background(77,185,255);
 

 ellipse (350,150,200,200); // face
 fill (0);
 ellipse (320, 120, 25, 30); //left eye
 ellipse (380, 120, 25, 30); //right eye
 noFill(); // Smile
 beginShape();
 vertex(300, 180);
 bezierVertex(310, mouseY, 390, mouseY, 400, 180);
 endShape();
}
