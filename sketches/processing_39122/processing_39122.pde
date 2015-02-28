
//Danielle Scesney
//5.1

void setup(){
  size (400,400);
  background(0);
  smooth();
}

void draw(){
  for (int x=0; x<width; x+=30){
    for (int y=0; y<width; y+=30){
      dots (x,y); //sets up the grid for the dots.
    }
  }
  
}

void dots (float x, float y) {
  pushMatrix();
  translate (x,y);
  
  //creates a grid of points.
  for(int a=0; a<20; a+=20/3){
    for(int b=0; b<20; b+=20/3){
      
    stroke(random(255));
    strokeWeight(2);
    point(a,b);
    }
  }
noLoop();
  popMatrix();
}
  
  

