
void setup(){
  size(600,600);
  background(255,150,0);
}

void draw(){
  for(int i=1; i<width; i++){
    fill(255, 255, dist(mouseX,mouseY,i*25,i*25), 80);
    ellipse((i*25),i*25,100,10*i);
    fill(255, dist(mouseX,mouseY,i*25,100),255, 80);
    ellipse(i*25,5,100,10+i);
    fill(255, 255, dist(mouseX,mouseY,i*25,i*25), 80);
    drawRect(width-(i*i), i*i, i*i, color(i*15,50,250));

  }
}

void drawRect(float rectX, float rectY, int rectWidth, color c){
  noFill();
  stroke(c);
  strokeWeight(2);
  rect(rectX, rectY, rectWidth, rectWidth);
}


