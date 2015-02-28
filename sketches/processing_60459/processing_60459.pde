
float r=0;

void setup(){

  size(800, 600);
  ellipseMode(CENTER);   
  smooth();
  
}

void draw(){

  background(0);
  translate(width/2,height/2);
  rotate(radians(r));
  for(int i=0; i<360; i++){
    
    pushMatrix();
      rotate(radians(i));
      translate(i/2,i/2);
      strokeWeight(1);
      ellipse(0,0,sin(radians(r*i))*50,sin(radians(r*i))*50);
    popMatrix();
    
  }
  
  r = map(mouseX,0,width,0,360);
  
}

