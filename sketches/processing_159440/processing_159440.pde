
void setup(){
  size(800,800);
  colorMode(HSB);
  background(0,0,0);
  }
void draw(){
  if (mousePressed){
    stroke(255,0,255);
    line(0,random(width),mouseX,mouseY);
    line(random(height),0,mouseX,mouseY);
     line(height,random(width),mouseX,mouseY);
    line(random(height),width,mouseX,mouseY);
    fill(random(255),random(255),255);
    noStroke();
    ellipse(mouseX,mouseY,9,9);
    }
   
}
