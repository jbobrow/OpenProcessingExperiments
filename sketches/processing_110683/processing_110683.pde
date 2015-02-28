
void setup(){
  size(400,400);
  background(0, 0, 0);
  colorMode(HSB);
}

color fillValue=color(255, 30, 20);

void draw(){
  cursor(CROSS);
  if(mousePressed==true){
    fill(fillValue);
    noStroke();
    ellipse(pmouseX, pmouseY, 50, 50);
  }
}

void keyPressed(){
  if(key==CODED){
    if(keyCode==SHIFT){
      fillValue=color(random(255),255, 255, 255);
    }
    if(keyCode==CONTROL){
    }
  }
}






