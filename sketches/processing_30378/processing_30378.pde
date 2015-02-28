
void setup(){
  size(400, 400);
}

void draw(){
  background(100);
  for(int i = 0; i <= width; i = i+30){
    for (int j = 0; j <= height; j = j+30){
      if(mousePressed){
        stroke(100);
        strokeWeight(2);
        rect(i, j, 10, 10);
      }
      else{
      stroke(100);
        strokeWeight(2);
        ellipse(i, j, 10, 10);
      }
    }
  }
}                               
