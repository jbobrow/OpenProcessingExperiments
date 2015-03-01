

void setup() {
  size(600,600);
  
  noStroke();
  frameRate(1);
  randomSeed(hour()+minute()+second()+millis());
  
}

void draw() {
  background(0);
  int cells = 5;
  int gapsize = 15;
  float cellsize = (width-gapsize*(cells+1)) / (float)cells;
  for(int i=0; i<cells; i++){
    for(int j=0; j<cells; j++){
      //draw shadow
      int shadowoffset = (int)random(-10,10);
      fill(50);
      rect(gapsize*(i+1)+cellsize*i+shadowoffset,gapsize*(j+1)+cellsize*j+shadowoffset,cellsize,cellsize);
      
      int celloffset = (int)random(-10,10);
      int cellcolor = (int)random(1,5);
      switch(cellcolor){
        case 1:fill(255,255,81);break;
        case 2:fill(255,83,83);break;
        case 3:fill(40,148,255);break;
        case 4:fill(71,216,46);break;
        default:break;
      }
      rect(gapsize*(i+1)+cellsize*i+celloffset,gapsize*(j+1)+cellsize*j+celloffset,cellsize,cellsize);
    }
  }
  
  

}
