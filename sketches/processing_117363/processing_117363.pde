
float angle;


void setup() {
  size(800, 800);
  frameRate(20);

  angle=1;

  
  noStroke();
}
void draw() {


 pushMatrix();
 
  translate(width/2, height/2);
  rotate(angle);
 
  for (int i=0; i<=width; i+=100) {
   fill(random(255), random(64), random(64), 20);
   quad(i+5, i+5, i, i,random(width),random(height), i+30,i+30);
  
//ellipse(random(width),random(height),i,i);
}
  popMatrix();


  angle+=random(.5);



}
