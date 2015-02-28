
float r=0, i=0; 
void setup(){
  size(600,400);
  background(0);
  noFill();
}
 
void draw(){
  smooth();
  translate(width/2, height/2);
  rotate(radians(r));
 
  colorMode(HSB,200);
   
  stroke(r%200, 150, 200);
  arc(0, 0, 300, 120, radians(90), radians(270));
   
  if(i>28){   
    noLoop();
  } else {
     r=r+12;
     i++;
  }
}


