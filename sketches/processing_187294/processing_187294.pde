
void setup(){
  size(500,500);
  background(0);
  noLoop();
  smooth();
}

void draw() {

  frameRate(1);
  strokeWeight(1);
  strokeCap(ROUND);
  strokeJoin(ROUND);
   for(int y=0; y < height; y+=20){
    for(int x=0; x < width; x+=20){
      int tile_selection = int(random(1,3));
      if(tile_selection == 1){
        stroke(255);
        line(x,y,x+20,y+20);
      } else {
        stroke(255);
        line(x+20,y,x,y+20);
     } 
   }
  }  

}

