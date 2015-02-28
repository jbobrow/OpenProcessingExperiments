
ArrayList newSpots = new ArrayList();

boolean bover = false;
int spotSize = 50;
int spotCol = 50;

void setup(){
  size(600,600);
}

void draw(){
  background(250);
  if(bover){
    for(int i = 0; i < newSpots.size();i++){
      PVector newSpot = (PVector) newSpots.get(i);
      ellipse(newSpot.x,newSpot.y,spotSize,spotSize);
      fill(spotCol);
    }
  }
}

void mouseReleased(){
  bover = true;
  float tmpX = mouseX;
  float tmpY = mouseY;
  newSpots.add(new PVector(tmpX,tmpY));
  
}


