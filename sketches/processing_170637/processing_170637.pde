

void setup() {
size(400,400); 
background (255);
strokeWeight(2);
frameRate(20);
}

  void draw(){
  fill(255,255,53);
rect(random(400),random ( height),25,80);
fill(225,155,53);
rect(random(400),random ( height),15,60);
fill(155,165,90);
ellipse(random (width),random(350),20,50);
}
