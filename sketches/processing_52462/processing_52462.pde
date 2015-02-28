
PImage  smile = loadImage ("smile1.gif");// IMOPORTANT THIS NEEDS TO BE RESOLVED
void setup(){
 size(900,900);
  smooth();
  strokeWeight(.5);
}

void draw(){
  
  if(mouseX < 50) {
    cursor(CROSS);
  } else {
    cursor(smile);
  }
  fill(255,5);
  rect(0,0, width,height);
  
  for (int i=0; i < width; i+=50){
    pushMatrix ();
    strokeWeight (255);
    ellipse(532,mouseX,853,532);
    fill (150,mouseY,mouseX);
    ellipse(244,253,239,123);
    fill (150,mouseX,mouseY);
    ellipse(602,601,392,502);
        fill (150,mouseY,mouseX);

    popMatrix ();
  }
}

