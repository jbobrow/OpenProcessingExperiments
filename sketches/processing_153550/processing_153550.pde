
void setup(){
  size(800,600);
  rectMode(CORNER);
  ellipse(56, 46, 55, 55);
  noStroke();
  frameRate(2);
  randomSeed(hour() + minute()+ second() +millis()); 
}

void draw(){ 
  background(180);
  
  
  int num = (int) random(5,16);
  int gap = (int) random(5,50);
  
  float cellsize = (width - (num - 4) * gap) / (float)num;
  
  println("cellsize = " + cellsize);
  
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
  
   for (int i=0; i<num; ++i) {
      for (int j=0; j<num; ++j) {

        fill(140, 180); // shadow
        rect(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);
        
        fill(70, 255); // shadow
        ellipse(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);
        
         fill(0, 153, 204, 126); // shadow
        ellipse(gap * (i+1) + cellsize * i - offsetX, gap * (j+1) + cellsize * j - offsetY, cellsize, cellsize);

        fill(200, 50, 50, 180); // rectangle
        rect(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize);
      }
    }
} //end of draw 



