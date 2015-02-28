
float y;

void setup(){
  y = random(10);
  size(500,500);
  background(0,10,30);
}

void draw(){
  noStroke();
  fill(0,10,30,30);
  rect(0,0,width,height);
  fill(255,120);
  float yy = y;
  //strokeWeight();
  for(int x =0; x < width; x++){
    ellipse(x, noise(yy)*height, 10, 10);  
    yy +=0.05;
  }
  y += 0.03;
}


