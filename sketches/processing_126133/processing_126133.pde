
int cnt = 0;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255,255,255);  //set background white
}

void draw() {  //draw function loops 
  noStroke();
  fill(random(255),0,0,50);
  
  if(mousePressed == true && (mouseButton == LEFT)) { //add some interaction
  for(int i = 0; i < 40; i = i+1){
    ellipse(mouseX+random(55), mouseY+random(55), 20+random(20), 20);
  }
  }
  for(int i = 0; i < 4; i = i+1)
  {
  ellipse(random(0,500), random(0,500), 20+random(20), 20+random(20));
  }
}
