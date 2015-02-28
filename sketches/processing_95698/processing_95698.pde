
void setup(){
  size(350,350);
}

void draw(){
  
  background(255);
  
  //left eye
  fill(255);
  stroke(0);
  ellipse(100,150,150,150);
  if(mouseX > 100 && mouseX < 210 && mouseY > 100 && mouseY < 210){
    stroke(0);
    fill(0);
    ellipse(mouseX-50,mouseY,50,50);
      }else{
    stroke(0);
    fill(0);
    ellipse(100,150,50,50);
  }
  
  //right eye
  fill(255);
  stroke(0);
  
  ellipse(250,150,150,150);
 
  if(mouseX > 160 && mouseX < 250 && mouseY > 100 && mouseY < 210){
    stroke(0);
    fill(0);
    ellipse(mouseX+50,mouseY,50,50);
  }else{
    stroke(0);
    fill(0);
    ellipse(250,150,50,50);
  }
}
