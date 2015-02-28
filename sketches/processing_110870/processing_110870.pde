
/* 
Week 4 
Introduction to computational arts 
The project plays with the parameters offered in the session. The random function is a key point detonating the image. Random is a property of mathematics and computer, both of which suggest a different aesthetic. 
*/
color strokeColor = color(0, 10);
 
//Setup
void setup() {
 size(800, 600);
 colorMode(HSB, 360, 100, 100, 100);
 noFill();
 background(360);
   
}
 
//draw()
void draw() {
if(mousePressed){
 pushMatrix();
 translate(width/2, height/2);
 int circleResolution = (int)map(1,2,3,4,5 );
 int radius = mouseX-width/2;
 float angle = PI/circleResolution;
  
 //style
 strokeWeight(2);
 stroke(strokeColor);
 

 
  
 beginShape();
 for (int i=0;  i<=circleResolution; i++) {
  float x = 0 + cos(angle*i) * radius*10;
  float y = 0 + sin(angle*i) * radius*10;
  vertex(random(y), random(x));
  }
 endShape();
 
 
 popMatrix();
  
}
}
 
void keyReleased() {
 if(key == DELETE || key == BACKSPACE) background(360);
 if (key == 's' || key == 'S') saveFrame("screenshot.png");
 
switch(key) {
  case '1':
  strokeColor = color(0,10);
    case '2':
  strokeColor = color(360, 100, 64, 360);
    case '3':
  strokeColor = color(52, 100, 71, 10);
 }
}
