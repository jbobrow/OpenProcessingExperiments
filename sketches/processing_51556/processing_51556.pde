
//interactive pattern

void setup(){
  size(600,600);
  background(255);
  colorMode(HSB,360,100,100,100);
  smooth();
}

void draw(){
  //i corresponds to width of shape
  for (int i=0;i < width; i+=40){
    for (int j=0;j < height; j+=40){
      if(mouseX > i && mouseX < i+200 && mouseY > j && mouseY < j+200){
        fill(j/8,i/8,100,50);
      } else {
        fill(i/10,j/10,100,100);
      } 
//      if(i%5==30){
//        stroke(0);
//      }
      //changing the size makes COOL STUFF
      ellipse(i,j,100,100);
      smooth();
      stroke(255);
    }
  }
}
      

