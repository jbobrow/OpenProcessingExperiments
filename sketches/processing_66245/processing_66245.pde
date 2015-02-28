
int velocity = 5;
int ypos = 25;
int radius = 15;
boolean down = true;

void setup(){
  size(500, 500);
  smooth();
  background(93, 177, 255);
  noStroke();
  frameRate(120);
}
void draw(){
  background(93, 177, 255);
  fill(255, 0, 55);
  ellipseMode(CENTER);
  ellipse(width/2, ypos, radius * 2, radius * 2);
  
  if(ypos == radius) {
    down = true;
  }
  
  if(ypos == height - radius) {
    down = false;
  }
    
  if(ypos >= radius && down == true){
    ypos++;
  }
    
  if(ypos <= height-radius && down == false){
    ypos--;
   
  }

}

