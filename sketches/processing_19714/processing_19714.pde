
void setup(){
  size(250, 250);
  smooth();
  background(250);
  noFill();
}

void draw(){
  stroke(250, 250, 0, 100);
  for(int x1 = 0; x1 <= height; x1 += 11){
  for(int x2 = 0; x2 <= width; x2 += 11){
    bezier(0, 0, x1, x2, x2, x1, 250, 250);
    }
  }
  
  stroke(250, 0, 70, 100);
  for(int x1 = 0; x1 <= height; x1 += 11){
  for(int x2 = 0; x2 <= width; x2 += 11){
    bezier(0, 0, x2, x1, x1, x2, 250, 250);
    }
  }
  
  stroke(170, 250, 0, 10);
  for(int x1 = 0; x1 <= height+2; x1 += 11){
  for(int x2 = 0; x2 <= width+2; x2 += 11){
    bezier(0, 0, x2/3, x1, x1, x2/3, 250, 250);
    }
  }
  
  stroke(0, 10);
  for(int x1 = 0; x1 <= height+2; x1 += 11){
  for(int x2 = 0; x2 <= width+2; x2 += 11){
    bezier(0, 0, x2/0.7, x1/2, -x1/5, x2/2, 250, 250);
    }
  }
  
  stroke(0, 10);
  for(int x1 = 0; x1 <= height+2; x1 += 22){
  for(int x2 = 0; x2 <= width+2; x2 += 22){
  bezier(0, 0, x2, x1/2, -x1/2, x2/2, 250, 250);
    }
  }
}

