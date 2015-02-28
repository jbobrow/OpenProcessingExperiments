
void setup(){
size(500,500);
}

void draw(){
  background(0);
  for(float x=0; x<=width; x+=10){
    for(float y=0; y<=height; y+=10){
      //change the circle's size with mouse's movement
      float d=dist(mouseX,mouseY,x,y)/40; 
      circle(x,y,d);
    }
  }
}

void circle(float xPos, float yPos, float size){
  noStroke();
  smooth();
  fill(random(255),random(255),random(255));
  ellipse(xPos, yPos, size, size);
}
