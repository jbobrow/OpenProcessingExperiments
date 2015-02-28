
void setup() {
  size (500, 500);
  smooth();
}
void draw (){
 stroke(0);
  
  for (int x=0; x < width; x=x+80){
  for (int y=0; y < height; y=y+80){
   fill(10,70,80);
 ellipse (x, y, 50, 50);
 
  
 if (mousePressed) {
 
 noStroke();
    
   fill(250,100);
   ellipse(x, y, 30, 30);
   fill(255);
   rect(x,y,200,200);
   
 }
       
}
 }
  }

