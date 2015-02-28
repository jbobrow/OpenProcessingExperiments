
void setup (){
  size (600,600);
  background(0);
  noStroke();
  smooth();
  colorMode(HSB,360,100,100,100);
}
 
void draw (){
  for(int i=0; i<width; i++){ //rainbow circle loop
    float colorValue = map(i,0,width,0,700);
    noFill();
    stroke(colorValue,100,100,100);
    ellipse(300,300,i*10,i*10);
  }
  for (int x = 20; x< width-20; x+=10){ //white dash loop
    for (int y = 20; y<height-20; y+=10){ 
      if (x<=width) {
        float lineSize = (map(mouseX,0,width,5,25));
        line(x, y, x-5, y-5);
        float ellSize = (map(mouseX,0,width,5,25));
        stroke(#ffffff);  
      }
    }
  }
}


