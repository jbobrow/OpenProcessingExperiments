
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(123);  //set background white
}

void draw() {  //draw function loops 
for (int y = 0; y < height; y = y+30){
stroke(.5);
line(0,y,y,height);
}
}
