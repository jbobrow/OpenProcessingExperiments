
int mode = 3;
float x,y,angle;

void setup(){
  size(1000,750);
  smooth();
  background(0,0,0);
  fill(255);
  noStroke();
  angle = 2;
  x = 1;
  y = 2;
}

void draw(){
  if(mode == 1){
  float ellSize = 0;
  for(int x = 0; x < width; x+=8){
    for(int y = 0; y < height; y+=8){
      ellSize = sin(x*y)*10;
      fill(255,pmouseX,pmouseY);
      ellipse(mouseX,100,32,ellSize);
      rotate(radians(pmouseX));
    }
  }
  }
    else if (mode == 2){
  float ellSize = 0;
  for(int x = 0; x < width; x+=8){
    for(int y = 0; y < height; y+=8){
      ellSize = sin(x*y)*10;
      fill(255,pmouseX,pmouseY);
      ellipse(x,y,ellSize,ellSize);
      rotate(radians(pmouseY));

    }
}
    }
    else if (mode == 3){
  float ellSize = 0;
  for(int x = 0; x < width; x+=8){
    for(int y = 0; y < height; y+=8){
      ellSize = sin(x*y)*10;
      fill(255,pmouseX,pmouseY);
      rect(x,y,ellSize,ellSize/pmouseY);
      rotate(radians(pmouseY));
    }
}
      

    }
}
    


  void keyPressed(){
  if(key == '1'){
    mode = 1;
  }
    if(key == '2'){
      mode = 2;
    }
    if(key == '3'){
      mode = 3;
    }
  }


