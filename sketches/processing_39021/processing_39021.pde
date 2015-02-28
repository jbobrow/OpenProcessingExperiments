
void setup(){
  size(400,400);
  background(255);
  smooth();
}

void draw(){
  for(int lineX=50; lineX<width-40; lineX+=50){ //determines spacing on x axis
    for(int lineY=50; lineY<height-40; lineY+=50){ //determines spacing on y axis
      sun(lineX,lineY);
      noLoop();
    }
  }
}

void sun(float x, float y) {
  pushMatrix();
  translate(x,y); //the change of the origin of the star
  
  for (int i=0; i<360; i+=30){ //line rotation
    stroke(255,145,0);
    strokeWeight(2);
    rotate(radians(30));
    line(0,0,10,10);
    stroke(246,255,0);
    fill(246,255,0);
    ellipseMode(CENTER);
    ellipse(0,0,10,10);
    
  }
  popMatrix();
}

