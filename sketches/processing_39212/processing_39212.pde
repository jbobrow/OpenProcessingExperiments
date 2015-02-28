
//Homework 5.1
//Tommy Coggin
void setup(){
  size(400,400);
}

void draw(){
  for( int a=25; a<width; a+=50){  //creates horizontal part of grid
    for( int b=25; b<height; b+=50){//creates vertical part of grid
      circle (a,b);
    }
  }  
}

//function to create circles with random color and size
void circle(float x, float y){
  pushMatrix();
  translate(0,0);
  noFill();
  strokeWeight(random(2,6));
  stroke(random(0,255),random(0,255),random(0,255),100);
  ellipse(x,y,random(10,50),random(10,50));
  popMatrix();
}

