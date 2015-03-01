
void setup()
{
  size(600,600);
  frameRate(30);
}
void draw() {
  background(0); 
  noStroke(); 
  if(mousePressed){  
  noStroke();
  fill (255);
   noStroke();
  for (float y=0; y<height; y+=4) {
  float rainX= random(1,width); 
  float rainSz= random(5,height);
  ellipse( rainX, Y, rainSz, rainSz);
  }
  }
  strokeWeight(1);
  stroke(250, 250);
  for(int i=0; i<30;i++){
  rect(random(width),random(height),4,20);
  } 
  frameRate(6); 

}

