
int x = 5;
float r = 100;

void setup(){
  size(400, 400);
  smooth();
  background(0);
}

void draw(){
  for(int y = 0; y<= height; y += 20){
    for(int x = 0; x<= width; x += 20){
    ourFirstFunction(x, y);
    }
  }
}

void ourFirstFunction(int xPos, int yPos){ 
  noStroke();
  if(xPos >=1 || yPos >=1){
    r = r-.2;
  }
  fill(0, 150, 255, r);
  ellipse(xPos, yPos, 20, 20);

}



