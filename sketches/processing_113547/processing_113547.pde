
int xPos;
int yPos;
int xPos1 = 600;
int xPos2 = 600;
int size = 250;

void setup() {
  size(600, 600);
}
void draw() {
  background(0);
  fill(255,170,0);
  noStroke();
  if(xPos<width)  {
    xPos+=1;
    
    } else{
        //do nothing
      }
            if(xPos2<601) {
        xPos2-=1;
      } else {
        
        //do nothing
      }
       if(yPos<width) {
        yPos-=1;
      } else {
        
        //do nothing
      }
      
  ellipse(xPos, 300, size, size);
  ellipse(xPos2, 300, size, size);
  ellipse(300, xPos, size, size);
  ellipse(300, yPos, size, size);
}


