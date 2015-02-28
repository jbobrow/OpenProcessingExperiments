
/* 
 Triangles 2
 
 Made by @ramayac
 @date 13/06/2013
*/
color bg = #DCFF51;

void setup(){
  size(900, 600);
  background(bg);
  smooth();
}

void draw(){
  background(bg);  
  int step = 30;
  for(int x = -step; x < width+step; x+= step){
    for(int y = -step; y < height+step; y+= step){  
      tri(x, y);
    }
  }
  
  noLoop();
}

void tri(float x, float y){
  float t = random(1);
  float c = random(1);
  
  //noStroke();
  stroke(#E5155C);
  if(c < 0.5){
    fill(#303296);
    //stroke(0);
  } else {
    fill(#26E8A5);
    //stroke(255);
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
