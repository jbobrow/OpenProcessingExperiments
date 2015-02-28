
void setup(){
  size(421,440);
  fill(0);
  background(255);

  translate(10,10);

  //hop 
  pushMatrix();
  for(int i=0; i<20; i++){
    hookShape();
    translate(20,0);
  }
  popMatrix();

  translate(0,50);

  //spinning hop
  pushMatrix();
  for(int i=0; i<10; i++){
    pushMatrix();
    hookShape();
    translate(40,30);
    scale(-1,-1);
    hookShape();
    popMatrix();
    translate(40,0);
  }  
  popMatrix();

  translate(0,50);

  //sidle
  pushMatrix();
  for(int i=0; i<10; i++){
    pushMatrix();
    hookShape();
    translate(40,0);
    scale(-1,1);
    hookShape();
    popMatrix();
    translate(40,0);
  }
  popMatrix();

  translate(0,50);

  //spinning sidle
  pushMatrix();
  for(int i=0; i<5; i++){
    pushMatrix();
    hookShape();
    translate(40,0);
    scale(-1,1);
    hookShape();
    scale(-1,1);
    translate(0,30);
    scale(1,-1);
    hookShape();
    translate(40,0);
    scale(-1,1);
    hookShape();
    popMatrix();
    translate(80,0);
  }
  popMatrix();

  translate(0,50);

  //jump
  pushMatrix();
  for(int i=0; i<20; i++){ 
    pushMatrix();
    hookShape(); 
    translate(0,60);
    scale(1,-1);
    hookShape();
    popMatrix();
    translate(20,0);
  }
  popMatrix();

  translate(0,80);

  //spinning jump
  pushMatrix();
  for(int i=0; i<10; i++){ 
    pushMatrix();
    hookShape(); 
    translate(0,60);
    scale(1,-1);
    hookShape();
    translate(40,0);
    scale(-1,1);
    hookShape();
    translate(0,60);
    scale(1,-1);
    hookShape();
    popMatrix();
    translate(40,0);
  }
  popMatrix();

  translate(0,80);

  //step
  pushMatrix();
  for(int i=0; i<19; i++){ 
    pushMatrix();
    hookShape(); 
    translate(10,60);
    scale(1,-1);
    hookShape();
    popMatrix();
    translate(20,0);
  }
  popMatrix();
}

void hookShape(){
  beginShape();
  vertex(0,0);
  vertex(10,0);
  vertex(20,10);
  vertex(20,20);
  vertex(10,30);
  vertex(0,20);
  vertex(10,20);
  vertex(10,10);
  vertex(0,0);
  endShape();
}
