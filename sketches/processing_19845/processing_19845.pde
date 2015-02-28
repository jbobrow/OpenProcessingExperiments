
int eyelids = 0;
 
void setup() {
  size (600,600);
  colorMode(HSB, 175);
  background(175, 125, 125);
   
  smooth();
  
}
 
void draw() {
  eyelids = int(random (125));
   
  //stroke (eyelids, 0, 0, 0);
  fill (eyelids, 100, 60, 10);
  ellipse (270,280,mouseX,mouseY);
    
}
 
void mousePressed (){
 background(175, 125, 125);
   
}
 

