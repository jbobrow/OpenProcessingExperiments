
void setup(){
  size(1080,720);
  //the below thing is the background color
  background(mouseX,mouseY,#C6A2A2);
  
}

void draw(){
  //if i put background here there will be no trail
  if(mousePressed){
  stroke(#C703FF);
  fill(mouseX,#C703FF);
  ellipse(mouseX,mouseY,mouseX,mouseY%5);
  ellipse(mouseY,mouseX,mouseX,mouseY%5);
  
    stroke(#74FF79);
    fill(mouseY,#74FF79);
    ellipse(mouseX,mouseY,mouseX,mouseY);
  }
  else{
  }
}


