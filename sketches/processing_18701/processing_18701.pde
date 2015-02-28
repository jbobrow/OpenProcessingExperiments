
float y = 10.0;
float x = 10.0;
float speed = 1.0;
float radius = 5.0;
int direction=1;

void setup (){
  size (250,250);
  smooth();
  noStroke();
  ellipseMode(RADIUS); 
}

void draw (){
  fill(0,3);
  rect(0,0,width,height);
  fill(255);
  y+=speed*direction;
  x+=speed*direction;
  
  fill(x,y,random(170,240),80);

  ellipse(25,y,radius,radius);
  ellipse(65,y,radius,radius);
  ellipse(105,y,radius,radius);
  ellipse(145,y,radius,radius);
  ellipse(185,y,radius,radius);
  ellipse(225,y,radius,radius);
  
  ellipse(45,height-y,radius,radius);
  ellipse(85,height-y,radius,radius);
  ellipse(125,height-y,radius,radius);
  ellipse(165,height-y,radius,radius);
  ellipse(205,height-y,radius,radius);

  ellipse(x,25,radius,radius);
  ellipse(x,65,radius,radius);
  ellipse(x,105,radius,radius);
  ellipse(x,145,radius,radius);
  ellipse(x,185,radius,radius);
  ellipse(x,225,radius,radius);
  
  ellipse(height-x,45,radius,radius);
  ellipse(height-x,85,radius,radius);
  ellipse(height-x,125,radius,radius);
  ellipse(height-x,165,radius,radius);
  ellipse(height-x,205,radius,radius);
  
  if((y>height-radius)||(y<radius)) {
  if((x>height-radius)||(x<radius)){
    direction=-direction;
  }
  }
}



