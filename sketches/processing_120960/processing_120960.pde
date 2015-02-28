
int rad;
void setup(){
  size(480, 800);
  colorMode(HSB, 360);
  background(100);
  smooth();
  noFill();
}
 
 void draw(){
  translate(240, 400);
  if(rad < 360){
  rad++;
  } else{
    rad = 0;
  }
  for (int deg = 0; deg <360; deg+=30) {
    pushMatrix(); 
      rotate(radians(deg));
      translate(0, rad);
      
      stroke(rad, 200, 360);
      strokeWeight(0.4);
      ellipse(0, 0, rad, 100);
    popMatrix();
  }
}


