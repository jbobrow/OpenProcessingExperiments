
// Timmis Paint_CreativeStroke

void setup() {
  size(800, 600);
  background(255);
  smooth();
  
}

float Mspeed;
 
void draw() {
  
  Mspeed=abs(mouseX-pmouseX); 
  println(Mspeed);
  noStroke();

  if (mousePressed == true) {
    strokeWeight(0.1+Mspeed/20);
    stroke(0, 25); //stärke der abspreizenden strokes
    strokeWeight(0.1+Mspeed/20);
    line(mouseX, mouseY, width, mouseX); 
    line(mouseX, mouseY, 0, mouseX); 
    //"main stroke"
    stroke(0); 
    strokeWeight(0.5+Mspeed/100);
    line(pmouseX, pmouseY, mouseX, mouseY);
    
  }
    //farbwechsel auf beliebiger taste
    if (keyPressed == true) {
    background( random(255), random(255), random(255) ); 
  }
}
 
 //optional mit red dots
 
void mouseMoved() {
    float taille_ellipse=Mspeed/3;     //größe der dots
    fill(random(255), random(255), random(255));
    ellipse(mouseX+random(-10,10), mouseY+random(-10,10), taille_ellipse,taille_ellipse);
  
 
}
