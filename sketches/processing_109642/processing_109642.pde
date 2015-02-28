
//Leung Sze Mei //Mei//52631410//

void setup(){
  size(400,400);
  frameRate(20);
  noStroke();
  smooth();
}

int bg=255;
int value = 255;
void draw(){

  background(bg);
  bg=bg-1;
  if (bg==-1)
   bg=255;
   
  float x= mouseX;
  float y= mouseY;
  float ix=width -mouseX;
  float iy =mouseY- height;
 

 fill(value);
  ellipse (x, height/4, y, y);
  
  fill(200);
  ellipse (ix, height/6, iy , iy); 
}
  
void mouseClicked() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}


