
//by Marion Desmonnet
//random lines with random stroke weight and color
//click to erase the drawing

void setup(){
    background(230);
  size(700,700);
  smooth();
}

void draw(){
}

void mouseMoved(){
  stroke(random(255),0,random(255),random(255));
  strokeWeight(random(10));
  line(mouseX,mouseY,mouseY,mouseX+60); 
}

void mousePressed(){
  background(230);
}


