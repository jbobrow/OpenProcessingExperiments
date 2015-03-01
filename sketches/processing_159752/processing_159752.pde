
float r;
float g;
float b;
float s;
float diam;

void setup()
{
size(800,800);
background(0);
}

void draw(){

  stroke(r,g,b);
  strokeWeight(s);
  line(mouseX,mouseY,pmouseX,pmouseY);
  line(800-mouseX,mouseY,800-pmouseX,pmouseY);
  
  line(mouseY,mouseX,pmouseY,pmouseX);
  line(800-mouseY,mouseX,800-pmouseY,pmouseX);
  
  r=random(200);
  g=random(200);
  b=random(200);
  s=random(6);
  }

void mousePressed(){
  fill(r,g,b);
  noStroke();
  ellipse(mouseX,mouseY,diam,diam);
  ellipse(800-mouseX,800-mouseY,diam,diam);
  
  diam=random(100);
}

void mouseDragged(){
  fill(r,g,b);
  noStroke();
  ellipse(mouseX,mouseY,diam,diam);
  ellipse(800-mouseX,800-mouseY,diam,diam);
  
  diam=random(100);
}
  

void keyPressed() {
if (key == ' ') background(0);
}




