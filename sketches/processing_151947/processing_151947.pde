

color rectStroke= color(0);


void setup()
{
  size(600,600);
  background(255);
  frameRate(15);
 }
 
 void draw()
 {
 
fill(random(255),random(255),random(255),180);
noStroke(); 
ellipse(random(width),random(height),40,40);
 
 
translate(mouseX,mouseY);
rotate(frameCount/5.0);

if (mousePressed) {
 
  noFill();
  stroke(rectStroke);
 strokeWeight(random(1,6));
 translate(1,15);
 rotate(0.25);
  scale(0.80);
 rect(0,0,random(40,120),random(60,200));
 
 
  }
 } 
  
  void keyReleased()
{
if (key=='c' || key=='C') {
background(255);
rectStroke=color(0);

}
if(key=='b' || key=='B'){
background(0);
rectStroke=color(255);
}  
}

  
