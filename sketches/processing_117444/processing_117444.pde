
void setup(){
  size(800,800);
  smooth();
  
float sw = .1;

  frameRate(3);
   background(255);
}

void draw() {
if (mousePressed){
 sw=sw+1;
    strokeWeight(sw);
    
    
  stroke(255);
  
  stroke(random (255), random (255), random (255));
  float mx = random (mouseX) + random (10,800);
  line(random(mouseX),400,mx, random(mouseY));
  line(400,random(mouseX),mx,random(mouseY));
  line(200,random(mouseY),mx,random(mouseY));
  line(random(mouseX),400,mx,random(mouseY));
  line(random(mouseX),500, mx,random(mouseY));
}}
