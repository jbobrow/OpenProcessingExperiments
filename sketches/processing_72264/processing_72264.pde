
//so first off I need to set up a series of rectangles in the left hand corner
//of the window.
//then I have to set it such that the postion of each triangle after initial 
//is based off of the mouse postion or at least the reate at which they fall
//then what I have to do is set up a gravity simulation in which the flow continues
//to repeat.
//then I have to change the color of the triangles to some sort of peramiter

void setup(){
  size(700,600);
  background(255);
  smooth();
  frameRate(5);
}

void draw(){
  //draw triangles
  float pntx=mouseX;
  float pnty=mouseY;
  float pntx2=mouseX+40;
  float pnty2=mouseY-40;
  float pntx3=mouseX+80; 
  float gravity=random(0.1,0.5);
  float speed=0;
  for(float cng=speed;cng<=width;cng=cng+gravity){
  triangle(pntx+cng,pnty+cng,pntx2+cng,pnty2+cng,pntx3+cng,pnty+cng);
  fill(130,20,165);
  stroke(0);
  }
}

