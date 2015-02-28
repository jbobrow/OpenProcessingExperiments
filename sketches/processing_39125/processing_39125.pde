


void setup(){
  size(400,400);
  background(random(height),random(width),0);
}

void draw(){
  circles(random(width),random(height),25);//function called 'circles' being started here, with the parameters
  noLoop();
}


//circles function using established variable/arguments creats concentric circles with random fills

void circles(float cx, float cy, float w){

  fill(random(width),random(height),0,75);
  for(float count=0; count<=10; count++){
  strokeWeight(count/4);
  ellipse(cx,cy,w+=10,w+=10);
  }
    

}

