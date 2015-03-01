
void setup(){
  size(400, 400);

}

void draw(){
  background(0);
  
  int res = floor(map(mouseX, 0, width, 5, 40));
  
  fill(255);
  textSize(height*1.5);
  textAlign(CENTER, BASELINE);
  text("A", width/2, height);
  
  loadPixels();
  for(int i = 0; i < width; i += res){
    for(int j = 0; j < height; j += res){
      
      fill(255, 0, 0, 150);
      noStroke();
      if(brightness(pixels[i + (j*width)]) > 10){
        rect(i - res/2, j - res/2, res, res);
      }
    }
  }
}


