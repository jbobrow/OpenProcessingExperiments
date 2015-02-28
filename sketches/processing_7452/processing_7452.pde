
void setup(){
  size (600, 600);
  background (0);
  stroke (0);
  smooth ();
  fill (255,0,0,15);
  drawPattern(width);
  translate(width/2, height/2);
  rotate (PI/4);
  float sz = 300;
  
  for (int i=0; i<200; i++){
    stroke(0,i);
  poly(random(20,200), int(random(4,4)), random(TWO_PI));
  }

  for (int i=0; i<sz; i++){

    strokeWeight(.9);
    rotate(PI/(i+1));
    stroke(255,15);

    line(0,0,sz-1,sz-1);
    line(0,0,1-sz,1-sz);
    stroke(0,5);
    line(0,0,1/sz,1/sz);
    line(0,0,1*sz,1*sz);
  }
}

void drawPattern (int x){
  for(x=0; x<width; x+=20){
    fill (255,0,0,15);
    ellipse (300,300, x, x);
  }
}




