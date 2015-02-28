

PImage tiffa;

void setup(){
    size(500,500);
     smooth();
     tiffa = loadImage ("tiffa.jpg");
      frameRate(100000);
  
}
void draw(){ 
   noStroke();
   float cs =200;
   
  for (int j = 0; j<height/cs; j++){
   for(int i =0; i<width/cs+1; i++){
    
    image (tiffa,500,500); 
     fill(tiffa.get(mouseX,mouseY));
      ellipse (mouseX,mouseY,random(10),random(10));
}
 }
  }



