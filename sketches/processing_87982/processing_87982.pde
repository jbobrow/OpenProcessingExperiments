
int x =0;

void setup() {  
  size(250, 250);
  background(255); 
  colorMode(HSB);  
}

void draw() { 
  x=int(random(365));;
 noFill();
 strokeWeight(1);
stroke(x,255,255,25);
  ellipse(width/2,height/2,x,x);
  
  if(x>360) {x=0;}
}
