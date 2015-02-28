
/* 
 Triangles
 
 Made by @ramayac
 @date 13/06/2013
*/
color bg = #0393FF;

void setup(){
  size(900, 600);
  background(bg);
}

void draw(){
  background(bg);
  noStroke();  
  
  int step = 60;
  for(int x = step; x < width-step; x+= step){
    for(int y = step; y < height-step; y+= step){  
      tri(x, y);
    }
  }
  
  noLoop();
}

void tri(float x, float y){
  float t = random(1);
  float c = random(1);
  
  if(c < 0.5){
    fill(0);
  } else {
    fill(255);
  }
  
  pushMatrix();
  
  translate(x, y);
  if(t < 0.5){
    triangle(0, 0, 60, 0, 30, 60);
  } else {
    triangle(0, 60, 30, 0, 60, 60);
  }
  
  popMatrix();
}

void mousePressed(){
  redraw();
}
