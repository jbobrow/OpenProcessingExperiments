
void setup() {
  size (600, 600);
  smooth();
}
void draw (){
  ///texture///
 
   
  for (int x=0; x < width; x=x+45  
  ){
  for (int y=0; y < height; y=y+45){
    
    ///colore pallini//
   fill(#000005);
 ellipse (x, y, 50, 50);
  
   
 if (mousePressed) {
  
 noStroke();
     
   fill(#FFFFFF);
  rect(x, y, 30, 30);
   fill(#FF0004);
   rect(x,y,200,200);
    
 }
        
}
 }
  }

