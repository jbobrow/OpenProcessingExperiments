


void setup() {  //setup function called initially, only once
  size(250, 250);
 }

void draw() {  //draw function loops 
 background(255,255,255);
 ellipse(125,125,125,125);
 
 if (mousePressed){
 fill (255,0,0);
 }
 else{
 fill(0,255,0);
 }
}
