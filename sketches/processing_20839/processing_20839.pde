
int eyelids = 0;
 
void setup() {
  size (300,600);
  colorMode(HSB, 175);
  background(15, 16, 16);
   
  smooth();
  
}
 
void draw() {
  eyelids = int (100);
   
  //stroke (eyelids, 0, 0, 0);
  fill (eyelids, 150, 90, 90);
  rect (1,1,mouseX,mouseY);
  ellipse (600,610,mouseX,mouseY);
    
}
 
void mousePressed (){
 background(15, 16, 16);
   
}

