
void setup(){
  size(640,480);
  noStroke();
  smooth();
  background(0);
}

void draw(){
  veil();
  squares();
}


void squares(){
  float cuad=mouseX;
  float tam=20;
    for(int x=0; x<640; x+=30){
    for(int y=0; y<480; y+=30){
      noFill();
      stroke(mouseY,mouseX,255);
      rotate(cuad);
      rect(x,y,tam,tam);
    }
  }
}

void veil(){
  pushMatrix();
  fill(0,220);
  rect(0,0,640,480);
  popMatrix();
}

