
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(128);
  rectMode(RADIUS);
  translate(height/2, width/2);
  
}

void draw() {  //draw function loops 
  background(128);
  inte step=0;
  for(int i =0; i<10; i++){
       stroke(#FF0000 -(i*#110000));
      rect(0,0,width-step, height-step);
      step +=random(1,4);
      
  }
}
