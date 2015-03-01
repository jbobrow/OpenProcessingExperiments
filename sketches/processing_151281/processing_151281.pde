
void setup () {
  size(600, 600, P3D);
  background(0);
}

void draw () {
  title();
  
  camera(30.0, mouseY, 220.0,0.0, 0.0, 0.0,0.0, 1.0, 0.0);
   
  translate(random(width),random(height), random(-1000));
  fill(10,mouseX,mouseY,20);
  strokeWeight(random(2));
  stroke(255);
  sphere(50);
  
if (keyPressed) { 
    setup(); 
  } 

}

void title() {  
  fill(127); 
  textAlign(RIGHT); 
  text("Hyeri Kim, Untitled, Dynamic Media, 2014", width-50, height-20); 


} 
