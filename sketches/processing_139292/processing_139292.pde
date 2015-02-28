
void setup(){
  size (800,800);
  smooth();
  
}

void draw(){
    float c = 0;
      translate(width/2,height/2);
while( c < 100){
  


  rotate(0.5);
  //rectMode(CENTER);
  //fill(random(255),random(255),random(255));
  fill(255);
 // noStroke();
  rect(mouseX,mouseY, 20,20);
  c = c + 1;
  
  
  
}
if (keyPressed == true){
    saveFrame("spiral-######.tiff");
}
}
