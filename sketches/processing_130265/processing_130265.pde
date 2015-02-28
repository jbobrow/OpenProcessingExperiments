
int counter;

void setup() {  //setup function called initially, only once
  size(400,400);
  frameRate(90);
;
}

void draw() { 
background(67); 
stroke(100,150,192);
line(0,random(250,220),400,random(250,220));
}
  
