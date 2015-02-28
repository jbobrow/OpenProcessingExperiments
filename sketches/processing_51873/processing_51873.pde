
void setup(){
background(0);
size(500,500);
smooth();
}
void draw(){
  for(int x = 0; x < width; x += 10){
    for(int y = 0; y < height; y += 10){
      rotate(radians(15));
      ellipse(x,y,mouseX,10);
    }
   }
  }

