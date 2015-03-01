
int num = 5;    // anzahl der fliesen
int gap = 10;    // abstand dazwischen
float border = 20;  
float cellsize; 
float colorVar;

void setup (){
  size (600, 600);
  noStroke();
  noLoop();
   
  cellsize = (width - (num-1)*gap - (2*border))/ (float)num; 

}

void draw () {
  float x, y;
 
  background(250);
  
 for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        y = border + gap * j + cellsize * j;
        x = border + gap * i + cellsize *i;
        
        y += random (-10, 10);
        x += random (-10, 10);
        
        colorVar = random (1);
        
        if (colorVar < 0.9) {
         fill(#F54A4A,200);
        } else {
          fill(#BC1E1E, 200);
        }
  
          rect(x, y, cellsize, cellsize);
      }
    }
}


void keyReleased() {
 
  if(key == 's'){
    saveFrame("Square_##.jpg");
  }
  if(key =='r'){
  redraw();
  }
}



