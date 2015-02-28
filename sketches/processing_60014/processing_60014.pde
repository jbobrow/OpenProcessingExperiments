
float rot =1;

void setup(){
  size(400,400);
  smooth();
  noStroke();
  //rectMode(CENTER);
  
}

void draw(){
  //background(0);
  fill(100,50,200,5);
  rect(0,0,width,height);
  fill(255,2);
  float x=0;
  while (x<8){
    float y =0;
    while(y<8){
      draw_rot_rect(50+x*40,50+y*40,25,rot+x+y );
      y+=0.5;
    }
    x+=0.5;
  }
  rot +=0.05;
}

void draw_rot_rect(float x, float y, int rect_size, float r){
  translate(x,y);
  rotate(r);
  rect (0,0,rect_size,rect_size);
  resetMatrix();
  
  
}
  
  
