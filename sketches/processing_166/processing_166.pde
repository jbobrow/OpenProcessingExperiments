
void setup(){
  size(300,300);
  smooth();
  noFill();
  strokeWeight(1);
  render();
}

void draw(){}
void keyPressed() {
  switch(key){
  case '+': strokeWeight(g.strokeWeight+1);break;
  case '-': strokeWeight(max(g.strokeWeight-1,0));break;
  }
  render();
}
void render(){
  background(255);
  for(int i=0; i< 15; i++){
    for(int j=0; j < 15; j++){
      pushMatrix();
      translate(i*20, j*20);
      if(random(3)>1){
        arc(0, 0, 20, 20, 0, PI/2);
        arc(20, 20, 20, 20,PI, TWO_PI-PI/2);
      }
      else{
        arc(20, 0, 20, 20, PI/2, PI);
        arc(0, 20, 20, 20, TWO_PI-PI/2, TWO_PI);
      }
      popMatrix();
    }
  }
}



