
//for the tiny sketch competition, edited for clarity

void setup() {
 size(728,450);
 stroke(255);
}

void draw() {
  for (int c=0; c < 777; ++c) { 
      point(random(width),random(height));
  }
  blend(0,0,width,height,-1,1,width+1,height-3,BLEND);
  // filter(BLUR);
  // filter(ERODE); 
}



