
void setup(){
  size(800,800);
  background(255);
}
void draw(){
  fill(255);
  
  if ((keyPressed == true) && (key == '1')){
    fill(255);
    strokeWeight(10);
    point(mouseX, mouseY);
} 
  else if ((keyPressed == true) && (key == '2')){
    strokeWeight(2);
    for (float i = 0; i < 50; i+=2){
      point(mouseX+i, mouseY+i); 
} 
  }
  else if ((keyPressed == true) && (key == '3')){
    strokeWeight(3);
    for (float i = 0; i < 6; i++){
      ellipse(mouseX+ i*i, mouseY, i, i);
}
  }
  else if ((keyPressed == true) && (key == '4')){
    rect(mouseX, mouseY, 33, 33);
} 
}


