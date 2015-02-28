
int rectW=50;
int rectH=50;

void setup() {
  size(500, 500);
  background(255);
  smooth();
}

void draw() {
  fill(255);

  for (int j=0; j<10;j++) {

    for (int i=0; i<10; i++) {
      rect(i*rectW, j*rectH, rectW, rectH);//creates a line of rectangles
      //rect(i*rectW, j*rectH, rectW, rectH);//creates a grid
    }
  }
  if(mousePressed){
    if(mouseX > width/2){
      
      if(mouseY < height/2){
        fill(255,0,0);
        rect(width/2, 0, 250, 250);
      }
      
      if(mouseY > height/2){
        fill(0,0,255);
        rect(width/2,height/2,250,250);
      }
    }
    
    if(mouseX < width/2){
      
      if(mouseY < height/2){
        fill(0);
        rect(0, 0, 250, 250);
      }
      
      if(mouseY > height/2){
        fill(0,255,0);
        rect(0,height/2,250,250);
      }
    }
    
    
  }
}


                
                                
