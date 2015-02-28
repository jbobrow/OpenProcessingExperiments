
float distanceY;
float distanceX;

void setup() {
  size(255,255);
  background(0);
}

void draw() {

  for (int x=0; x<width; x+=10){
    noStroke();
    distanceX=abs(mouseX-x);
    fill(distanceX,100);
    rect(x,0,10,height);
  } 
    
    for(int y=0; y<height; y+=10){
      noStroke();  
      distanceY=abs(mouseY-y);
      fill(distanceY,100);
      rect(0,y,width,10);
    }
  }

  



