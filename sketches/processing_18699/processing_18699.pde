
void setup(){
  background(0);
  smooth();
  size(250,250);
}

void draw(){

    if(mousePressed){
      strokeWeight(10);
      stroke(random(255),random(255),random(255));
      line(random(height),random(height),random(height),random(height));


  }
}




