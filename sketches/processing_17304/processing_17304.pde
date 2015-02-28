
float x,y;
void setup() {
  size(960, 400);
  background(255);
  noStroke();  
}

void draw() {  //draw function loops 
  if(mousePressed){
    x = random(width+20)-10;
    y = random(height+20)-10; 
    fill(x/width *255,y/height *255,((x/width + y/height)/2) *255);
    rect(x,y,30,30);
  }
}

                
                                                                
