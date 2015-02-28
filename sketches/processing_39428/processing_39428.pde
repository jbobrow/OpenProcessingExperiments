
//Irina Shumskaya
//5.1

void setup(){
  size (400,400);
  background(255);
  smooth();
}
 
 //sets up a grid for squares
void draw(){
  for (int x=0; x<width; x+=10){
    for (int y=0; y<width; y+=10){
      rectangles (x,y); 
    }
  }
   
}
 
void rectangles (float x, float y) {
  pushMatrix();
  translate (x,y);
   
  //sets up the order of the squares
  for(int a=0; a<20; a+=10){
    for(int b=0; b<20; b+=10){
       
    stroke(random(0,255));
    strokeWeight(2);
    rect(x,y, 25,25);
    }
  }
noLoop();
  popMatrix();
}
   

