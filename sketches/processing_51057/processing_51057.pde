
void setup(){
  size(600,600);
  smooth();
}

void draw(){
 fill(255,mouseX);
 rect(0,0,width,height);
 float speedX = abs(mouseX-pmouseX);
 for(int i = 0;i< speedX; i++){
    strokeWeight(mouseY);
    ellipse(mouseX,mouseY,i*3,i*3);
 }
 
}



