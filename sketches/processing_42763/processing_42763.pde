
void setup(){
  size(400, 400);
  smooth();
}

void draw(){
  background(130, 55, 47);
  if(mousePressed){
    float i = map(mouseX, 0, 400, 0, width);
    float c = map(mouseX, 0, 400, 0, width);
    fill(40, c, 150);
    noStroke();
    ellipse(mouseX, mouseY, i, i);
   
    }
  }
 



